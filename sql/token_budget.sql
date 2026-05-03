create table token_budget
(
    id             INTEGER
        primary key autoincrement,
    daily_budget   REAL      default 10.0,
    monthly_budget REAL      default 300.0,
    alert_email    TEXT,
    updated_at     TIMESTAMP default CURRENT_TIMESTAMP
);

INSERT INTO token_budget (id, daily_budget, monthly_budget, alert_email, updated_at) VALUES (1, 10, 300, 'tinton@msn.cn', '2026-04-30 19:05:32');
