create table squad_agents
(
    id              INTEGER
        primary key autoincrement,
    squad_id        TEXT    not null,
    phase           INTEGER not null,
    agent_name      TEXT    not null,
    role            TEXT,
    sort_order      INTEGER   default 0,
    is_lead         BOOLEAN   default FALSE,
    weight          REAL      default 1.0,
    conditions_json TEXT,
    created_at      TIMESTAMP default CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP default CURRENT_TIMESTAMP,
    unique (squad_id, phase, agent_name)
);

create index idx_squad_agents_agent
    on squad_agents (agent_name);

create index idx_squad_agents_squad
    on squad_agents (squad_id);

