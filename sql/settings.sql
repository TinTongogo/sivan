create table settings
(
    key         TEXT                   not null
        primary key,
    value       TEXT default ''        not null,
    value_type  TEXT default 'str'     not null,
    description TEXT default '',
    category    TEXT default 'general' not null,
    updated_at  TEXT default CURRENT_TIMESTAMP
);

INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('llm_provider', 'anthropic', 'str', 'LLM 提供商 (anthropic, ollama, deepseek, openai)', 'llm', '2026-05-03 15:26:05');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('llm_api_key', '', 'str', 'LLM API Key', 'llm', '2026-05-03 15:26:05');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('llm_api_url', 'https://api.anthropic.com/v1/messages', 'str', 'LLM API URL', 'llm', '2026-05-03 15:26:05');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('llm_model', 'claude-sonnet-4-20250514', 'str', 'LLM 模型名称', 'llm', '2026-05-03 15:26:05');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('llm_max_tokens', '4096', 'int', '最大输出 Token 数', 'llm', '2026-05-03 15:26:05');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('llm_temperature', '0.7', 'float', '温度参数 (0.0-2.0)', 'llm', '2026-05-03 15:26:05');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('llm_timeout', '120', 'int', '请求超时 (秒)', 'llm', '2026-05-03 15:26:05');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('llm_api_version', '2023-06-01', 'str', 'API 版本 (仅 Anthropic)', 'llm', '2026-05-03 15:26:05');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('smtp_host', '', 'str', 'SMTP 服务器地址', 'smtp', '2026-05-03 15:26:05');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('smtp_port', '587', 'int', 'SMTP 端口', 'smtp', '2026-05-03 15:26:05');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('smtp_username', '', 'str', 'SMTP 用户名', 'smtp', '2026-05-03 15:26:05');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('smtp_password', '', 'str', 'SMTP 密码', 'smtp', '2026-05-03 15:26:05');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('smtp_from', 'noreply@sivan.local', 'str', '发件人地址', 'smtp', '2026-05-03 15:26:05');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('memory_session_ttl', '3600', 'int', '会话记忆 TTL (秒)', 'memory', '2026-05-03 15:26:05');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('memory_session_max_size', '1000', 'int', '会话记忆最大条数', 'memory', '2026-05-03 15:26:05');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('memory_min_retention', '0.3', 'float', '检索最低保留率', 'memory', '2026-05-03 15:26:05');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('memory_archive_threshold', '0.15', 'float', '归档阈值', 'memory', '2026-05-03 15:26:05');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('memory_max_context_memories', '10', 'int', '上下文注入最大条数', 'memory', '2026-05-03 15:26:05');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('auth_cookie_name', 'sivan_token', 'str', '认证 Cookie 名称', 'auth', '2026-05-03 15:26:05');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('auth_cookie_max_age', '86400', 'int', '认证 Cookie 有效期 (秒)', 'auth', '2026-05-03 15:26:05');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('auth_salt', '@sivan', 'str', '认证哈希盐值', 'auth', '2026-05-03 15:26:05');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('rag_chunk_size', '500', 'int', '文档分块大小（字符数）', 'rag', '2026-05-03 15:26:05');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('rag_chunk_overlap', '50', 'int', '分块重叠字符数', 'rag', '2026-05-03 15:26:05');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('rag_embedding_model', 'BAAI/bge-small-zh-v1.5', 'str', 'Embedding 模型名称', 'rag', '2026-05-03 15:26:05');
INSERT INTO settings (key, value, value_type, description, category, updated_at) VALUES ('rag_default_top_k', '5', 'int', '检索默认返回条数', 'rag', '2026-05-03 15:26:05');
