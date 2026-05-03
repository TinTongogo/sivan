create table alembic_version
(
    version_num VARCHAR(32) not null
        constraint alembic_version_pkc
            primary key
);

INSERT INTO alembic_version (version_num) VALUES ('0001');
