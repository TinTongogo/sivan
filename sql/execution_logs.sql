create table execution_logs
(
    log_id        INTEGER
        primary key autoincrement,
    trace_id      TEXT                     not null,
    parent_log_id INTEGER
        references execution_logs,
    timestamp     TIMESTAMP default CURRENT_TIMESTAMP,
    level         TEXT      default 'INFO' not null,
    source        TEXT                     not null,
    action        TEXT                     not null,
    message       TEXT                     not null,
    metadata      TEXT      default '{}',
    project_id    TEXT      default '',
    duration_ms   INTEGER   default 0
);

create index idx_execution_logs_source
    on execution_logs (source, timestamp);

create index idx_execution_logs_timestamp
    on execution_logs (timestamp);

create index idx_execution_logs_trace
    on execution_logs (trace_id);

