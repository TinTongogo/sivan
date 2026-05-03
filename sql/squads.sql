create table squads
(
    id                      INTEGER
        primary key autoincrement,
    squad_id                TEXT not null
        unique,
    name                    TEXT not null,
    description             TEXT,
    version                 TEXT      default '1.0.0',
    status                  TEXT      default 'active',
    category                TEXT,
    workflow_type           TEXT      default 'sequential',
    max_parallel_agents     INTEGER   default 1,
    estimated_duration_days INTEGER   default 7,
    quality_gates_json      TEXT,
    success_metrics_json    TEXT,
    created_by              TEXT,
    created_at              TIMESTAMP default CURRENT_TIMESTAMP,
    updated_at              TIMESTAMP default CURRENT_TIMESTAMP,
    last_executed_at        TIMESTAMP,
    execution_count         INTEGER   default 0,
    success_count           INTEGER   default 0,
    parent_squad_id         TEXT      default NULL
);

create index idx_squads_category
    on squads (category);

create index idx_squads_created_at
    on squads (created_at);

create index idx_squads_status
    on squads (status);

