create table topology_feedback
(
    id             INTEGER not null
        primary key,
    task_signature TEXT    not null,
    topology       TEXT    not null,
    satisfaction   FLOAT   not null,
    execution_id   TEXT default '',
    created_at     TEXT default CURRENT_TIMESTAMP
);

