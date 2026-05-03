create table contracts
(
    id            INTEGER
        primary key autoincrement,
    contract_id   TEXT      not null
        unique,
    contract_type TEXT      not null,
    content_json  TEXT      not null,
    created_by    TEXT      not null,
    created_at    TIMESTAMP not null,
    updated_at    TIMESTAMP not null,
    version       TEXT default '1.0.0',
    status        TEXT default 'draft',
    metadata_json TEXT
);

