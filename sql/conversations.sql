create table conversations
(
    conversation_id TEXT
        primary key,
    project_id      TEXT      default 'default' not null,
    title           TEXT      default '新对话'  not null,
    status          TEXT      default 'active'  not null,
    created_at      TIMESTAMP default CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP default CURRENT_TIMESTAMP
);

create index idx_conversations_updated_at
    on conversations (updated_at);

