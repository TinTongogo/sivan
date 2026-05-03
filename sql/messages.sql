create table messages
(
    message_id      TEXT
        primary key,
    conversation_id TEXT                          not null
        references conversations,
    parent_id       TEXT
        references messages,
    role            TEXT                          not null,
    agent_name      TEXT,
    content         TEXT                          not null,
    metadata        TEXT      default '{}',
    status          TEXT      default 'completed' not null,
    sort_order      INTEGER   default 0           not null,
    created_at      TIMESTAMP default CURRENT_TIMESTAMP,
    trace_id        TEXT      default ''
);

create index idx_messages_conversation
    on messages (conversation_id, sort_order);

create index idx_messages_status
    on messages (status);

