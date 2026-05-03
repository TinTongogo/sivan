create table kb_documents
(
    doc_id       TEXT
        primary key,
    kb_name      TEXT not null
        references knowledge_bases,
    filename     TEXT not null,
    source_path  TEXT not null,
    file_type    TEXT not null,
    chunk_count  INTEGER   default 0,
    char_count   INTEGER   default 0,
    created_at   TIMESTAMP default CURRENT_TIMESTAMP,
    text_content TEXT      default ''
);

