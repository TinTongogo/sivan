create table report_subscriptions
(
    id                   INTEGER
        primary key autoincrement,
    email                TEXT not null,
    report_type          TEXT not null,
    delivery_method      TEXT      default 'email',
    delivery_config_json TEXT,
    is_active            BOOLEAN   default TRUE,
    subscribed_at        TIMESTAMP default CURRENT_TIMESTAMP,
    unsubscribed_at      TIMESTAMP,
    unique (email, report_type)
);

create index idx_report_subscriptions_active
    on report_subscriptions (is_active);

create index idx_report_subscriptions_email
    on report_subscriptions (email);

