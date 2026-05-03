create table kb_documents_fts_idx
(
    segid not null,
    term  not null,
    pgno,
    primary key (segid, term)
)
    without rowid;

