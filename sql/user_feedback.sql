create table user_feedback
(
    id              INTEGER
        primary key autoincrement,
    decision_id     INTEGER
        references routing_decisions,
    feedback_type   TEXT      default 'correct',
    corrected_agent TEXT,
    feedback_text   TEXT,
    rating          INTEGER,
    created_at      TIMESTAMP default CURRENT_TIMESTAMP
);

