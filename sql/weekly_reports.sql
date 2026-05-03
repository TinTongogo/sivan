create table weekly_reports
(
    id                               INTEGER
        primary key autoincrement,
    report_id                        TEXT not null
        unique,
    report_type                      TEXT      default 'weekly',
    period_start                     DATE not null,
    period_end                       DATE not null,
    generated_at                     TIMESTAMP default CURRENT_TIMESTAMP,
    total_executions                 INTEGER   default 0,
    successful_executions            INTEGER   default 0,
    failed_executions                INTEGER   default 0,
    avg_duration_hours               REAL      default 0,
    active_squads                    INTEGER   default 0,
    most_used_squad                  TEXT,
    most_successful_squad            TEXT,
    top_performing_agents_json       TEXT,
    most_used_agents_json            TEXT,
    routing_decisions_total          INTEGER   default 0,
    routing_success_rate             REAL      default 0,
    top_routing_strategies_json      TEXT,
    total_tokens_used                INTEGER   default 0,
    total_cost_usd                   REAL      default 0,
    cost_by_agent_json               TEXT,
    cost_by_model_json               TEXT,
    total_skills_used                INTEGER   default 0,
    most_used_skills_json            TEXT,
    skill_usage_trend_json           TEXT,
    contracts_created                INTEGER   default 0,
    contracts_approved               INTEGER   default 0,
    contract_types_distribution_json TEXT,
    performance_trend_json           TEXT,
    improvement_areas_json           TEXT,
    recommendations_json             TEXT,
    summary_markdown                 TEXT,
    detailed_analysis_json           TEXT,
    charts_config_json               TEXT,
    generated_by                     TEXT      default 'system',
    is_published                     BOOLEAN   default FALSE,
    published_at                     TIMESTAMP
);

create index idx_weekly_reports_generated_at
    on weekly_reports (generated_at);

create index idx_weekly_reports_period
    on weekly_reports (period_start, period_end);

create index idx_weekly_reports_published
    on weekly_reports (is_published);

