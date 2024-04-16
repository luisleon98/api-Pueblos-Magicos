create view information_schema.information_schema_catalog_name(catalog_name) as
SELECT current_database()::information_schema.sql_identifier AS catalog_name;

alter table information_schema.information_schema_catalog_name
    owner to sail;

grant select on information_schema.information_schema_catalog_name to public;

