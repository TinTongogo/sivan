create table squad_phase_executions
(
    id                        INTEGER
        primary key autoincrement,
    execution_id              TEXT    not null,
    phase                     INTEGER not null,
    phase_name                TEXT    not null,
    status                    TEXT      default 'pending',
    primary_agent             TEXT    not null,
    supporting_agents_json    TEXT,
    started_at                TIMESTAMP,
    completed_at              TIMESTAMP,
    duration_minutes          REAL,
    outputs_json              TEXT,
    success_criteria_met_json TEXT,
    metrics_json              TEXT,
    error_message             TEXT,
    error_details_json        TEXT,
    created_at                TIMESTAMP default CURRENT_TIMESTAMP,
    updated_at                TIMESTAMP default CURRENT_TIMESTAMP,
    unique (execution_id, phase)
);

create index idx_squad_phase_executions_exec
    on squad_phase_executions (execution_id);

create index idx_squad_phase_executions_status
    on squad_phase_executions (status);

