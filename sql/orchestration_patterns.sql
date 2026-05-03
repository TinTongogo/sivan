create table orchestration_patterns
(
    id                  INTEGER
        primary key autoincrement,
    pattern_id          TEXT not null
        unique,
    name                TEXT not null,
    display_name        TEXT,
    description         TEXT,
    long_description    TEXT,
    icon                TEXT      default 'bi-diagram-3',
    color               TEXT      default '#4361ee',
    workflow_type       TEXT not null,
    default_phases_json TEXT,
    flow_rules_json     TEXT,
    suitable_for_json   TEXT,
    sort_order          INTEGER   default 0,
    is_active           BOOLEAN   default TRUE,
    created_at          TIMESTAMP default CURRENT_TIMESTAMP
);

