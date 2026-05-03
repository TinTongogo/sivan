create table strategy_performance
(
    strategy_name         TEXT
        primary key,
    total_decisions       INTEGER default 0,
    success_rate          REAL,
    avg_confidence        REAL,
    avg_execution_time_ms REAL,
    feedback_correct_rate REAL,
    weight                REAL    default 1.0
);

INSERT INTO strategy_performance (strategy_name, total_decisions, success_rate, avg_confidence, avg_execution_time_ms, feedback_correct_rate, weight) VALUES ('keyword', 2, 1, 0, 0, 1, 1);
