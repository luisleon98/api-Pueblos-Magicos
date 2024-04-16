create view information_schema.foreign_tables
            (foreign_table_catalog, foreign_table_schema, foreign_table_name, foreign_server_catalog,
             foreign_server_name) as
SELECT _pg_foreign_tables.foreign_table_catalog,
       _pg_foreign_tables.foreign_table_schema,
       _pg_foreign_tables.foreign_table_name,
       _pg_foreign_tables.foreign_server_catalog,
       _pg_foreign_tables.foreign_server_name
FROM information_schema._pg_foreign_tables;

alter table information_schema.foreign_tables
    owner to sail;

grant select on information_schema.foreign_tables to public;

