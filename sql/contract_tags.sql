create table contract_tags
(
    id          INTEGER
        primary key autoincrement,
    contract_id TEXT not null
        references contracts (contract_id)
            on delete cascade,
    tag         TEXT not null,
    unique (contract_id, tag)
);

