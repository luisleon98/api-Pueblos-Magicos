create view information_schema.user_mappings(authorization_identifier, foreign_server_catalog, foreign_server_name) as
SELECT _pg_user_mappings.authorization_identifier,
       _pg_user_mappings.foreign_server_catalog,
       _pg_user_mappings.foreign_server_name
FROM information_schema._pg_user_mappings;

alter table information_schema.user_mappings
    owner to sail;

grant select on information_schema.user_mappings to public;

