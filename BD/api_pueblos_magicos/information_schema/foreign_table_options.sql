create view information_schema.foreign_table_options
            (foreign_table_catalog, foreign_table_schema, foreign_table_name, option_name, option_value) as
SELECT t.foreign_table_catalog,
       t.foreign_table_schema,
       t.foreign_table_name,
       (pg_options_to_table(t.ftoptions)).option_name::information_schema.sql_identifier  AS option_name,
       (pg_options_to_table(t.ftoptions)).option_value::information_schema.character_data AS option_value
FROM information_schema._pg_foreign_tables t;

alter table information_schema.foreign_table_options
    owner to sail;

grant select on information_schema.foreign_table_options to public;

