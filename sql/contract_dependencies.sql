create table contract_dependencies
(
    id                     INTEGER
        primary key autoincrement,
    contract_id            TEXT not null
        references contracts (contract_id)
            on delete cascade,
    depends_on_contract_id TEXT not null,
    unique (contract_id, depends_on_contract_id)
);

