create table candidate_scores
(
    id            INTEGER
        primary key autoincrement,
    decision_id   INTEGER
        references routing_decisions,
    agent_name    TEXT not null,
    score         REAL    default 0.0,
    rank          INTEGER default 0,
    features_json TEXT
);

