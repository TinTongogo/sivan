create table conversation_agents
(
    conversation_id TEXT              not null
        references conversations,
    agent_name      TEXT              not null,
    task_count      INTEGER default 0 not null,
    primary key (conversation_id, agent_name)
);

