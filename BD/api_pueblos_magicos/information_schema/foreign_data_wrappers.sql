create view information_schema.foreign_data_wrappers
            (foreign_data_wrapper_catalog, foreign_data_wrapper_name, authorization_identifier, library_name,
             foreign_data_wrapper_language)
as
SELECT w.foreign_data_wrapper_catalog,
       w.foreign_data_wrapper_name,
       w.authorization_identifier,
       NULL::character varying::information_schema.character_data AS library_name,
       w.foreign_data_wrapper_language
FROM information_schema._pg_foreign_data_wrappers w;

alter table information_schema.foreign_data_wrappers
    owner to sail;

grant select on information_schema.foreign_data_wrappers to public;

