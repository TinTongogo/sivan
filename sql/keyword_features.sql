create table keyword_features
(
    keyword          TEXT not null,
    agent_name       TEXT not null,
    occurrence_count INTEGER default 0,
    success_rate     REAL,
    last_used        TIMESTAMP,
    primary key (keyword, agent_name)
);

