create table sqlite_master
(
    type     TEXT,
    name     TEXT,
    tbl_name TEXT,
    rootpage INT,
    sql      TEXT
);

INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'skills', 'skills', 2, 'CREATE TABLE skills
            (
                id
                INTEGER
                PRIMARY
                KEY
                AUTOINCREMENT,
                skill_id
                TEXT
                UNIQUE
                NOT
                NULL,
                name
                TEXT
                NOT
                NULL,
                display_name
                TEXT,
                description
                TEXT
                NOT
                NULL,
                content
                TEXT
                NOT
                NULL,
                argument_hint
                TEXT,
                allowed_tools
                TEXT,
                category
                TEXT
                NOT
                NULL,
                maintainer_agent
                TEXT,
                tags
                TEXT,
                usage_count
                INTEGER
                DEFAULT
                0,
                last_used_at
                TIMESTAMP,
                status
                TEXT
                DEFAULT
                ''active'',
                created_at
                TIMESTAMP
                DEFAULT
                CURRENT_TIMESTAMP,
                updated_at
                TIMESTAMP
                DEFAULT
                CURRENT_TIMESTAMP
            )');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_skills_1', 'skills', 3, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'sqlite_sequence', 'sqlite_sequence', 4, 'CREATE TABLE sqlite_sequence(name,seq)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'skill_tags', 'skill_tags', 5, 'CREATE TABLE skill_tags (id INTEGER PRIMARY KEY AUTOINCREMENT, skill_id TEXT NOT NULL, tag TEXT NOT NULL, UNIQUE(skill_id, tag))');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_skill_tags_1', 'skill_tags', 6, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'skill_usage', 'skill_usage', 7, 'CREATE TABLE skill_usage
            (
                id
                INTEGER
                PRIMARY
                KEY
                AUTOINCREMENT,
                skill_id
                TEXT
                NOT
                NULL,
                agent_name
                TEXT,
                timestamp
                TIMESTAMP
                DEFAULT
                CURRENT_TIMESTAMP,
                context_json
                TEXT
            )');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'daily_budgets', 'daily_budgets', 9, 'CREATE TABLE daily_budgets (date TEXT PRIMARY KEY, budget_usd REAL NOT NULL DEFAULT 10.0, spent_usd REAL NOT NULL DEFAULT 0.0, alert_sent BOOLEAN NOT NULL DEFAULT FALSE, updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_daily_budgets_1', 'daily_budgets', 10, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'token_budget', 'token_budget', 11, 'CREATE TABLE token_budget (id INTEGER PRIMARY KEY AUTOINCREMENT, daily_budget REAL DEFAULT 10.0, monthly_budget REAL DEFAULT 300.0, alert_email TEXT, updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'squads', 'squads', 13, 'CREATE TABLE squads
            (
                id
                INTEGER
                PRIMARY
                KEY
                AUTOINCREMENT,
                squad_id
                TEXT
                UNIQUE
                NOT
                NULL,
                name
                TEXT
                NOT
                NULL,
                description
                TEXT,
                version
                TEXT
                DEFAULT
                ''1.0.0'',
                status
                TEXT
                DEFAULT
                ''active'',
                category
                TEXT,
                workflow_type
                TEXT
                DEFAULT
                ''sequential'',
                max_parallel_agents
                INTEGER
                DEFAULT
                1,
                estimated_duration_days
                INTEGER
                DEFAULT
                7,
                quality_gates_json
                TEXT,
                success_metrics_json
                TEXT,
                created_by
                TEXT,
                created_at
                TIMESTAMP
                DEFAULT
                CURRENT_TIMESTAMP,
                updated_at
                TIMESTAMP
                DEFAULT
                CURRENT_TIMESTAMP,
                last_executed_at
                TIMESTAMP,
                execution_count
                INTEGER
                DEFAULT
                0,
                success_count
                INTEGER
                DEFAULT
                0
            , parent_squad_id TEXT DEFAULT NULL)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_squads_1', 'squads', 14, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'squad_workflows', 'squad_workflows', 16, 'CREATE TABLE squad_workflows
            (
                id
                INTEGER
                PRIMARY
                KEY
                AUTOINCREMENT,
                squad_id
                TEXT
                NOT
                NULL,
                phase
                INTEGER
                NOT
                NULL,
                name
                TEXT
                NOT
                NULL,
                description
                TEXT,
                mode
                TEXT
                DEFAULT
                ''sequential'',
                parent_phase
                INTEGER,
                conditions_json
                TEXT,
                consensus_threshold
                REAL
                DEFAULT
                0.5,
                estimated_duration_hours
                INTEGER
                DEFAULT
                24,
                max_duration_hours
                INTEGER
                DEFAULT
                48,
                sort_order
                INTEGER
                DEFAULT
                0,
                created_at
                TIMESTAMP
                DEFAULT
                CURRENT_TIMESTAMP,
                updated_at
                TIMESTAMP
                DEFAULT
                CURRENT_TIMESTAMP,
                UNIQUE
            (
                squad_id,
                phase
            )
                )');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_squad_workflows_1', 'squad_workflows', 17, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'squad_agents', 'squad_agents', 18, 'CREATE TABLE squad_agents
            (
                id
                INTEGER
                PRIMARY
                KEY
                AUTOINCREMENT,
                squad_id
                TEXT
                NOT
                NULL,
                phase
                INTEGER
                NOT
                NULL,
                agent_name
                TEXT
                NOT
                NULL,
                role
                TEXT,
                sort_order
                INTEGER
                DEFAULT
                0,
                is_lead
                BOOLEAN
                DEFAULT
                FALSE,
                weight
                REAL
                DEFAULT
                1.0,
                conditions_json
                TEXT,
                created_at
                TIMESTAMP
                DEFAULT
                CURRENT_TIMESTAMP,
                updated_at
                TIMESTAMP
                DEFAULT
                CURRENT_TIMESTAMP,
                UNIQUE
            (
                squad_id,
                phase,
                agent_name
            )
                )');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_squad_agents_1', 'squad_agents', 19, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'squad_executions', 'squad_executions', 21, 'CREATE TABLE squad_executions
            (
                id
                INTEGER
                PRIMARY
                KEY
                AUTOINCREMENT,
                execution_id
                TEXT
                UNIQUE
                NOT
                NULL,
                squad_id
                TEXT
                NOT
                NULL,
                name
                TEXT
                NOT
                NULL,
                description
                TEXT,
                status
                TEXT
                DEFAULT
                ''pending'',
                current_phase
                INTEGER
                DEFAULT
                1,
                progress_percent
                REAL
                DEFAULT
                0,
                started_at
                TIMESTAMP,
                completed_at
                TIMESTAMP,
                estimated_completion_at
                TIMESTAMP,
                actual_duration_hours
                REAL,
                result_json
                TEXT,
                outputs_json
                TEXT,
                metrics_json
                TEXT,
                error_message
                TEXT,
                error_details_json
                TEXT,
                retry_count
                INTEGER
                DEFAULT
                0,
                created_by
                TEXT,
                created_at
                TIMESTAMP
                DEFAULT
                CURRENT_TIMESTAMP,
                updated_at
                TIMESTAMP
                DEFAULT
                CURRENT_TIMESTAMP
            )');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_squad_executions_1', 'squad_executions', 22, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'squad_phase_executions', 'squad_phase_executions', 23, 'CREATE TABLE squad_phase_executions
            (
                id
                INTEGER
                PRIMARY
                KEY
                AUTOINCREMENT,
                execution_id
                TEXT
                NOT
                NULL,
                phase
                INTEGER
                NOT
                NULL,
                phase_name
                TEXT
                NOT
                NULL,
                status
                TEXT
                DEFAULT
                ''pending'',
                primary_agent
                TEXT
                NOT
                NULL,
                supporting_agents_json
                TEXT,
                started_at
                TIMESTAMP,
                completed_at
                TIMESTAMP,
                duration_minutes
                REAL,
                outputs_json
                TEXT,
                success_criteria_met_json
                TEXT,
                metrics_json
                TEXT,
                error_message
                TEXT,
                error_details_json
                TEXT,
                created_at
                TIMESTAMP
                DEFAULT
                CURRENT_TIMESTAMP,
                updated_at
                TIMESTAMP
                DEFAULT
                CURRENT_TIMESTAMP,
                UNIQUE
            (
                execution_id,
                phase
            )
                )');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_squad_phase_executions_1', 'squad_phase_executions', 24, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'weekly_reports', 'weekly_reports', 26, 'CREATE TABLE weekly_reports
            (
                id
                INTEGER
                PRIMARY
                KEY
                AUTOINCREMENT,
                report_id
                TEXT
                UNIQUE
                NOT
                NULL,
                report_type
                TEXT
                DEFAULT
                ''weekly'',
                period_start
                DATE
                NOT
                NULL,
                period_end
                DATE
                NOT
                NULL,
                generated_at
                TIMESTAMP
                DEFAULT
                CURRENT_TIMESTAMP,
                total_executions
                INTEGER
                DEFAULT
                0,
                successful_executions
                INTEGER
                DEFAULT
                0,
                failed_executions
                INTEGER
                DEFAULT
                0,
                avg_duration_hours
                REAL
                DEFAULT
                0,
                active_squads
                INTEGER
                DEFAULT
                0,
                most_used_squad
                TEXT,
                most_successful_squad
                TEXT,
                top_performing_agents_json
                TEXT,
                most_used_agents_json
                TEXT,
                routing_decisions_total
                INTEGER
                DEFAULT
                0,
                routing_success_rate
                REAL
                DEFAULT
                0,
                top_routing_strategies_json
                TEXT,
                total_tokens_used
                INTEGER
                DEFAULT
                0,
                total_cost_usd
                REAL
                DEFAULT
                0,
                cost_by_agent_json
                TEXT,
                cost_by_model_json
                TEXT,
                total_skills_used
                INTEGER
                DEFAULT
                0,
                most_used_skills_json
                TEXT,
                skill_usage_trend_json
                TEXT,
                contracts_created
                INTEGER
                DEFAULT
                0,
                contracts_approved
                INTEGER
                DEFAULT
                0,
                contract_types_distribution_json
                TEXT,
                performance_trend_json
                TEXT,
                improvement_areas_json
                TEXT,
                recommendations_json
                TEXT,
                summary_markdown
                TEXT,
                detailed_analysis_json
                TEXT,
                charts_config_json
                TEXT,
                generated_by
                TEXT
                DEFAULT
                ''system'',
                is_published
                BOOLEAN
                DEFAULT
                FALSE,
                published_at
                TIMESTAMP
            )');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_weekly_reports_1', 'weekly_reports', 27, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'report_subscriptions', 'report_subscriptions', 29, 'CREATE TABLE report_subscriptions
            (
                id
                INTEGER
                PRIMARY
                KEY
                AUTOINCREMENT,
                email
                TEXT
                NOT
                NULL,
                report_type
                TEXT
                NOT
                NULL,
                delivery_method
                TEXT
                DEFAULT
                ''email'',
                delivery_config_json
                TEXT,
                is_active
                BOOLEAN
                DEFAULT
                TRUE,
                subscribed_at
                TIMESTAMP
                DEFAULT
                CURRENT_TIMESTAMP,
                unsubscribed_at
                TIMESTAMP,
                UNIQUE
            (
                email,
                report_type
            )
                )');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_report_subscriptions_1', 'report_subscriptions', 30, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'orchestration_patterns', 'orchestration_patterns', 32, 'CREATE TABLE orchestration_patterns
            (
                id
                INTEGER
                PRIMARY
                KEY
                AUTOINCREMENT,
                pattern_id
                TEXT
                UNIQUE
                NOT
                NULL,
                name
                TEXT
                NOT
                NULL,
                display_name
                TEXT,
                description
                TEXT,
                long_description
                TEXT,
                icon
                TEXT
                DEFAULT
                ''bi-diagram-3'',
                color
                TEXT
                DEFAULT
                ''#4361ee'',
                workflow_type
                TEXT
                NOT
                NULL,
                default_phases_json
                TEXT,
                flow_rules_json
                TEXT,
                suitable_for_json
                TEXT,
                sort_order
                INTEGER
                DEFAULT
                0,
                is_active
                BOOLEAN
                DEFAULT
                TRUE,
                created_at
                TIMESTAMP
                DEFAULT
                CURRENT_TIMESTAMP
            )');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_orchestration_patterns_1', 'orchestration_patterns', 33, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'settings', 'settings', 34, 'CREATE TABLE settings
            (
                key TEXT PRIMARY KEY NOT NULL,
                value TEXT NOT NULL DEFAULT '''',
                value_type TEXT NOT NULL DEFAULT ''str'',
                description TEXT DEFAULT '''',
                category TEXT NOT NULL DEFAULT ''general'',
                updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
            )');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_settings_1', 'settings', 35, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'llm_providers', 'llm_providers', 36, 'CREATE TABLE llm_providers
            (
                id TEXT PRIMARY KEY,
                name TEXT NOT NULL,
                auth_type TEXT NOT NULL DEFAULT ''bearer'',
                api_url TEXT NOT NULL DEFAULT '''',
                api_key TEXT NOT NULL DEFAULT '''',
                model TEXT NOT NULL DEFAULT '''',
                api_version TEXT NOT NULL DEFAULT '''',
                max_tokens INTEGER NOT NULL DEFAULT 4096,
                temperature REAL NOT NULL DEFAULT 0.7,
                timeout INTEGER NOT NULL DEFAULT 120,
                is_active INTEGER NOT NULL DEFAULT 0,
                created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
            )');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_llm_providers_1', 'llm_providers', 37, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'idx_skills_name', 'skills', 38, 'CREATE INDEX idx_skills_name ON skills(name)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'idx_skills_category', 'skills', 39, 'CREATE INDEX idx_skills_category ON skills(category)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'idx_skill_tags_tag', 'skill_tags', 40, 'CREATE INDEX idx_skill_tags_tag ON skill_tags(tag)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'idx_skill_usage_skill', 'skill_usage', 41, 'CREATE INDEX idx_skill_usage_skill ON skill_usage(skill_id)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'idx_skill_usage_timestamp', 'skill_usage', 43, 'CREATE INDEX idx_skill_usage_timestamp ON skill_usage(timestamp)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'idx_squads_status', 'squads', 47, 'CREATE INDEX idx_squads_status ON squads(status)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'idx_squads_category', 'squads', 48, 'CREATE INDEX idx_squads_category ON squads(category)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'idx_squads_created_at', 'squads', 49, 'CREATE INDEX idx_squads_created_at ON squads(created_at)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'idx_squad_agents_squad', 'squad_agents', 50, 'CREATE INDEX idx_squad_agents_squad ON squad_agents(squad_id)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'idx_squad_agents_agent', 'squad_agents', 51, 'CREATE INDEX idx_squad_agents_agent ON squad_agents(agent_name)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'idx_squad_workflows_squad', 'squad_workflows', 52, 'CREATE INDEX idx_squad_workflows_squad ON squad_workflows(squad_id)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'idx_squad_executions_squad', 'squad_executions', 53, 'CREATE INDEX idx_squad_executions_squad ON squad_executions(squad_id)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'idx_squad_executions_status', 'squad_executions', 54, 'CREATE INDEX idx_squad_executions_status ON squad_executions(status)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'idx_squad_executions_created_at', 'squad_executions', 55, 'CREATE INDEX idx_squad_executions_created_at ON squad_executions(created_at)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'idx_squad_phase_executions_exec', 'squad_phase_executions', 56, 'CREATE INDEX idx_squad_phase_executions_exec ON squad_phase_executions(execution_id)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'idx_squad_phase_executions_status', 'squad_phase_executions', 57, 'CREATE INDEX idx_squad_phase_executions_status ON squad_phase_executions(status)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'idx_weekly_reports_generated_at', 'weekly_reports', 58, 'CREATE INDEX idx_weekly_reports_generated_at ON weekly_reports(generated_at)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'idx_weekly_reports_published', 'weekly_reports', 59, 'CREATE INDEX idx_weekly_reports_published ON weekly_reports(is_published)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'idx_weekly_reports_period', 'weekly_reports', 60, 'CREATE INDEX idx_weekly_reports_period ON weekly_reports(period_start, period_end)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'idx_report_subscriptions_email', 'report_subscriptions', 61, 'CREATE INDEX idx_report_subscriptions_email ON report_subscriptions(email)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'idx_report_subscriptions_active', 'report_subscriptions', 62, 'CREATE INDEX idx_report_subscriptions_active ON report_subscriptions(is_active)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'contracts', 'contracts', 65, 'CREATE TABLE contracts (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                contract_id TEXT UNIQUE NOT NULL,
                contract_type TEXT NOT NULL,
                content_json TEXT NOT NULL,
                created_by TEXT NOT NULL,
                created_at TIMESTAMP NOT NULL,
                updated_at TIMESTAMP NOT NULL,
                version TEXT DEFAULT ''1.0.0'',
                status TEXT DEFAULT ''draft'',
                metadata_json TEXT
            )');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_contracts_1', 'contracts', 66, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'contract_tags', 'contract_tags', 68, 'CREATE TABLE contract_tags (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                contract_id TEXT NOT NULL,
                tag TEXT NOT NULL,
                FOREIGN KEY (contract_id) REFERENCES contracts(contract_id) ON DELETE CASCADE,
                UNIQUE(contract_id, tag)
            )');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_contract_tags_1', 'contract_tags', 69, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'contract_dependencies', 'contract_dependencies', 70, 'CREATE TABLE contract_dependencies (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                contract_id TEXT NOT NULL,
                depends_on_contract_id TEXT NOT NULL,
                FOREIGN KEY (contract_id) REFERENCES contracts(contract_id) ON DELETE CASCADE,
                UNIQUE(contract_id, depends_on_contract_id)
            )');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_contract_dependencies_1', 'contract_dependencies', 71, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'contract_versions', 'contract_versions', 72, 'CREATE TABLE contract_versions (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                contract_id TEXT NOT NULL,
                version TEXT NOT NULL,
                content_json TEXT NOT NULL,
                created_by TEXT NOT NULL,
                created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                change_description TEXT,
                FOREIGN KEY (contract_id) REFERENCES contracts(contract_id) ON DELETE CASCADE
            )');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'routing_decisions', 'routing_decisions', 73, 'CREATE TABLE routing_decisions (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                decision_id TEXT,
                task_description TEXT NOT NULL,
                task_hash TEXT,
                selected_agent TEXT,
                routing_strategy TEXT DEFAULT ''keyword'',
                status TEXT DEFAULT ''success'',
                confidence_score REAL,
                execution_time_ms REAL,
                context_json TEXT,
                created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                user_id TEXT,
                session_id TEXT
            )');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'candidate_scores', 'candidate_scores', 74, 'CREATE TABLE candidate_scores (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                decision_id INTEGER,
                agent_name TEXT NOT NULL,
                score REAL DEFAULT 0.0,
                rank INTEGER DEFAULT 0,
                features_json TEXT,
                FOREIGN KEY (decision_id) REFERENCES routing_decisions(id)
            )');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'user_feedback', 'user_feedback', 75, 'CREATE TABLE user_feedback (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                decision_id INTEGER,
                feedback_type TEXT DEFAULT ''correct'',
                corrected_agent TEXT,
                feedback_text TEXT,
                rating INTEGER,
                created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                FOREIGN KEY (decision_id) REFERENCES routing_decisions(id)
            )');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'agent_performance', 'agent_performance', 76, 'CREATE TABLE agent_performance (
                agent_name TEXT PRIMARY KEY,
                total_tasks INTEGER DEFAULT 0,
                success_count INTEGER DEFAULT 0,
                avg_confidence REAL,
                avg_execution_time_ms REAL,
                last_updated TIMESTAMP
            )');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_agent_performance_1', 'agent_performance', 77, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'strategy_performance', 'strategy_performance', 78, 'CREATE TABLE strategy_performance (
                strategy_name TEXT PRIMARY KEY,
                total_decisions INTEGER DEFAULT 0,
                success_rate REAL,
                avg_confidence REAL,
                avg_execution_time_ms REAL,
                feedback_correct_rate REAL,
                weight REAL DEFAULT 1.0
            )');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_strategy_performance_1', 'strategy_performance', 79, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'keyword_features', 'keyword_features', 81, 'CREATE TABLE keyword_features (
                keyword TEXT NOT NULL,
                agent_name TEXT NOT NULL,
                occurrence_count INTEGER DEFAULT 0,
                success_rate REAL,
                last_used TIMESTAMP,
                PRIMARY KEY (keyword, agent_name)
            )');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_keyword_features_1', 'keyword_features', 82, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'memory_entries', 'memory_entries', 83, 'CREATE TABLE memory_entries (
                memory_id TEXT PRIMARY KEY,
                level TEXT NOT NULL,
                scope_id TEXT NOT NULL,
                content TEXT NOT NULL,
                metadata_json TEXT DEFAULT ''{}'',
                created_at TIMESTAMP NOT NULL,
                last_accessed_at TIMESTAMP NOT NULL,
                access_count INTEGER DEFAULT 0,
                retention REAL DEFAULT 1.0,
                is_archived INTEGER DEFAULT 0,
                summary TEXT
            )');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_memory_entries_1', 'memory_entries', 84, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'idx_memory_scope', 'memory_entries', 85, 'CREATE INDEX idx_memory_scope
            ON memory_entries(level, scope_id)
        ');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'idx_memory_retention', 'memory_entries', 86, 'CREATE INDEX idx_memory_retention
            ON memory_entries(retention)
        ');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'execution_logs', 'execution_logs', 116, 'CREATE TABLE execution_logs
            (
                log_id INTEGER PRIMARY KEY AUTOINCREMENT,
                trace_id TEXT NOT NULL,
                parent_log_id INTEGER REFERENCES execution_logs(log_id),
                timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                level TEXT NOT NULL DEFAULT ''INFO'',
                source TEXT NOT NULL,
                action TEXT NOT NULL,
                message TEXT NOT NULL,
                metadata TEXT DEFAULT ''{}'',
                project_id TEXT DEFAULT '''',
                duration_ms INTEGER DEFAULT 0
            )');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'idx_execution_logs_trace', 'execution_logs', 117, 'CREATE INDEX idx_execution_logs_trace ON execution_logs(trace_id)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'idx_execution_logs_timestamp', 'execution_logs', 118, 'CREATE INDEX idx_execution_logs_timestamp ON execution_logs(timestamp)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'idx_execution_logs_source', 'execution_logs', 119, 'CREATE INDEX idx_execution_logs_source ON execution_logs(source, timestamp)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'conversations', 'conversations', 120, 'CREATE TABLE conversations (
                conversation_id TEXT PRIMARY KEY,
                project_id TEXT NOT NULL DEFAULT ''default'',
                title TEXT NOT NULL DEFAULT ''新对话'',
                status TEXT NOT NULL DEFAULT ''active'',
                created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
            )');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_conversations_1', 'conversations', 121, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'messages', 'messages', 122, 'CREATE TABLE messages (
                message_id TEXT PRIMARY KEY,
                conversation_id TEXT NOT NULL REFERENCES conversations(conversation_id),
                parent_id TEXT REFERENCES messages(message_id),
                role TEXT NOT NULL,
                agent_name TEXT,
                content TEXT NOT NULL,
                metadata TEXT DEFAULT ''{}'',
                status TEXT NOT NULL DEFAULT ''completed'',
                sort_order INTEGER NOT NULL DEFAULT 0,
                created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
            , trace_id TEXT DEFAULT '''')');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_messages_1', 'messages', 123, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'conversation_agents', 'conversation_agents', 124, 'CREATE TABLE conversation_agents (
                conversation_id TEXT NOT NULL REFERENCES conversations(conversation_id),
                agent_name TEXT NOT NULL,
                task_count INTEGER NOT NULL DEFAULT 0,
                PRIMARY KEY (conversation_id, agent_name)
            )');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_conversation_agents_1', 'conversation_agents', 125, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'idx_messages_conversation', 'messages', 127, 'CREATE INDEX idx_messages_conversation ON messages(conversation_id, sort_order)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'idx_messages_status', 'messages', 128, 'CREATE INDEX idx_messages_status ON messages(status)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'knowledge_bases', 'knowledge_bases', 129, 'CREATE TABLE knowledge_bases (
                kb_name TEXT PRIMARY KEY,
                description TEXT DEFAULT '''',
                document_count INTEGER DEFAULT 0,
                chunk_count INTEGER DEFAULT 0,
                created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
            )');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_knowledge_bases_1', 'knowledge_bases', 130, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'kb_documents', 'kb_documents', 140, 'CREATE TABLE kb_documents (
                doc_id TEXT PRIMARY KEY,
                kb_name TEXT NOT NULL,
                filename TEXT NOT NULL,
                source_path TEXT NOT NULL,
                file_type TEXT NOT NULL,
                chunk_count INTEGER DEFAULT 0,
                char_count INTEGER DEFAULT 0,
                created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, text_content TEXT DEFAULT '''',
                FOREIGN KEY (kb_name) REFERENCES knowledge_bases(kb_name)
            )');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_kb_documents_1', 'kb_documents', 141, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'token_usage', 'token_usage', 145, 'CREATE TABLE "token_usage" (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                agent_name TEXT NOT NULL,
                model TEXT NOT NULL,
                input_tokens INTEGER NOT NULL DEFAULT 0,
                output_tokens INTEGER NOT NULL DEFAULT 0,
                total_tokens INTEGER NOT NULL DEFAULT 0,
                cost_usd REAL NOT NULL DEFAULT 0.0,
                task_description TEXT,
                timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                metadata_json TEXT,
                created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
            )');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'idx_token_usage_agent', 'token_usage', 46, 'CREATE INDEX idx_token_usage_agent ON token_usage(agent_name)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'idx_token_usage_timestamp', 'token_usage', 153, 'CREATE INDEX idx_token_usage_timestamp ON token_usage(timestamp)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'idx_token_usage_model', 'token_usage', 155, 'CREATE INDEX idx_token_usage_model ON token_usage(model)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'idx_conversations_updated_at', 'conversations', 159, 'CREATE INDEX idx_conversations_updated_at ON conversations(updated_at)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'kb_documents_fts', 'kb_documents_fts', 0, 'CREATE VIRTUAL TABLE kb_documents_fts USING fts5(
                    doc_id UNINDEXED, kb_name UNINDEXED, filename UNINDEXED, text_content,
                    tokenize=''unicode61''
                )');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'kb_documents_fts_data', 'kb_documents_fts_data', 179, 'CREATE TABLE ''kb_documents_fts_data''(id INTEGER PRIMARY KEY, block BLOB)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'kb_documents_fts_idx', 'kb_documents_fts_idx', 180, 'CREATE TABLE ''kb_documents_fts_idx''(segid, term, pgno, PRIMARY KEY(segid, term)) WITHOUT ROWID');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'kb_documents_fts_content', 'kb_documents_fts_content', 181, 'CREATE TABLE ''kb_documents_fts_content''(id INTEGER PRIMARY KEY, c0, c1, c2, c3)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'kb_documents_fts_docsize', 'kb_documents_fts_docsize', 182, 'CREATE TABLE ''kb_documents_fts_docsize''(id INTEGER PRIMARY KEY, sz BLOB)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'kb_documents_fts_config', 'kb_documents_fts_config', 183, 'CREATE TABLE ''kb_documents_fts_config''(k PRIMARY KEY, v) WITHOUT ROWID');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'alembic_version', 'alembic_version', 143, 'CREATE TABLE alembic_version (
	version_num VARCHAR(32) NOT NULL, 
	CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num)
)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_alembic_version_1', 'alembic_version', 149, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'projects', 'projects', 44, 'CREATE TABLE projects (
	project_id TEXT NOT NULL, 
	name TEXT NOT NULL, 
	description TEXT DEFAULT '''', 
	status TEXT DEFAULT ''active'' NOT NULL, 
	created_by TEXT DEFAULT '''', 
	created_at TEXT DEFAULT CURRENT_TIMESTAMP, 
	updated_at TEXT DEFAULT CURRENT_TIMESTAMP, 
	PRIMARY KEY (project_id)
)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_projects_1', 'projects', 45, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'kb_project_assignments', 'kb_project_assignments', 131, 'CREATE TABLE kb_project_assignments (
	kb_name TEXT NOT NULL, 
	project_id TEXT NOT NULL, 
	PRIMARY KEY (kb_name, project_id)
)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_kb_project_assignments_1', 'kb_project_assignments', 132, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'instinct_patterns', 'instinct_patterns', 133, 'CREATE TABLE instinct_patterns (
	pattern_id TEXT NOT NULL, 
	task_type TEXT NOT NULL, 
	task_signature TEXT NOT NULL, 
	topology_json TEXT NOT NULL, 
	success_count INTEGER DEFAULT ''0'', 
	total_count INTEGER DEFAULT ''0'', 
	confidence FLOAT DEFAULT ''0.0'', 
	is_active INTEGER DEFAULT ''0'', 
	created_at TEXT DEFAULT CURRENT_TIMESTAMP, 
	updated_at TEXT DEFAULT CURRENT_TIMESTAMP, 
	PRIMARY KEY (pattern_id)
)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_instinct_patterns_1', 'instinct_patterns', 134, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'topology_feedback', 'topology_feedback', 135, 'CREATE TABLE topology_feedback (
	id INTEGER NOT NULL, 
	task_signature TEXT NOT NULL, 
	topology TEXT NOT NULL, 
	satisfaction FLOAT NOT NULL, 
	execution_id TEXT DEFAULT '''', 
	created_at TEXT DEFAULT CURRENT_TIMESTAMP, 
	PRIMARY KEY (id)
)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'agents', 'agents', 8, 'CREATE TABLE "agents"
(
    id                INTEGER
        primary key autoincrement,
    agent_id          TEXT                 not null
        unique,
    display_name      TEXT                 not null,
    description       TEXT,
    category          TEXT      default '''',
    system_prompt     TEXT      default '''' not null,
    craft_declaration TEXT      default '''',
    exit_criteria     TEXT      default '''',
    anti_patterns     TEXT      default '''',
    tools             TEXT      default ''[]'',
    skill_ids         TEXT      default ''[]'',
    status            TEXT      default ''active'',
    version           TEXT      default ''1.0.0'',
    created_by        TEXT      default '''',
    usage_count       INTEGER   default 0,
    last_used_at      TIMESTAMP,
    created_at        TIMESTAMP default CURRENT_TIMESTAMP,
    updated_at        TIMESTAMP default CURRENT_TIMESTAMP
)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_agents_1', 'agents', 98, null);
