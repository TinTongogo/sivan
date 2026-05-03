create table agent_performance
(
    agent_name            TEXT
        primary key,
    total_tasks           INTEGER default 0,
    success_count         INTEGER default 0,
    avg_confidence        REAL,
    avg_execution_time_ms REAL,
    last_updated          TIMESTAMP
);

