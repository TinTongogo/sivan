create table skill_tags
(
    id       INTEGER
        primary key autoincrement,
    skill_id TEXT not null,
    tag      TEXT not null,
    unique (skill_id, tag)
);

create index idx_skill_tags_tag
    on skill_tags (tag);

