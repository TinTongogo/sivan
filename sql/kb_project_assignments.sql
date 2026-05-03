create table kb_project_assignments
(
    kb_name    TEXT not null,
    project_id TEXT not null,
    primary key (kb_name, project_id)
);

