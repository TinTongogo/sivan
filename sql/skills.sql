create table skills
(
    id               INTEGER
        primary key autoincrement,
    skill_id         TEXT not null
        unique,
    name             TEXT not null,
    display_name     TEXT,
    description      TEXT not null,
    content          TEXT not null,
    argument_hint    TEXT,
    allowed_tools    TEXT,
    category         TEXT not null,
    maintainer_agent TEXT,
    tags             TEXT,
    usage_count      INTEGER   default 0,
    last_used_at     TIMESTAMP,
    status           TEXT      default 'active',
    created_at       TIMESTAMP default CURRENT_TIMESTAMP,
    updated_at       TIMESTAMP default CURRENT_TIMESTAMP
);

create index idx_skills_category
    on skills (category);

create index idx_skills_name
    on skills (name);

INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (1, 'ab-testing', 'ab-testing', 'Ab Testing', '设计并分析 A/B 实验，科学评估模型或功能效果。', '# A/B 测试技能

## 单一职责
用统计方法证明新方案是否显著优于旧方案。

## 核心输出
- **实验设计**：假设、样本量计算、分流配置。
- **分析报告**：P 值、置信区间、效应量。
- **决策建议**：全量、继续实验、放弃。

## 顶尖交付标准
- 实验结论置信度 ≥ 95%。
- 实验期间无 SRM（样本比例不匹配）异常。

## 实现要点
- 使用 GrowthBook、LaunchDarkly 或自研分流。
- 分析时警惕多重比较问题（Bonferroni 校正）。', '[实验名称]', 'Read, Write, Bash', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (2, 'ac-writer', 'ac-writer', 'Ac Writer', '将用户故事转化为 Given-When-Then 格式的验收标准。适用于故事编写与评审阶段。', '# 验收标准编写技能

## 单一职责
产出可测试、无歧义的验收条件列表。

## 核心输出
- **Given-When-Then 条目**：覆盖正常、异常、边界场景。
- **可测试性提示**：所需测试数据与验证方法。

## 顶尖交付标准
- 每条验收标准均可直接映射到至少一个测试用例。
- 无模糊词汇（如“合理”、“快速”）。

## 实现要点
- 一个场景一条标准。
- 使用具体数值（“密码错误提示 3 次后锁定”而非“多次错误后锁定”）。
- 异常场景需明确预期错误码或提示信息。', '[故事ID或描述]', 'Read', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (3, 'accessibility', 'accessibility', 'Accessibility', '确保 Web 界面符合 WCAG 2.1 AA 标准，包括语义化 HTML、键盘导航、ARIA 属性、颜色对比度。适用于企业级应用。', '# 可访问性技能

## 单一职责
消除阻碍残障用户使用的技术障碍。

## 核心输出
- **组件级 a11y 检查清单**：聚焦、标签、对比度、ARIA 角色。
- **修复代码示例**：正确的语义结构、焦点管理。
- **测试报告**：Lighthouse 或 axe-core 扫描结果。

## 顶尖交付标准
- Lighthouse 可访问性评分 = 100。
- 所有交互元素支持键盘操作（Tab、Enter、Space）。

## 实现要点
- 使用 `<button>` 而非 `<div>` 模拟按钮。
- 自定义控件需实现相应 ARIA 属性（如 `role="slider"`）。
- 对比度至少 4.5:1（普通文本）。', '[组件或页面名称]', 'Read, Write', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (4, 'adr-writer', 'adr-writer', 'Adr Writer', '编写架构决策记录，包括背景、决策、理由、后果与替代方案。适用于记录重大技术决策。', '# ADR 编写技能

## 单一职责
产出结构完整、可追溯的决策文档。

## 核心输出
- **Markdown 文档**：严格遵循 ADR 模板。
- **至少一个否决方案**：说明被拒绝的替代方案及原因。
- **验证方法**：PoC 结果或压测数据链接。

## 顶尖交付标准
- 6 个月后新成员仅阅读 ADR 即可理解决策上下文，无需追问。

## 实现要点
- 编号格式 `ADR-{三位序号}`。
- 状态字段可选：提议、已接受、已废弃、替代。
- 存放在 `sprints/*/epics/*/knowledge/` 目录。', '[决策标题]', 'Read, Write', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (5, 'agent-routing', 'agent-routing', 'Agent Routing', '根据用户意图将请求分发到合适的子智能体，支持显式 @ 调用与隐式意图匹配。适用于多智能体协调。', '# 智能体路由技能

## 单一职责
将输入文本映射到目标智能体名称。

## 核心输出
- **关键词匹配规则表**：各智能体对应的关键词集合。
- **相似度计算逻辑**：Jaccard 相似度 + 停用词过滤。
- **回退提示模板**：无法识别意图时的用户引导语。

## 顶尖交付标准
- 隐式路由准确率 ≥ 90%（基于用户手动纠正数据）。
- 显式路由 `@agent` 优先级最高，直接跳过意图分析。

## 实现要点
- 输入预处理：转小写、去标点。
- 相似度阈值 0.3，低于则返回“无法识别”。
- 避免路由到协调器自身。', '[用户输入]', 'Read', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (6, 'api-design', 'api-design', 'Api Design', '设计符合 RESTful 规范的 API，输出 OpenAPI 3.0 规范文件。适用于接口设计或重构。', '# API 设计技能

## 单一职责
产出无歧义的 API 契约。

## 核心输出
- **OpenAPI 3.0 YAML**：包含路径、请求/响应 Schema、错误格式。
- **分页/过滤/排序约定**：`page`、`size`、`sort` 查询参数语义。
- **错误响应标准**：统一 `code`、`message`、`details` 结构。

## 顶尖交付标准
- 接口评审后实际变更次数 ≤ 1 次。
- OpenAPI 文件可通过 Swagger Codegen 生成客户端 SDK 无错误。

## 实现要点
- 资源命名使用复数名词（`/users`、`/orders`）。
- 使用 `$ref` 复用 Schema 定义。
- 对每个接口提供至少一个请求/响应示例。', '[API名称或资源]', 'Read, Write', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (7, 'archunit', 'archunit', 'Archunit', '编写架构约束规则（Java ArchUnit），自动检查分层依赖、命名规范、注解使用。', '# 架构约束自动化技能

## 单一职责
将架构决策转化为 CI 可执行的规则，防止腐化。

## 核心输出
- **ArchUnit 测试类**：验证层依赖方向、循环依赖、命名规范。
- **规则文档**：每条规则的业务含义和违规处理方式。

## 顶尖交付标准
- 所有架构约束 100% 自动化检查，无需人工 code review 依赖问题。
- 规则失败直接阻断 CI。

## 实现要点
- 核心规则：domain 层不依赖 infrastructure；controller 不调用 repository。
- 循环依赖检测使用 JDepend 或 ArchUnit 内置功能。', '[模块名称]', 'Read, Write', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (8, 'asr-pipeline', 'asr-pipeline', 'Asr Pipeline', '集成流式语音识别，包括 VAD、特征提取、解码器。', '# 语音识别流水线技能

## 单一职责
提供低延迟、高准确的流式语音转文字服务。

## 核心输出
- **ASR 服务端代码**：WebSocket 或 gRPC 流。
- **VAD 配置**：灵敏度、最小语音长度、静音超时。
- **后处理规则**：逆文本正则化、标点恢复。

## 顶尖交付标准
- 实时率（RTF）≤ 0.3，端点检测误切率 < 3%。
- 支持热词和自定义词汇表。

## 实现要点
- 使用 Whisper、SenseVoice 或 Paraformer。
- VAD 使用 Silero VAD 或 WebRTC VAD。', '[语言或场景]', 'Read, Write, Bash', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (9, 'automation-testing', 'automation-testing', 'Automation Testing', '编写和维护自动化测试脚本（API/UI），集成 CI/CD 实现回归检测。适用于提升测试效率。', '# 自动化测试技能

## 单一职责
将测试用例转化为可重复执行的自动化脚本。

## 核心输出
- **API / UI 测试代码**：含数据工厂与清理逻辑。
- **测试报告生成器**：JUnit XML 或 Allure 报告。
- **CI 集成配置**：失败阻断规则与重试策略。

## 顶尖交付标准
- 测试误报率 ≤ 3%（非代码缺陷导致的失败）。
- 测试数据完全自包含，不依赖外部环境特定状态。

## 实现要点
- API 测试使用 RestAssured 或 Pytest + requests。
- UI 测试优先 Playwright，自带等待机制减少 flaky。
- 每个测试用例独立准备数据并清理。', '[模块或API名称]', 'Read, Write, Bash', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (10, 'av-sync', 'av-sync', 'Av Sync', '保障音视频同步，处理时钟漂移和网络抖动。', '# 音视频同步技能

## 单一职责
让口型和声音严丝合缝。

## 核心输出
- **同步算法**：基于时间戳的 PTS 对齐。
- **唇形同步配置**：TTS 音频时长与嘴型动画匹配。
- **网络抖动缓冲**：JitterBuffer 配置。

## 顶尖交付标准
- 音画不同步偏差 ≤ 100ms。
- 丢包 20% 时仍能维持同步。

## 实现要点
- 使用 NTP 或公共时钟源。
- 唇形同步预生成 viseme 序列与音频强制对齐。', '[媒体流]', 'Read, Write, Bash', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (11, 'capacity-planning', 'capacity-planning', 'Capacity Planning', '基于业务指标预估系统资源需求，包括单点容量测试、实例数计算与存储预估。适用于上线前或增长期。', '# 容量规划技能

## 单一职责
输出精确到实例数量和存储 GB 的资源需求数字。

## 核心输出
- **单实例容量基准报告**：压测得出的极限 QPS 与资源占用。
- **资源计算公式**：实例数 = 峰值 QPS / 单实例安全 QPS × 冗余系数。
- **存储增长预估**：日均增量 × 保留天数 × 冗余系数。

## 顶尖交付标准
- 上线后首月实际资源消耗与预估值偏差 ≤ 20%。

## 实现要点
- 压测需模拟真实流量模型（读写比例、数据分布）。
- 冗余系数默认 1.3（允许单实例故障）。
- 数据库存储计算需包含索引、日志空间。', '[系统名称或业务指标]', 'Read, Write', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (12, 'chaos-engineering', 'chaos-engineering', 'Chaos Engineering', '设计混沌实验验证系统韧性，如 Pod 删除、网络延迟、依赖故障。', '# 混沌工程技能

## 单一职责
主动引入故障，证明系统在部分失效下仍可用。

## 核心输出
- **混沌实验定义**：稳态假设、爆炸半径、故障注入方式。
- **实验报告**：系统行为、恢复时间、改进建议。

## 顶尖交付标准
- 关键服务每月至少执行 1 次混沌实验。
- 发现的生产隐患在 1 个迭代内修复。

## 实现要点
- 使用 Chaos Mesh 或 Litmus。
- 从小爆炸半径开始（单个 Pod），逐步扩大。', '[目标服务]', 'Read, Write, Bash', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (13, 'cicd-pipeline', 'cicd-pipeline', 'Cicd Pipeline', '设计从代码提交到生产的自动化流水线，包括构建、测试、扫描、多环境部署。适用于新建或改造部署流程。', '# CI/CD 流水线技能

## 单一职责
定义可靠的自动化交付路径，不负责具体构建脚本内容。

## 核心输出
- **流水线配置文件**：GitHub Actions / GitLab CI YAML。
- **多环境部署参数化**：dev / staging / prod 通过变量区分。
- **安全扫描与测试门禁**：Trivy 镜像扫描 + 单元测试通过率要求。

## 顶尖交付标准
- 主干分支从 push 到部署至开发环境 ≤ 8 分钟。
- 生产部署必须经过人工审批。

## 实现要点
- 使用缓存加速依赖下载与构建。
- 测试失败立即阻断并通知提交者。
- 密钥管理使用平台 Secrets，日志不输出敏感信息。', '[项目名称或仓库]', 'Read, Write, Bash', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (14, 'component-patterns', 'component-patterns', 'Component Patterns', '设计可复用 UI 组件的接口、状态管理与复合模式。适用于构建组件库。', '# 组件设计模式技能

## 单一职责
定义组件的对外契约与内部状态边界。

## 核心输出
- **Props 类型定义**：TypeScript 精确类型，含可选/必填、回调签名。
- **复合组件 Context 结构**：如 `<Tabs>` 与 `<Tab>` 的共享状态。
- **受控/非受控模式切换示例**。

## 顶尖交付标准
- 组件在未预期场景下复用率 ≥ 70%。
- 无 props 钻取（prop drilling）现象，跨层级通信使用 Context 或组合。

## 实现要点
- 优先采用组合模式而非配置式巨型 props。
- 使用 `React.forwardRef` 支持 DOM 操作需求。
- 提供 Storybook 示例，展示所有变体。', '[组件名称或功能]', 'Read, Write', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (15, 'container-orchestration', 'container-orchestration', 'Container Orchestration', '定义 Kubernetes 工作负载的部署、服务暴露与发布策略。适用于容器化应用部署。', '# 容器编排技能

## 单一职责
编写生产就绪的 K8s YAML 与发布规则。

## 核心输出
- **Deployment / Service / Ingress YAML**：含资源请求/限制、存活探针、就绪探针。
- **金丝雀发布配置**：Istio VirtualService 权重拆分或 Argo Rollouts 定义。
- **HPA 规则**：基于 CPU 或自定义指标的扩缩容策略。

## 顶尖交付标准
- 滚动更新期间 5xx 错误率 ≤ 0.1%。
- 探针配置确保 Pod 在真正就绪后才接收流量。

## 实现要点
- `maxSurge=1, maxUnavailable=0` 保证滚动更新零停机。
- 所有敏感配置通过 Secret 挂载，禁止环境变量明文传递。
- 使用 PodDisruptionBudget 保障自愿中断时的可用性。', '[应用名称]', 'Read, Write, Bash', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (16, 'context-management', 'context-management', 'Context Management', '实现长对话的上下文压缩与记忆注入，包括微压缩、自动摘要与向量检索。适用于构建长对话智能体。', '# 上下文管理技能

## 单一职责
在有限上下文窗口内保留最多有效信息。

## 核心输出
- **微压缩算法**：将旧工具结果替换为 `[Previous: used bash]` 占位符。
- **自动摘要触发逻辑**：Token 超阈值时调用 LLM 生成摘要。
- **记忆检索 Top-K 注入**：从向量库获取相关记忆合并到系统提示。

## 顶尖交付标准
- 10 轮对话后上下文 Token 数量不超过初始值的 2 倍。
- 关键事实在压缩后仍可被模型引用。

## 实现要点
- 保留最近 3 条工具结果原文，其余压缩。
- 摘要模型使用轻量级模型（如 GPT-3.5）以降低成本。
- 压缩操作对用户透明，不打断对话流。', '[应用场景]', 'Read, Write, Bash', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (17, 'contract-validator', 'contract-validator', 'Contract Validator', '校验智能体产出是否符合消息契约 Schema，返回通过或失败详情。', '# 契约校验技能

## 单一职责
验证文件内容是否符合预定义的 JSON Schema。

## 核心输出
- **校验结果**：`{ "valid": true/false, "errors": [...] }`
- **失败时**：不修改文件，仅报告错误。

## 顶尖交付标准
- 校验时间 ≤ 100ms。
- 错误信息精确到字段和原因。

## 实现要点
使用 Python 的 `jsonschema` 库执行校验。

### 使用方式
```bash
python scripts/validate_contract.py --schema .claude/contracts/agent-message.schema.json --instance .claude/results/task_001.json', '[JSON文件路径]', 'Read, Bash', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (18, 'data-consistency-testing', 'data-consistency-testing', 'Data Consistency Testing', '验证并发场景下数据一致性，包括事务隔离、乐观锁冲突、幂等性。', '# 数据一致性测试技能

## 单一职责
用并发测试证明数据操作在多线程环境下正确。

## 核心输出
- **并发测试用例**：使用 `pytest-xdist` 或 JUnit 并行执行。
- **冲突场景脚本**：模拟库存扣减、余额转账等竞态条件。
- **一致性校验 SQL**：测试后验证最终状态是否符合预期。

## 顶尖交付标准
- 所有涉及状态变更的聚合必须有并发测试。
- 测试可复现，误报率 ≤ 1%。

## 实现要点
- 使用数据库行锁（`SELECT ... FOR UPDATE`）或乐观锁（版本号）。
- 验证幂等性：重复提交相同请求应返回相同结果且状态不变。', '[API或聚合名称]', 'Read, Write, Bash', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (19, 'data-curation', 'data-curation', 'Data Curation', '清洗、去重、标注微调数据集，提升数据质量。', '# 数据精炼技能

## 单一职责
将原始数据转化为高质量微调数据集。

## 核心输出
- **清洗脚本**：去除 HTML、乱码、重复项。
- **质量报告**：长度分布、语言检测、敏感词扫描。
- **标注指南**：明确标注规则和边界案例。

## 顶尖交付标准
- 经清洗的数据集训练出的模型，任务准确率比原始数据高 ≥ 5%。

## 实现要点
- 使用 text-dedup 或 MinHash 进行模糊去重。
- 人工抽查至少 100 条验证标注一致性。', '[数据集路径]', 'Read, Write, Bash', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (20, 'data-quality', 'data-quality', 'Data Quality', '定义并监控数据质量指标，防止垃圾数据污染模型。', '# 数据质量技能

## 单一职责
在数据进入模型前拦截异常。

## 核心输出
- **质量规则**：非空、唯一性、值域范围、分布漂移。
- **监控面板**：规则通过率、历史趋势。
- **告警与阻断**：质量低于阈值时停止训练。

## 顶尖交付标准
- 关键特征空值率 ≤ 1%。
- 分布漂移检测（PSI）超 0.2 时告警。

## 实现要点
- 使用 Great Expectations 或 Deequ。
- 与 Airflow 或 Dagster 集成。', '[数据表或流]', 'Read, Write, Bash', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (21, 'ddd-modeling', 'ddd-modeling', 'Ddd Modeling', '将业务规则映射为聚合、实体、值对象与领域事件。适用于复杂业务逻辑的架构设计。', '# DDD 建模技能

## 单一职责
将业务约束转化为代码可强制执行的设计模型。

## 核心输出
- **聚合根代码骨架**：至少包含一个完整业务方法（含不变量校验）。
- **领域事件定义**：事件类结构及触发点。
- **ADR 记录**：说明关键建模权衡与聚合边界理由。

## 顶尖交付标准
- 聚合边界内的所有业务规则 100% 由代码校验，无旁路可能。
- 跨聚合操作必须通过领域事件异步处理。

## 实现要点
- 实体标识使用值对象封装（如 `UserId`、`OrderId`）。
- 聚合根方法负责状态变更并发布事件。
- 仓储接口仅定义在聚合根级别。', '[业务领域名称]', 'Read, Write', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (22, 'embedding-selection', 'embedding-selection', 'Embedding Selection', '评估并选择最适合特定领域数据的 Embedding 模型。', '# Embedding 模型选型技能

## 单一职责
用数据证明哪个 Embedding 模型在你的任务上表现最好。

## 核心输出
- **候选模型列表**：BGE、E5、OpenAI、Voyage 等。
- **评估基准代码**：在自有测试集上计算检索 Recall。
- **选型报告**：性能、成本、延迟对比。

## 顶尖交付标准
- 选型结果在自有测试集上 Recall@5 提升 ≥ 10%（相比默认模型）。

## 实现要点
- 测试集必须与生产数据分布一致。
- 评估指标包含 MTEB 相关任务分数。', '[数据类型（文本/代码/多语言）]', 'Read, Write, Bash', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (23, 'epic-validator', 'epic-validator', 'Epic Validator', '检查 Epic 定义完整性，包括目标、范围、依赖、NFR 与验收标准。适用于 Epic 创建或评审阶段。', '# Epic 验证技能

## 单一职责
审查 Epic 文档的要素完备性，不负责内容补全或拆分。

## 核心输出
- **缺失项清单**：目标、边界、用户角色、功能点、NFR、依赖关系。
- **可测试性评估**：验收标准是否可量化、可自动化。

## 顶尖交付标准
- 经验证通过的 Epic，后续用户故事拆分返工率 ≤ 10%。

## 实现要点
- 读取 `sprints/*/epics/*/requirements/epic-*.md` 内容。
- 按清单逐项核对，输出“✅/⚠️/❌”状态。
- 若缺失关键项，拒绝进入下一阶段。', '[Epic ID]', 'Read', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (24, 'etl-pipeline', 'etl-pipeline', 'Etl Pipeline', '设计可维护、可扩展的数据提取转换加载流水线。', '# ETL 流水线技能

## 单一职责
可靠地将原始数据转化为分析就绪格式。

## 核心输出
- **流水线代码**：Spark、Flink 或 SQL。
- **调度配置**：Airflow DAG 或 Dagster Job。
- **数据血缘图**：字段级依赖关系。

## 顶尖交付标准
- 流水线失败率 ≤ 1%，失败后可自动重试。
- 数据延迟满足业务 SLA（如 T+1 或实时）。

## 实现要点
- 使用 dbt 管理 SQL 转换，DataHub 收集血缘。
- 增量处理避免全量扫描。', '[数据源]', 'Read, Write, Bash', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (25, 'faithfulness-eval', 'faithfulness-eval', 'Faithfulness Eval', '评估 RAG 生成答案对检索片段的忠实程度。', '# 忠实度评估技能

## 单一职责
量化答案中的幻觉比例。

## 核心输出
- **评估数据集**：问题、检索上下文、生成答案三元组。
- **评估脚本**：使用 LLM-as-judge 或 NLI 模型打分。
- **忠实度报告**：幻觉语句标注和改进建议。

## 顶尖交付标准
- 忠实度评分 ≥ 0.95。
- 可定位到幻觉的具体语句和缺失证据。

## 实现要点
- 使用 RAGAS 框架的 Faithfulness 指标。
- 或使用 NLI 模型（如 BART-large-MNLI）判断蕴含关系。', '[RAG 应用名称]', 'Read, Write, Bash', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (26, 'feature-store', 'feature-store', 'Feature Store', '构建离线/在线统一的特征存储，保障训练服务一致性。', '# 特征存储技能

## 单一职责
让线上推理使用的特征与训练时完全一致。

## 核心输出
- **特征定义**：名称、类型、来源、新鲜度要求。
- **Feature Store 配置**：Feast、Hopsworks 或自研。
- **特征计算流水线**：批特征（Spark）、流特征（Flink）。

## 顶尖交付标准
- 训练-服务特征偏差 ≤ 0.5%。
- 在线特征获取延迟 ≤ 20ms（P99）。

## 实现要点
- 使用 Feast 作为开源特征存储。
- 特征数据同时写入离线存储（Parquet）和在线存储（Redis）。', '[特征域]', 'Read, Write, Bash', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (27, 'fine-tuning', 'fine-tuning', 'Fine Tuning', '将基座模型适配到特定任务，包括数据准备、LoRA 配置与效果评估。适用于提升专项能力。', '# 模型微调技能

## 单一职责
通过微调提升目标任务准确率，不负责基座模型选型。

## 核心输出
- **Alpaca 格式数据集**：至少 500 条，附带质量校验脚本（去重、长度过滤）。
- **LoRA 微调配置**：Axolotl / Unsloth 配置文件，含 rank、alpha、学习率。
- **对比评估报告**：微调前后在测试集上的准确率变化。

## 顶尖交付标准
- 目标任务准确率提升 ≥ 15%。
- 通用能力（MMLU 子集）下降 ≤ 2%。

## 实现要点
- 使用 QLoRA 在消费级 GPU 上微调 7B 以上模型。
- 训练数据必须包含边界案例和否定示例。
- 输出 LoRA 权重，便于合并或动态加载。', '[任务名称]', 'Read, Write, Bash', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (28, 'finops', 'finops', 'Finops', '预估云资源成本，跟踪实际支出，识别浪费并优化。', '# FinOps 成本管理技能

## 单一职责
让每一分云支出可追溯、可优化。

## 核心输出
- **成本预估报告**：基于 Terraform Plan 的资源清单计算月成本。
- **成本归因标签规范**：`team`、`project`、`environment`。
- **优化建议**：未使用资源、降配建议、Spot 实例机会。

## 顶尖交付标准
- 预估成本与实际支出偏差 ≤ 15%。
- 每月输出成本优化报告，节省 ≥ 5% 非必要支出。

## 实现要点
- 使用 Infracost 或 AWS Cost Explorer API。
- 强制所有资源打上成本标签。', '[服务或资源名称]', 'Read, Write, Bash', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (29, 'frontend-perf', 'frontend-perf', 'Frontend Perf', '量化并优化 Core Web Vitals，包括代码分割、资源预加载、图片适配。适用于提升首屏加载速度。', '# 前端性能优化技能

## 单一职责
提升 LCP、降低 CLS、改善 INP，不负责功能实现。

## 核心输出
- **Lighthouse 基线报告**：含瓶颈归因（渲染阻塞、大资源、布局偏移源）。
- **实施方案**：路由级代码分割、关键资源 preload、图片 WebP + srcset。
- **验证报告**：优化前后指标对比。

## 顶尖交付标准
- LCP ≤ 2.0 秒，CLS ≤ 0.05。
- 在 3G 网络模拟下 TTI ≤ 4 秒。

## 实现要点
- 使用 `webpack-bundle-analyzer` 定位大包。
- 对非首屏图片强制懒加载。
- 配置 CDN 缓存策略，静态资源设置 1 年有效期。', '[页面或组件名称]', 'Read, Write, Bash', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (30, 'hardware-acceleration', 'hardware-acceleration', 'Hardware Acceleration', '利用 NPU、DSP、GPU 加速端侧推理，编写高性能算子。', '# 硬件加速技能

## 单一职责
榨干设备每一滴算力。

## 核心输出
- **算子优化代码**：Neon 汇编、Metal Shader、OpenCL Kernel。
- **框架适配层**：将模型转换为 Core ML、NNAPI 或 QNN 格式。
- **性能基准**：CPU 与加速器推理时间对比。

## 顶尖交付标准
- 使用硬件加速后推理速度提升 ≥ 2 倍，功耗降低 ≥ 30%。

## 实现要点
- Android 上优先使用 NNAPI 或 Qualcomm QNN。
- iOS 上使用 Core ML 和 ANE。', '[硬件平台]', 'Read, Write, Bash', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (31, 'inference-optimization', 'inference-optimization', 'Inference Optimization', '降低 LLM 推理延迟与成本，包括量化部署、KV Cache 复用、Prompt Cache 策略。适用于生产环境部署。', '# 推理优化技能

## 单一职责
优化推理引擎性能，不负责模型选型或微调。

## 核心输出
- **推理服务部署配置**：vLLM / TensorRT-LLM 启动参数，含量化级别。
- **Prompt Cache 命中率优化方案**：将系统提示与常用前缀固定化。
- **性能基准报告**：对比优化前后的 TTFT、吞吐量、成本。

## 顶尖交付标准
- 在输出质量无明显下降前提下，推理成本降低 ≥ 40%。
- P99 TTFT ≤ 200ms（首 token 延迟）。

## 实现要点
- 优先采用 AWQ 或 GPTQ 4-bit 量化。
- 对多轮对话场景启用自动 Prefix Caching。
- 监控 GPU 利用率和请求排队长度，动态调整并发。', '[模型名称]', 'Read, Write, Bash', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (32, 'infra-as-code', 'infra-as-code', 'Infra As Code', '使用 Terraform 管理云资源，实现声明式、版本化、幂等的基础设施。适用于云资源管理。', '# 基础设施即代码技能

## 单一职责
将云资源定义转化为可复用的 Terraform 模块，并管理远程状态。

## 核心输出
- **Terraform 模块**：VPC、ECS、RDS、OSS 等标准化组件。
- **远程状态锁配置**：S3 作为后端 + DynamoDB 实现状态锁。
- **变更计划预览**：`terraform plan` 输出人类可读的差异。

## 顶尖交付标准
- 一次 `apply` 成功率 ≥ 98%（排除配额、余额等外部因素）。
- 所有资源均定义 `tags`，用于成本归属。

## 实现要点
- 使用 `terraform-docs` 自动生成模块说明。
- 敏感变量通过环境变量或加密存储传入，禁止明文提交。
- 强制执行 `terraform fmt` 与 `validate` 检查。', '[资源类型或环境]', 'Read, Write, Bash', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (33, 'inheritance-manager', 'inheritance-manager', 'Inheritance Manager', '管理智能体间的临时能力继承，确保单向、无循环、单次有效。', '# 能力继承管理技能

## 单一职责
校验继承声明的合法性，并生成临时合并实例，不负责具体任务执行。

## 核心输出
- **继承解析器**：正则提取 `@target inherits from @source`。
- **循环依赖检测**：在解析阶段即拒绝 A 继承 B 且 B 继承 A。
- **临时实例生命周期**：任务执行完毕后立即销毁。

## 顶尖交付标准
- 嵌套继承（A inherits from B inherits from C）被直接拒绝，无运行时开销。
- 同名工具冲突时，以源智能体工具覆盖。

## 实现要点
- 在协调器层实现，不修改智能体定义文件。
- 仅继承 `tools` 和 `skills`，不继承模型、最大轮数等配置。
- 返回明确的成功或错误信息（含原因）。', '[继承声明]', 'Read', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (34, 'llm-evaluation', 'llm-evaluation', 'Llm Evaluation', '构建 LLM 输出质量评估体系，包括测试集设计、自动化指标计算与退化检测。适用于智能体质量保障。', '# LLM 评估技能

## 单一职责
量化智能体行为正确性与稳定性，不负责训练或提示词优化。

## 核心输出
- **测试集**：正例/边界/对抗三类用例，JSONL 格式。
- **评估流水线脚本**：计算准确率、召回率、工具调用正确率，支持 LLM-as-judge。
- **退化检测规则**：若关键指标下降 ≥ 5%，阻断 CI/CD 流水线。

## 顶尖交付标准
- LLM-as-judge 评分与人工评审相关性 ≥ 0.85。
- 全量测试集执行时间 ≤ 10 分钟（并行化）。

## 实现要点
- 工具调用评估需比对参数完全匹配。
- 对抗测试用例专门设计越狱、混淆输入，验证安全护栏有效性。
- 评估结果生成 HTML 报告，直观展示变化趋势。', '[智能体名称]', 'Read, Write, Bash', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (35, 'llm-streaming', 'llm-streaming', 'Llm Streaming', '实现大模型流式输出，包括 SSE 协议、中断处理、缓冲区管理。', '# LLM 流式输出技能

## 单一职责
让用户感知到“即时响应”的体验。

## 核心输出
- **流式服务端代码**：FastAPI StreamingResponse 或 gRPC 流。
- **客户端消费逻辑**：EventSource 或 fetch + ReadableStream。
- **中断处理**：取消生成后立即释放 GPU 资源。

## 顶尖交付标准
- 首字延迟（TTFT）≤ 100ms（不含网络）。
- 中断请求后 GPU 显存占用在 1 秒内下降。

## 实现要点
- 使用 SSE 协议，Content-Type: text/event-stream。
- 客户端 AbortController 触发取消。
- 服务端检测客户端断开后停止生成。', '[模型部署方式]', 'Read, Write, Bash', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (36, 'log-management', 'log-management', 'Log Management', '部署结构化日志采集、索引与查询系统（Loki / ELK）。适用于集中式日志管理。', '# 日志管理技能

## 单一职责
保障日志从产生到可查询的完整链路，不负责日志内容分析。

## 核心输出
- **OTLP 采集配置**：Promtail 或 OpenTelemetry Collector 配置，输出为 JSON 格式。
- **保留策略**：按时间（如 30 天）和体积自动清理，使用对象存储降低冷存储成本。
- **常用查询模板**：LogQL 或 Lucene 语法示例，覆盖错误追踪、慢请求定位。

## 顶尖交付标准
- 日志从写入到可查询延迟 ≤ 3 秒。
- 日志系统自身可用性 ≥ 99.9%，不因日志量激增而崩溃。

## 实现要点
- 强制日志格式：`{"timestamp":"...","level":"...","traceId":"...","message":"...","service":"..."}`
- 敏感字段（password、token）自动脱敏，通过 pipeline 阶段过滤。
- 为每个服务预设 Grafana 日志面板。', '[服务名称]', 'Read, Write, Bash', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (37, 'mcp-integration', 'mcp-integration', 'Mcp Integration', '将 MCP 服务器工具转换为智能体可用工具，包括动态注册、权限沙箱与熔断。适用于扩展智能体能力。', '# MCP 集成技能

## 单一职责
桥接 MCP 协议与智能体工具调用接口，处理发现、转换、安全与可靠性。

## 核心输出
- **工具发现与动态注册代码**：调用 `tools/list` 并生成工具 Schema。
- **权限沙箱配置**：命令白名单、工作目录限制、网络出口控制。
- **超时与熔断策略**：单次调用超时 30 秒，连续失败 5 次熔断 60 秒。

## 顶尖交付标准
- 新增 MCP 服务器集成代码量 ≤ 10 行配置。
- 所有 MCP 工具调用需经用户确认或白名单预授权。

## 实现要点
- 使用官方 MCP SDK 管理连接生命周期。
- 工具 Schema 自动转换为智能体内部工具定义格式。
- 危险操作（如 `rm`、`curl` 外部地址）默认拒绝，需显式声明。', '[MCP服务器地址]', 'Read, Write, Bash', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (38, 'memory-management', 'memory-management', 'Memory Management', '实现基于遗忘曲线的长期/短期记忆存储、检索与衰减清理。适用于需要上下文持久化的智能体。', '# 记忆管理技能

## 单一职责
管理记忆的生命周期：存储、检索、强度衰减与清理，不负责对话生成。

## 核心输出
- **向量库 Schema**：包含记忆内容、强度、最后访问时间、遗忘曲线参数。
- **检索注入策略**：Top-K 按强度排序，注入当前上下文。
- **清理守护进程**：定时扫描并删除强度 < 0.1 的记忆。

## 顶尖交付标准
- 跨会话关键事实检索命中率 ≥ 85%。
- 同一事实在多次对话中一致性无退化。

## 实现要点
- 强度更新公式：`new_strength = old_strength * e^(-Δt / S) + 强化增量`。
- 每次检索成功将强度提升 0.1，上限 1.0。
- 使用向量数据库（Chroma/Milvus）存储，HNSW 索引加速。', '[智能体名称]', 'Read, Write, Bash', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (39, 'migration-strategy', 'migration-strategy', 'Migration Strategy', '设计零停机系统迁移方案，包括数据双写校验、流量灰度切换、秒级回滚决策树。适用于遗留系统改造或技术栈升级。', '# 迁移策略技能

## 单一职责
设计可逆的流量切换与数据同步方案，不负责业务功能重构。

## 核心输出
- **流量切换规则**：基于 Header、Cookie 或权重的灰度配置，精确到百分比。
- **数据一致性校验脚本**：对比新旧系统关键数据，输出差异报告。
- **回滚决策树**：定义指标阈值（错误率、延迟、数据不一致量），触发后自动执行回滚动作。

## 顶尖交付标准
- 回滚操作完成时间 ≤ 30 秒。
- 迁移期间数据不一致可被校验脚本定位并自动修复。

## 实现要点
1. 双写中间件拦截新旧存储操作，异步比对结果。
2. 流量切换使用网关动态路由能力（如 Nginx + Lua、Envoy）。
3. 回滚脚本幂等设计，支持一键切回旧系统全部流量。', '[源系统 -> 目标系统]', 'Read, Write, Bash', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (40, 'model-compression', 'model-compression', 'Model Compression', '通过知识蒸馏、剪枝、量化压缩模型，使其适合端侧部署。', '# 模型压缩技能

## 单一职责
让大模型跑在资源受限设备上。

## 核心输出
- **压缩后模型**：蒸馏小模型或剪枝后权重。
- **压缩报告**：尺寸缩减比例、推理速度提升、精度损失。
- **部署配置文件**：适配端侧框架（TFLite、Core ML、MNN）。

## 顶尖交付标准
- 模型体积 ≤ 500MB，端侧推理延迟满足实时要求。
- 精度损失 ≤ 2%。

## 实现要点
- 蒸馏使用 KL 散度损失，教师模型为原始大模型。
- 结构化剪枝移除整个神经元或注意力头。', '[模型名称]', 'Read, Write, Bash', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (41, 'model-drift-detection', 'model-drift-detection', 'Model Drift Detection', '监控模型预测分布变化，检测数据漂移和概念漂移。', '# 模型漂移检测技能

## 单一职责
在模型无声失效前发出警报。

## 核心输出
- **漂移监控指标**：PSI、KL 散度、预测分布变化。
- **告警规则**：阈值、持续时长、通知渠道。
- **自动回滚策略**：漂移超限时切回旧模型。

## 顶尖交付标准
- 漂移发生到告警 ≤ 1 小时。
- 误报率 ≤ 5%。

## 实现要点
- 使用 Evidently AI 或 NannyML。
- 建立基线分布（训练集前 30 天数据）。', '[模型名称]', 'Read, Write, Bash', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (42, 'model-quantization', 'model-quantization', 'Model Quantization', '对模型进行训练后量化（PTQ），降低显存占用和推理延迟。', '# 模型量化技能

## 单一职责
在不显著损失精度的前提下压缩模型。

## 核心输出
- **量化模型**：AWQ、GPTQ 或 GGUF 格式。
- **精度对比报告**：困惑度、下游任务准确率变化。
- **性能提升数据**：显存占用、吞吐量、延迟变化。

## 顶尖交付标准
- 4-bit 量化后精度损失 ≤ 2%。
- 显存占用降低 ≥ 60%。

## 实现要点
- 使用 AutoAWQ 或 llama.cpp 的量化工具。
- 对校准数据集的质量敏感，需选择代表性样本。', '[模型名称]', 'Read, Write, Bash', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (43, 'model-selection', 'model-selection', 'Model Selection', '基于多维评估选择最适 LLM，包括性能、成本、合规对比。适用于技术选型阶段。', '# 模型选型技能

## 单一职责
输出有数据支撑的模型推荐结论。

## 核心输出
- **加权打分矩阵**：能力、延迟、成本、合规、上下文长度等维度。
- **PoC 对比实验数据**：在真实任务上的表现。
- **ADR 格式决策记录**：包含选型理由与风险。

## 顶尖交付标准
- 选型结果在预算内满足 P99 延迟要求。
- 决策文档包含至少一个被放弃的主流模型及明确放弃原因。

## 实现要点
- 成本计算使用实际 Token 单价。
- PoC 测试集必须与生产任务分布一致。
- 合规性需考虑数据驻留与许可证。', '[应用场景]', 'Read, Write', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (44, 'monitoring-alerting', 'monitoring-alerting', 'Monitoring Alerting', '部署 Prometheus + Grafana 监控体系，配置告警规则与仪表板。适用于保障服务可观测性。', '# 监控告警技能

## 单一职责
让服务状态可量化、异常可感知。

## 核心输出
- **Prometheus 采集配置**：ServiceMonitor 或 PodMonitor 定义。
- **告警规则文件**：PromQL 表达式 + 抑制/分组规则。
- **Grafana 仪表板 JSON**：包含 RED 指标（Rate, Error, Duration）与业务指标。

## 顶尖交付标准
- 故障发生到告警通知 ≤ 1 分钟。
- 告警误报率 ≤ 5%（以周为统计周期）。

## 实现要点
- 使用 `prometheus-operator` 简化部署。
- 告警规则包含 `for` 持续时间避免瞬时抖动。
- 仪表板使用变量支持多环境切换。', '[服务名称]', 'Read, Write, Bash', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (45, 'performance-testing', 'performance-testing', 'Performance Testing', '通过负载测试暴露系统容量瓶颈，输出瓶颈归因与优化建议。适用于上线前评估。', '# 性能测试技能

## 单一职责
提供系统在压力下的真实表现数据。

## 核心输出
- **测试脚本**：k6 或 JMeter 脚本，模拟真实用户行为。
- **瓶颈归因报告**：火焰图、慢查询日志、资源监控截图。
- **优化建议**：具体的代码或配置调整，含预期提升。

## 顶尖交付标准
- 两次相同条件测试结果偏差 ≤ 5%。
- 瓶颈定位结论与后续优化实际效果吻合。

## 实现要点
- 逐步增加负载直至达到目标 QPS 或系统崩溃。
- 监控全链路（网关、应用、数据库、缓存）。
- 报告包含 P90/P95/P99 延迟与错误率曲线。', '[API或系统名称]', 'Read, Write, Bash', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (46, 'priority-wizard', 'priority-wizard', 'Priority Wizard', '根据业务价值、紧急程度、技术风险评估任务优先级，输出艾森豪威尔矩阵分类。适用于需求排序。', '# 优先级评估技能

## 单一职责
将任务归类为紧急/重要四个象限。

## 核心输出
- **优先级标签**：`紧急且重要` / `紧急不重要` / `不紧急但重要` / `不紧急不重要`。
- **分类理由**：简述各维度评估依据。

## 顶尖交付标准
- 分类结果与产品负责人/业务方判断一致率 ≥ 85%。

## 实现要点
- 评估维度：业务价值（高/中/低）、时间敏感度（高/中/低）、技术风险（高/中/低）。
- 若存在阻塞关系，自动提升优先级。
- 输出可作为任务排序的输入依据。', '[任务ID或需求描述]', 'Read, Write', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (47, 'product-analytics', 'product-analytics', 'Product Analytics', '定义并追踪产品关键指标（激活、留存、转化），设计 A/B 实验评估功能效果。', '# 产品分析技能

## 单一职责
将模糊的“成功”转化为可量化、可追踪的产品指标。

## 核心输出
- **指标定义文档**：北极星指标、二级指标、反向指标。
- **埋点事件设计**：事件名称、参数、触发时机。
- **A/B 实验方案**：假设、变量、流量分配、显著性计算。

## 顶尖交付标准
- 每个用户故事上线后 1 周内可出具效果评估报告。
- A/B 实验结论置信度 ≥ 95%。

## 实现要点
- 使用 `product-analytics.md` 模板记录指标。
- 集成第三方分析 SDK（如 Mixpanel、Amplitude）的埋点规范。', '[功能名称]', 'Read, Write', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (48, 'prompt-engineering', 'prompt-engineering', 'Prompt Engineering', '设计高质量系统提示词，提升模型输出准确性与格式遵从率。适用于所有 LLM 应用。', '# 提示词工程技能

## 单一职责
优化提示词结构与措辞以获得稳定预期输出。

## 核心输出
- **结构化提示词模板**：角色、任务、约束、示例、输出格式。
- **A/B 测试数据**：新旧版本在关键指标上的对比。
- **防御语句**：对抗越狱与指令注入。

## 顶尖交付标准
- 输出格式遵从率 ≥ 98%。
- 越狱尝试成功率 ≤ 1%。

## 实现要点
- 使用 `###` 或 XML 标签分隔不同区块。
- 提供少样本示例时必须包含边界情况。
- 明确“禁止”条款置于约束部分首位。', '[任务类型]', 'Read, Write', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (49, 'prompt-testing', 'prompt-testing', 'Prompt Testing', '对提示词进行回归、对抗与边界测试，确保修改不引入退化。适用于提示词迭代。', '# 提示词测试技能

## 单一职责
验证提示词变更的安全性。

## 核心输出
- **测试用例集**：回归、对抗、边界、格式四类，JSON 格式。
- **自动化测试脚本**：pytest 调用智能体并断言。
- **通过率报告**：退化检测与失败用例分析。

## 顶尖交付标准
- 全量测试执行时间 ≤ 2 分钟。
- 覆盖所有关键约束（如不得使用未授权工具）。

## 实现要点
- 对抗用例测试模型拒绝能力（如“忽略之前指令”）。
- 回归用例基于历史正确行为快照。
- 集成到 CI 中，提示词变更自动触发测试。', '[提示词版本]', 'Read, Write, Bash', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (50, 'rag-optimization', 'rag-optimization', 'Rag Optimization', '提升检索增强生成的召回精度与答案忠实度，包括分块策略、混合检索与重排序。适用于知识密集型智能体。', '# RAG 优化技能

## 单一职责
让检索到的片段与用户问题最相关。

## 核心输出
- **分块策略配置**：块大小、重叠量、语义分块规则。
- **混合检索 + 重排序代码**：BM25 + 向量，Cross-Encoder 重排。
- **Recall@K 评估报告**：不同 K 值下的命中率。

## 顶尖交付标准
- Recall@5 ≥ 0.90。
- 生成答案忠实度（Faithfulness）≥ 0.95。

## 实现要点
- 使用 BGE 或 E5 作为 Embedding 模型。
- 向量库索引选择 HNSW，参数 `efConstruction` 调高。
- 对检索结果进行上下文压缩，仅保留与问题最相关句子。', '[知识领域]', 'Read, Write, Bash', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (51, 'reactive-programming', 'reactive-programming', 'Reactive Programming', '使用 Spring WebFlux 和 Reactor 构建非阻塞、弹性数据流。适用于高并发 IO 密集型服务。', '# 响应式编程技能

## 单一职责
实现异步非阻塞的数据处理链。

## 核心输出
- **Mono/Flux 操作链代码**：含 `flatMap`、`zip`、错误恢复。
- **背压处理配置**：`onBackpressureBuffer` / `onBackpressureDrop`。
- **调度器切换建议**：阻塞任务用 `boundedElastic`。

## 顶尖交付标准
- 同等硬件下吞吐量提升 ≥ 2 倍，P99 延迟降低 ≥ 30%。

## 实现要点
- 禁止在响应式链中调用阻塞方法（如 `Thread.sleep`）。
- 使用 `StepVerifier` 进行单元测试。
- 数据库访问需使用 R2DBC 或异步驱动。', '[组件或服务名称]', 'Read, Write', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (52, 'regression-strategy', 'regression-strategy', 'Regression Strategy', '定义变更后的最小必要回归测试范围，包括影响分析与用例优先级。适用于版本迭代。', '# 回归测试策略技能

## 单一职责
给出本次变更“必须测什么”的明确列表。

## 核心输出
- **影响范围分析**：基于代码变更或需求关联的模块列表。
- **P0/P1 用例清单**：必须执行的自动化与手动用例。
- **自动化触发条件**：定义哪些变更触发全量回归。

## 顶尖交付标准
- 回归测试执行时间与变更范围正相关，无固定全量执行。
- P0 用例失败直接阻断发布。

## 实现要点
- 结合代码覆盖率报告识别受影响模块。
- 优先执行核心业务流程用例（登录、支付等）。
- 非关键模块可推迟至非高峰时段回归。', '[版本或迭代名称]', 'Read', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (53, 'resource-locking', 'resource-locking', 'Resource Locking', '协调多个智能体对共享资源的访问，防止冲突。', '# 资源锁管理技能

## 单一职责
确保同一时间只有一个智能体修改共享状态。

## 核心输出
- **锁服务配置**：Redis 分布式锁或文件锁。
- **锁获取/释放代码**：含超时和死锁检测。
- **冲突解决策略**：串行化、副本隔离、合并。

## 顶尖交付标准
- 资源竞争导致的协作失败率 ≤ 1%。
- 死锁能在 30 秒内检测并自动解除。

## 实现要点
- 使用 Redlock 算法或 etcd 实现分布式锁。
- 副本隔离：每个智能体操作临时副本，最后原子替换。', '[资源列表]', 'Read, Write', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (54, 'responsive-design', 'responsive-design', 'Responsive Design', '实现多端适配的响应式布局，包括移动优先、断点设计与图片适配。适用于跨设备界面开发。', '# 响应式设计技能

## 单一职责
确保 UI 在任何视口宽度下可用且美观。

## 核心输出
- **移动优先 CSS 代码**：Flex/Grid 基础布局，媒体查询增强。
- **断点定义**：基于内容而非设备，如 `sm: 640px`。
- **图片适配方案**：`srcset` + `sizes` 或 `<picture>` 元素。

## 顶尖交付标准
- 在 320px 至 2560px 宽度范围内无横向滚动条。
- 所有交互元素在移动端可点区域 ≥ 44×44px。

## 实现要点
- 使用相对单位 `rem`、`%`、`vw` 代替固定 `px`。
- 优先采用 Tailwind CSS 工具类实现响应式。
- 测试需覆盖真实移动设备（或 DevTools 模拟）。', '[组件或页面名称]', 'Read, Write', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (55, 'security-hardening', 'security-hardening', 'Security Hardening', '消除 OWASP Top 10 常见漏洞，包括认证授权、输入校验、敏感数据加密。适用于后端安全防护。', '# 安全加固技能

## 单一职责
在代码层面杜绝已知安全漏洞。

## 核心输出
- **认证授权配置**：Spring Security + JWT，密码 BCrypt 强度 12。
- **输入校验与输出编码规则**：`@Valid` 注解 + HTML 转义。
- **敏感数据加密与日志脱敏**：AES-256 加密，日志过滤器屏蔽关键字段。

## 顶尖交付标准
- 通过 OWASP ZAP 基线扫描，无高危漏洞。
- 所有 API 均需认证（除公开端点外）。

## 实现要点
- SQL 注入防护：JPA 参数化查询或 MyBatis `#{}`。
- 限流：使用 Bucket4j 实现用户级 QPS 限制。
- 配置安全响应头（CSP、HSTS、X-Frame-Options）。', '[API或模块名称]', 'Read, Write', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (56, 'security-testing', 'security-testing', 'Security Testing', '进行基本安全测试，覆盖 SQL 注入、XSS、越权、敏感信息泄露。适用于上线前检查。', '# 安全测试技能

## 单一职责
发现并报告安全漏洞，不负责修复。

## 核心输出
- **OWASP Top 10 手动测试记录**：每个漏洞的测试用例与结果。
- **自动化扫描报告**：ZAP 或 Burp 扫描结果。
- **漏洞分级与修复建议**：高危/中危/低危，含具体修复代码示例。

## 顶尖交付标准
- 所有高危漏洞在上线前已确认修复并复测通过。

## 实现要点
- 测试环境数据与生产脱敏，但结构一致。
- 越权测试需准备两个不同权限的账号。
- 扫描配置需排除登出、删除等破坏性操作。', '[API或系统名称]', 'Read, Write, Bash', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (57, 'story-split', 'story-split', 'Story Split', '将大型用户故事拆分为多个独立可交付的小故事。适用于复杂需求细化。', '# 用户故事拆分技能

## 单一职责
将一个复杂需求分解为可独立开发的子故事。

## 核心输出
- **子故事文档**：包含用户故事格式、验收标准、依赖关系（`blockedBy`）。
- **拆分依据说明**：按角色、流程、数据变体等维度。

## 顶尖交付标准
- 每个子故事预估工作量 ≤ 2 天。
- 每个子故事具有独立业务价值，可单独演示。

## 实现要点
- 禁止按技术层次拆分（如“写 API”与“写 UI”分开）。
- 优先垂直切片，每个子故事跨越全栈。
- 明确子故事间的依赖顺序。', '[史诗或故事ID]', 'Read, Write', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (58, 'stream-processor', 'stream-processor', 'Stream Processor', '构建实时音视频流处理管道，处理解码、推理、编码。', '# 流媒体处理技能

## 单一职责
以最低延迟处理连续的音视频帧。

## 核心输出
- **GStreamer/FFmpeg Pipeline**：解码、缩放、推理、编码。
- **帧丢弃策略**：当推理跟不上时选择性丢非关键帧。
- **性能监控**：处理延迟、丢帧率、队列长度。

## 顶尖交付标准
- 端到端处理延迟 ≤ 200ms（不含网络传输）。
- 在 CPU 负载 80% 时仍能保持实时。

## 实现要点
- 使用硬件解码（VAAPI、NVDEC、VideoToolbox）。
- 推理与编解码异步流水线。', '[应用类型]', 'Read, Write, Bash', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (59, 'system-review', 'system-review', 'System Review', '对系统设计进行架构评审，识别风险、瓶颈与改进点。适用于设计阶段或重大变更前。', '# 系统设计评审技能

## 单一职责
发现设计中的潜在问题，输出可执行的改进清单。

## 核心输出
- **风险清单**：按功能、扩展性、性能、可用性、安全等维度列出，含严重性评级。
- **改进建议**：具体的修改方案或折衷措施。
- **评审决议**：通过 / 有条件通过 / 拒绝。

## 顶尖交付标准
- 评审发现的风险在后续开发中实际发生率为零。

## 实现要点
- 评审前设计者需提供架构图与关键序列图。
- 至少邀请一位非本团队架构师参与。
- 重大风险需记录 ADR 说明如何规避。', '[系统名称或设计文档路径]', 'Read, Write', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (60, 'task-decomposition', 'task-decomposition', 'Task Decomposition', '将复杂用户请求分解为结构化子任务 DAG。', '# 任务分解技能

## 单一职责
输出无歧义、可并行识别的子任务列表。

## 核心输出
- **任务 DAG**：节点（描述、所需能力）、边（依赖关系）。
- **资源冲突标记**：哪些任务共享文件或服务。

## 顶尖交付标准
- 分解后的子任务能被现有智能体直接执行，无二次澄清需求。

## 实现要点
- 使用关键词匹配和能力向量相似度确定任务边界。
- 识别共享资源：文件路径、数据库表、API 端点。', '[用户请求]', 'Read', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (61, 'tech-radar', 'tech-radar', 'Tech Radar', '系统化评估技术选型，包括调研、对比矩阵、风险识别。适用于引入新技术或替换技术栈。', '# 技术选型评估技能

## 单一职责
输出有数据支撑的技术推荐结论。

## 核心输出
- **功能匹配度矩阵**：MUST / NICE 需求与候选技术映射。
- **候选方案对比表**：社区活跃度、学习曲线、性能、许可、生态。
- **风险识别与缓解措施**。

## 顶尖交付标准
- 推荐方案在 1 年内未被证明是错误选择（无被迫再次迁移）。

## 实现要点
- 至少评估 3 个候选方案。
- 需包含性能基准测试或引用权威第三方评测。
- 若团队不熟悉该技术，需将培训成本纳入决策。', '[技术领域]', 'Read, Write', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (62, 'test-case-design', 'test-case-design', 'Test Case Design', '运用等价类、边界值、场景法设计高覆盖率测试用例。适用于功能测试编写。', '# 测试用例设计技能

## 单一职责
生成可执行、无遗漏的测试用例集。

## 核心输出
- **测试用例文档**：含前置条件、步骤、预期结果、测试数据。
- **覆盖矩阵**：需求点与用例的映射表。

## 顶尖交付标准
- 用例执行后发现的缺陷数 ≥ 探索性测试发现的 80%（即覆盖充分）。

## 实现要点
- 每个字段需测试有效等价类、无效等价类、边界值。
- 场景法需覆盖基本流与至少一个备选流。
- 异常用例需验证错误提示的准确性。', '[用户故事ID或功能名称]', 'Read, Write', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (63, 'threat-modeling', 'threat-modeling', 'Threat Modeling', '使用 STRIDE 方法识别系统威胁，输出安全需求。', '# 威胁建模技能

## 单一职责
在设计阶段发现潜在安全问题，而非事后修补。

## 核心输出
- **数据流图**：信任边界、外部实体、数据存储。
- **威胁清单**：按 STRIDE 分类（欺骗、篡改、抵赖、信息泄露、拒绝服务、提权）。
- **缓解措施**：具体的安全控制。

## 顶尖交付标准
- 每个 Epic 涉及新数据流时必经威胁建模。
- 识别出的高危威胁在上线前已缓解。

## 实现要点
- 使用 OWASP Threat Dragon 或 Microsoft TMT。
- 重点审查认证、授权、数据验证环节。', '[系统或功能名称]', 'Read, Write', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (64, 'token-monitoring', 'token-monitoring', 'Token Monitoring', '采集、聚合和预警 LLM Token 消耗，输出日报和超限告警。', '# Token 监控技能

## 单一职责
追踪每一笔 LLM 调用的 Token 消耗，提供成本可见性。

## 核心输出
- **结构化日志**：每次调用生成一条 JSON 日志。
- **每日聚合报告**：按维度统计的 Token 量和成本。
- **实时预警**：预算超 80% 时主动告警。

## 顶尖交付标准
- 日志记录延迟 < 10ms（异步写入）。
- 日报生成时间 < 5 秒。

## 实现要点
- 在 LLM 调用封装层（如 `call_llm_with_logging` 函数）统一埋点。
- 使用 tiktoken 或模型 API 返回的精确 usage 字段。
- 成本计算基于各模型官方定价（如 Claude 3.5 Sonnet 输入 $3/MTok，输出 $15/MTok）。', '[时间范围或智能体名称]', 'Read, Write, Bash', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (65, 'tool-design', 'tool-design', 'Tool Design', '设计智能体工具接口，包括 JSON Schema、参数校验、安全沙箱与错误处理。适用于扩展智能体能力。', '# 工具设计技能

## 单一职责
产出安全、健壮、易用的工具定义与实现。

## 核心输出
- **JSON Schema 定义**：含 `description`、`required`、类型约束。
- **工具实现代码**：含参数校验、超时控制、沙箱限制。
- **单元测试**：正常/异常/越权场景覆盖。

## 顶尖交付标准
- 工具被误用时返回明确错误信息，绝不泄露系统内部堆栈或路径。
- 所有文件操作限制在工作目录内，命令执行限制在白名单内。

## 实现要点
- 使用 Pydantic 或 Zod 进行输入校验。
- 超时默认 30 秒，可配置。
- 返回结果统一结构：`{"success": bool, "output": any, "error": str}`', '[工具名称或功能]', 'Read, Write', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (66, 'tts-expressiveness', 'tts-expressiveness', 'Tts Expressiveness', '实现富有表现力的语音合成，支持情感、韵律控制。', '# 表现力语音合成技能

## 单一职责
让合成语音传递情感和个性。

## 核心输出
- **TTS 模型部署配置**：VITS、GPT-SoVITS、CosyVoice。
- **情感控制接口**：快乐、悲伤、愤怒、惊讶等参数。
- **音色克隆脚本**：少量样本微调。

## 顶尖交付标准
- MOS 评分 ≥ 4.2（以真人 4.5 为基准）。
- 克隆音色相似度 ≥ 85%（说话人验证分数）。

## 实现要点
- 使用参考音频进行音色提示。
- 韵律标记（SSML）控制停顿、重音、语速。', '[声音角色]', 'Read, Write, Bash', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (67, 'ui-ux-design', 'ui-ux-design', 'Ui Ux Design', '输出可量化的设计令牌与交互规范，使前端实现零歧义。', '# UI/UX 设计技能

## 单一职责
将设计意图转化为精确的、机器可读的设计变量和交互规则。

## 核心输出
- **设计令牌 JSON**：颜色、字体、间距、圆角、阴影。
- **交互状态矩阵**：默认、悬停、激活、禁用、加载、错误。
- **原型标注**：间距、尺寸、动画曲线。

## 顶尖交付标准
- 设计稿与最终实现视觉误差 ≤ 1px。
- 设计令牌可直接导入前端项目（CSS 变量或 Tailwind 配置）。

## 实现要点
- 使用 Figma Tokens 插件导出 JSON。
- 动画曲线使用标准 CSS `cubic-bezier` 值。', '[页面或组件名称]', 'Read, Write', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (68, 'vector-db', 'vector-db', 'Vector Db', '部署和优化向量数据库，实现低延迟、高召回的大规模向量检索。适用于 RAG 系统知识库管理。', '# 向量数据库技能

## 单一职责
提供稳定的向量存储与检索服务。

## 核心输出
- **部署配置**：Milvus / Qdrant 的 Helm Chart 或 docker-compose，含资源配额。
- **索引调优参数**：索引类型（HNSW/IVF）、`ef`、`M`、`nprobe`。
- **监控面板**：检索延迟、QPS、召回率、内存使用。

## 顶尖交付标准
- 百万级向量检索 P99 延迟 ≤ 50ms。
- 召回率（Recall@10）≥ 0.95。

## 实现要点
- 根据数据规模选择分片数量。
- 定期重建索引以优化查询性能。
- 启用持久化存储，防止数据丢失。', '[应用场景]', 'Read, Write, Bash', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
INSERT INTO skills (id, skill_id, name, display_name, description, content, argument_hint, allowed_tools, category, maintainer_agent, tags, usage_count, last_used_at, status, created_at, updated_at) VALUES (69, 'video-analytics', 'video-analytics', 'Video Analytics', '对视频流进行实时分析（目标检测、行为识别、分割）。', '# 视频分析技能

## 单一职责
从视频流中实时提取结构化信息。

## 核心输出
- **推理服务**：YOLO、ByteTrack、SlowFast 部署。
- **后处理逻辑**：NMS、目标跟踪、轨迹平滑。
- **输出 Schema**：检测框、类别、置信度、轨迹 ID。

## 顶尖交付标准
- 单帧推理 ≤ 30ms（GPU），支持 30fps 实时处理。
- 跟踪 ID 切换率 ≤ 5%。

## 实现要点
- 使用 TensorRT 或 ONNX Runtime 加速。
- 跳帧检测：每 N 帧做一次检测，中间帧用跟踪补全。', '[分析类型]', 'Read, Write, Bash', '', null, null, 0, null, 'active', '2026-04-25 13:27:15', '2026-04-25 13:27:15');
