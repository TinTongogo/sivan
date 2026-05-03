create table instinct_patterns
(
    pattern_id     TEXT not null
        primary key,
    task_type      TEXT not null,
    task_signature TEXT not null,
    topology_json  TEXT not null,
    success_count  INTEGER default '0',
    total_count    INTEGER default '0',
    confidence     FLOAT   default '0.0',
    is_active      INTEGER default '0',
    created_at     TEXT    default CURRENT_TIMESTAMP,
    updated_at     TEXT    default CURRENT_TIMESTAMP
);

