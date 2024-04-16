create view information_schema.column_options
            (table_catalog, table_schema, table_name, column_name, option_name, option_value) as
SELECT current_database()::information_schema.sql_identifier                                  AS table_catalog,
       c.nspname::information_schema.sql_identifier                                           AS table_schema,
       c.relname::information_schema.sql_identifier                                           AS table_name,
       c.attname::information_schema.sql_identifier                                           AS column_name,
       (pg_options_to_table(c.attfdwoptions)).option_name::information_schema.sql_identifier  AS option_name,
       (pg_options_to_table(c.attfdwoptions)).option_value::information_schema.character_data AS option_value
FROM information_schema._pg_foreign_table_columns c;

alter table information_schema.column_options
    owner to sail;

grant select on information_schema.column_options to public;

