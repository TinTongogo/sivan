create table token_usage
(
    id               INTEGER
        primary key autoincrement,
    agent_name       TEXT                                not null,
    model            TEXT                                not null,
    input_tokens     INTEGER   default 0                 not null,
    output_tokens    INTEGER   default 0                 not null,
    total_tokens     INTEGER   default 0                 not null,
    cost_usd         REAL      default 0.0               not null,
    task_description TEXT,
    timestamp        TIMESTAMP default CURRENT_TIMESTAMP not null,
    metadata_json    TEXT,
    created_at       TIMESTAMP default CURRENT_TIMESTAMP
);

create index idx_token_usage_agent
    on token_usage (agent_name);

create index idx_token_usage_model
    on token_usage (model);

create index idx_token_usage_timestamp
    on token_usage (timestamp);

