create table squad_workflows
(
    id                       INTEGER
        primary key autoincrement,
    squad_id                 TEXT    not null,
    phase                    INTEGER not null,
    name                     TEXT    not null,
    description              TEXT,
    mode                     TEXT      default 'sequential',
    parent_phase             INTEGER,
    conditions_json          TEXT,
    consensus_threshold      REAL      default 0.5,
    estimated_duration_hours INTEGER   default 24,
    max_duration_hours       INTEGER   default 48,
    sort_order               INTEGER   default 0,
    created_at               TIMESTAMP default CURRENT_TIMESTAMP,
    updated_at               TIMESTAMP default CURRENT_TIMESTAMP,
    unique (squad_id, phase)
);

create index idx_squad_workflows_squad
    on squad_workflows (squad_id);

