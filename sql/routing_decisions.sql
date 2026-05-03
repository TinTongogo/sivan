create table routing_decisions
(
    id                INTEGER
        primary key autoincrement,
    decision_id       TEXT,
    task_description  TEXT not null,
    task_hash         TEXT,
    selected_agent    TEXT,
    routing_strategy  TEXT      default 'keyword',
    status            TEXT      default 'success',
    confidence_score  REAL,
    execution_time_ms REAL,
    context_json      TEXT,
    created_at        TIMESTAMP default CURRENT_TIMESTAMP,
    user_id           TEXT,
    session_id        TEXT
);

