create view information_schema.foreign_server_options
            (foreign_server_catalog, foreign_server_name, option_name, option_value) as
SELECT s.foreign_server_catalog,
       s.foreign_server_name,
       (pg_options_to_table(s.srvoptions)).option_name::information_schema.sql_identifier  AS option_name,
       (pg_options_to_table(s.srvoptions)).option_value::information_schema.character_data AS option_value
FROM information_schema._pg_foreign_servers s;

alter table information_schema.foreign_server_options
    owner to sail;

grant select on information_schema.foreign_server_options to public;

