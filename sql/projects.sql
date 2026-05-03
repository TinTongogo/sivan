create table projects
(
    project_id  TEXT                  not null
        primary key,
    name        TEXT                  not null,
    description TEXT default '',
    status      TEXT default 'active' not null,
    created_by  TEXT default '',
    created_at  TEXT default CURRENT_TIMESTAMP,
    updated_at  TEXT default CURRENT_TIMESTAMP
);

INSERT INTO projects (project_id, name, description, status, created_by, created_at, updated_at) VALUES ('479c99d98d14', '嗷嗷', '', 'active', '', '2026-05-03 07:52:44', '2026-05-03 07:52:44');
INSERT INTO projects (project_id, name, description, status, created_by, created_at, updated_at) VALUES ('default', '默认项目', '系统默认项目', 'active', 'system', '2026-05-03 08:59:22', '2026-05-03 10:02:16');
