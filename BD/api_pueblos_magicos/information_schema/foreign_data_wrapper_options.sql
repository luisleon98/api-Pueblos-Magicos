create view information_schema.foreign_data_wrapper_options
            (foreign_data_wrapper_catalog, foreign_data_wrapper_name, option_name, option_value) as
SELECT w.foreign_data_wrapper_catalog,
       w.foreign_data_wrapper_name,
       (pg_options_to_table(w.fdwoptions)).option_name::information_schema.sql_identifier  AS option_name,
       (pg_options_to_table(w.fdwoptions)).option_value::information_schema.character_data AS option_value
FROM information_schema._pg_foreign_data_wrappers w;

alter table information_schema.foreign_data_wrapper_options
    owner to sail;

grant select on information_schema.foreign_data_wrapper_options to public;

