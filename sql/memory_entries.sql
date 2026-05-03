create table memory_entries
(
    memory_id        TEXT
        primary key,
    level            TEXT      not null,
    scope_id         TEXT      not null,
    content          TEXT      not null,
    metadata_json    TEXT    default '{}',
    created_at       TIMESTAMP not null,
    last_accessed_at TIMESTAMP not null,
    access_count     INTEGER default 0,
    retention        REAL    default 1.0,
    is_archived      INTEGER default 0,
    summary          TEXT
);

create index idx_memory_retention
    on memory_entries (retention);

create index idx_memory_scope
    on memory_entries (level, scope_id);

INSERT INTO memory_entries (memory_id, level, scope_id, content, metadata_json, created_at, last_accessed_at, access_count, retention, is_archived, summary) VALUES ('d3cf7399-058a-4f44-aaf0-074ad8ae0c7e', 'project', 'sivan', '代码要简洁、极致、不妥协。做事要胆大、心细、极致，既不屎上雕花，也不狗尾续貂，更不要到处拉屎。沟通和思考时要中文、简洁、抓要点、如实汇报。', '{"source": "manual"}', '2026-04-26T23:48:03.537976', '2026-04-26T23:48:03.548326', 1, 1, 0, null);
