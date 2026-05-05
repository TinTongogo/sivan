# CLAUDE.md

本文件为 Claude Code (claude.ai/code) 在此代码库中工作提供指导。

## 项目概述

**Sivan** — AI 智能体团队管理系统。18 个专业智能体 × 69 个模块化技能，通过 DDD 四层架构（domain → infrastructure → application → interfaces）构建。核心能力：

- **多策略路由系统**: 语义/ML/上下文感知/自适应 4 种路由策略协同，SQLite 持久化 + 反馈学习
- **AgentResolver**: 3 阶段语义匹配（精确→归一化→IDF 加权），动态创建/解析智能体
- **契约协作**: 智能体间通过带版本管理的契约文件通信
- **Squad 编排**: 多阶段执行引擎，支持 HITL 逐阶段推进
- **管理控制台**: FastAPI Web 界面 + FastMCP 3.x 服务器

## 关键命令

```bash
uv sync              # 安装依赖（项目使用 uv 包管理器）
uv run python server.py          # 启动 Web + MCP 综合服务
uv run python server.py --mcp-stdio  # STDIO 模式（Claude Desktop）

uv run python -m pytest tests/ -v   # 全部测试
uv run python -m pytest tests/unit/ -v  # 单元测试
uv run python -m pytest tests/unit/test_routing.py -v  # 单文件

uvx ruff check .     # Lint 检查（line-length=120，规则集: E/F/W/I/N/UP/S）
uvx ruff format .    # 自动格式化

uv run alembic upgrade head       # 运行所有迁移
uv run alembic revision -m "desc" # 创建新迁移
uv run alembic current            # 查看当前版本
uv run alembic history            # 查看历史
```

## 架构关键模式

### 分层依赖规则

依赖方向严格单向：**domain ← infrastructure ← application ← interfaces**

- **domain/** — 纯 Python，零外部依赖。定义实体、值对象、仓库接口、领域服务
- **infrastructure/** — 实现层。SQLAlchemy Core、LLM providers、ChromaDB、loguru。不反向导入 application 或 interfaces
- **application/services/** — 编排层。注入具体仓库和服务，组合领域逻辑
- **interfaces/** — 入口层。FastAPI + Jinja2 模板 + FastMCP

### 数据库访问模式

**不使用 SQLAlchemy ORM**，使用 SQLAlchemy Core + 裸 SQL + `_CompatRow` 包装器。

```
infrastructure/persistence/
├── database.py          # 单例 Engine + QueuePool + WAL mode pragma
├── connection.py        # SQLiteConnectionManager（单例 + Thread-Local Session）
├── models.py            # SQLAlchemy Table metadata（用于 metadata.create_all）
└── agent_repo.py        # 各 Repository 实现（execute/executemany + _CompatRow）
```

关键约定：
- 表结构在 `sql/*.sql` 中定义，`models.py` 中声明 metadata，`alembic/versions/` 中管理迁移
- 启动时 `metadata.create_all(engine)` 兜底建表（幂等）
- 所有 Repository 通过 `SQLiteConnectionManager.execute(sql, params)` 执行裸 SQL
- 行结果通过 `_CompatRow` 包装，同时支持 `row["column"]` 和 `row[0]` 索引
- WAL mode + busy_timeout=30000 + 指数退避重试（"database is locked" 自动重试 3 次）

### 依赖注入方式

**无 DI 框架**，手动构造：

```python
# 典型 wiring 模式（interfaces/mcp/server.py）
conn_mgr = SQLiteConnectionManager(str(db_path))
agent_repo = AgentRepository(conn_mgr)
domain_svc = DomainRoutingService()
routing_repo = RoutingRepository(conn_mgr)
app_svc = RoutingAppService(domain_svc, routing_repo)
```

AppContext 单例（`interfaces/api/context.py`）集中管理 db_path、jinja_env、kb_service 延迟初始化。

### 配置体系

`config/settings.py` 中 `Settings` 类从环境变量读取所有配置。关键环境变量：

```
SIVAN_DB_PATH       # 数据库路径（默认 data/sivan.db）
SIVAN_API_KEY       # 管理控制台认证密钥
MCP_API_KEY         # MCP 服务器认证密钥
SIVAN_ADMIN_HOST    # 管理控制台主机（默认 127.0.0.1）
SIVAN_ADMIN_PORT    # 管理控制台端口（默认 8001）
SIVAN_HF_MIRROR     # HuggingFace 镜像站
```

### FastAPI + MCP 双模式挂载

```
server.py → 入口分发
  ├── --mcp-stdio: 启动纯 MCP STDIO 服务
  └── 默认: 启动 FastAPI Web 管理控制台
       └── /mcp/ 路径下挂载 FastMCP HTTP 服务
```

### 代码约定

- Python 3.13+，所有文件首行 `from __future__ import annotations`
- 类型注解全覆盖，使用 `|` 联合类型语法（Python 3.10+）
- Ruff lint 规则集：E/F/W/I/N/UP/S，行宽 120
- `pickle` 使用在 `infrastructure/ml/classifier.py` 中已知且限定范围，忽略 S301/S403

## 仓库实现约定

每个 Repository 接收 `SQLiteConnectionManager` 构造参数。方法命名惯例：
- `find_by_*` → 返回单条或 None
- `find_all_*` → 返回列表
- `save` / `update` / `delete`
- 无 ORM session 管理，每次调用独立 execute/commit

Repository 位于 `infrastructure/persistence/`，接口定义在 `domain/*/repository.py`。

## 未完成的测试目录

以下测试目录已有 `__init__.py` 但无实际测试文件：
- `tests/functional/`
- `tests/integration/`
- `tests/performance/`
- `tests/e2e/`

当前只有 `tests/unit/` 下有实际测试（test_routing.py, test_entity.py, test_settings.py，共 41 个）。

## 当前工作树状态

- 分支: `main`
- 有未提交的修改（agent_resolver, feedback_learner, routing strategy, agent/skill repos, MCP server, SQL schemas）
- 新增一个 `add_agent_type.py` alembic 迁移（未跟踪）
- 最近的提交是 `f9b993b feat: add default settings seed data to settings.sql`

## 重要约束

- **domain 层绝不能 import infrastructure 或 interfaces 层的任何东西**
- **智能体和技能定义存储在 SQLite 数据库中**（agents 表、skills 表），通过 `scripts/import_agents.py` 和 `scripts/import_skills.py` 从 markdown 文件导入。`agents/*.md` 和 `skills/*/SKILL.md` 仅供人类阅读，系统不从文件读取
- `SQLiteConnectionManager` 是全局单例，测试中通过 `reset_instance()` 重置
- MCP 服务器和 FastAPI Web 共享同一个数据库，通过 WAL mode 处理并发
- 模型文件和 ChromaDB 持久化存储在 `data/` 下，对运行时非必需（自动重建）
