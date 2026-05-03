create table skill_usage
(
    id           INTEGER
        primary key autoincrement,
    skill_id     TEXT not null,
    agent_name   TEXT,
    timestamp    TIMESTAMP default CURRENT_TIMESTAMP,
    context_json TEXT
);

create index idx_skill_usage_skill
    on skill_usage (skill_id);

create index idx_skill_usage_timestamp
    on skill_usage (timestamp);

