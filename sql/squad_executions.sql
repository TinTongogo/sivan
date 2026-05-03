create table squad_executions
(
    id                      INTEGER
        primary key autoincrement,
    execution_id            TEXT not null
        unique,
    squad_id                TEXT not null,
    name                    TEXT not null,
    description             TEXT,
    status                  TEXT      default 'pending',
    current_phase           INTEGER   default 1,
    progress_percent        REAL      default 0,
    started_at              TIMESTAMP,
    completed_at            TIMESTAMP,
    estimated_completion_at TIMESTAMP,
    actual_duration_hours   REAL,
    result_json             TEXT,
    outputs_json            TEXT,
    metrics_json            TEXT,
    error_message           TEXT,
    error_details_json      TEXT,
    retry_count             INTEGER   default 0,
    created_by              TEXT,
    created_at              TIMESTAMP default CURRENT_TIMESTAMP,
    updated_at              TIMESTAMP default CURRENT_TIMESTAMP
);

create index idx_squad_executions_created_at
    on squad_executions (created_at);

create index idx_squad_executions_squad
    on squad_executions (squad_id);

create index idx_squad_executions_status
    on squad_executions (status);

