create table daily_budgets
(
    date       TEXT
        primary key,
    budget_usd REAL      default 10.0  not null,
    spent_usd  REAL      default 0.0   not null,
    alert_sent BOOLEAN   default FALSE not null,
    updated_at TIMESTAMP default CURRENT_TIMESTAMP
);

