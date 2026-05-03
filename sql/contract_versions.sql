create table contract_versions
(
    id                 INTEGER
        primary key autoincrement,
    contract_id        TEXT not null
        references contracts (contract_id)
            on delete cascade,
    version            TEXT not null,
    content_json       TEXT not null,
    created_by         TEXT not null,
    created_at         TIMESTAMP default CURRENT_TIMESTAMP,
    change_description TEXT
);

