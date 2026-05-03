create table knowledge_bases
(
    kb_name        TEXT
        primary key,
    description    TEXT      default '',
    document_count INTEGER   default 0,
    chunk_count    INTEGER   default 0,
    created_at     TIMESTAMP default CURRENT_TIMESTAMP,
    updated_at     TIMESTAMP default CURRENT_TIMESTAMP
);

