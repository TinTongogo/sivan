create table settings
(
    key         TEXT                        not null
        primary key,
    value       TEXT      default ''        not null,
    value_type  TEXT      default 'str'     not null,
    description TEXT      default '',
    category    TEXT      default 'general' not null,
    updated_at  TIMESTAMP default CURRENT_TIMESTAMP
);

INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('llm_provider', 'DeepSeek', 'str', 'LLM 提供商 (anthropic, ollama, deepseek, openai)', 'llm', '2026-05-02 10:49:52');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('llm_api_key', 'sk-708926557b9444bcaa8927da962abf43', 'str', 'LLM API Key', 'llm', '2026-05-02 10:49:52');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('llm_api_url', 'https://api.deepseek.com', 'str', 'LLM API URL', 'llm', '2026-05-02 10:49:52');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('llm_model', 'deepseek-v4-flash', 'str', 'LLM 模型名称', 'llm', '2026-05-02 10:49:52');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('llm_max_tokens', '350000', 'int', '最大输出 Token 数', 'llm', '2026-05-02 10:49:52');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('llm_temperature', '0.7', 'float', '温度参数 (0.0-2.0)', 'llm', '2026-05-02 10:49:52');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('llm_timeout', '120', 'int', '请求超时 (秒)', 'llm', '2026-05-02 10:49:52');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('llm_api_version', '', 'str', 'API 版本 (仅 Anthropic)', 'llm', '2026-05-02 10:49:52');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('smtp_host', '', 'str', 'SMTP 服务器地址', 'smtp', '2026-04-25 12:54:54');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('smtp_port', '587', 'int', 'SMTP 端口', 'smtp', '2026-04-25 12:54:54');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('smtp_username', '', 'str', 'SMTP 用户名', 'smtp', '2026-04-25 12:54:54');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('smtp_password', '', 'str', 'SMTP 密码', 'smtp', '2026-04-25 12:54:54');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('smtp_from', 'noreply@sivan.local', 'str', '发件人地址', 'smtp', '2026-04-25 12:54:54');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('_migrated_llm_providers', '1', 'str', '', 'system', '2026-04-25 12:54:54');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('memory_session_ttl', '3600', 'int', '会话记忆 TTL (秒)', 'memory', '2026-04-25 14:10:34');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('memory_session_max_size', '1000', 'int', '会话记忆最大条数', 'memory', '2026-04-25 14:10:34');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('memory_min_retention', '0.5', 'float', '检索最低保留率', 'memory', '2026-04-25 14:10:54');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('memory_archive_threshold', '0.15', 'float', '归档阈值', 'memory', '2026-04-25 14:10:34');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('memory_max_context_memories', '20', 'int', '上下文注入最大条数', 'memory', '2026-04-25 14:10:54');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('auth_cookie_name', 'sivan_token', 'str', '认证 Cookie 名称', 'auth', '2026-04-25 14:10:34');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('auth_cookie_max_age', '86400', 'int', '认证 Cookie 有效期 (秒)', 'auth', '2026-04-25 14:10:34');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('auth_salt', '@sivan', 'str', '认证哈希盐值', 'auth', '2026-04-25 14:10:34');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('chroma_path', '/Volumes/ME/aigc/sivan/data/chroma', 'str', 'ChromaDB 向量存储路径', 'storage', '2026-04-25 14:10:34');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('agents_dir', '/Volumes/ME/aigc/sivan/agents', 'str', '智能体定义目录', 'storage', '2026-04-25 14:10:34');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('skills_dir', '/Volumes/ME/aigc/sivan/skills', 'str', '技能定义目录', 'storage', '2026-04-25 14:10:34');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('contracts_dir', '/Volumes/ME/aigc/sivan/contracts', 'str', '契约目录', 'storage', '2026-04-25 14:10:34');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('rag_chunk_size', '500', 'int', '文档分块大小（字符数）', 'rag', '2026-04-27 10:47:10');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('rag_chunk_overlap', '50', 'int', '分块重叠字符数', 'rag', '2026-04-27 10:47:10');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('rag_embedding_model', 'BAAI/bge-small-zh-v1.5', 'str', 'Embedding 模型名称', 'rag', '2026-04-27 10:47:10');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('rag_default_top_k', '5', 'int', '检索默认返回条数', 'rag', '2026-04-27 10:47:10');
