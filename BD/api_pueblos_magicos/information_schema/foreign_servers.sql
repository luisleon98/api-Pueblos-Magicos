create view information_schema.foreign_servers
            (foreign_server_catalog, foreign_server_name, foreign_data_wrapper_catalog, foreign_data_wrapper_name,
             foreign_server_type, foreign_server_version, authorization_identifier)
as
SELECT _pg_foreign_servers.foreign_server_catalog,
       _pg_foreign_servers.foreign_server_name,
       _pg_foreign_servers.foreign_data_wrapper_catalog,
       _pg_foreign_servers.foreign_data_wrapper_name,
       _pg_foreign_servers.foreign_server_type,
       _pg_foreign_servers.foreign_server_version,
       _pg_foreign_servers.authorization_identifier
FROM information_schema._pg_foreign_servers;

alter table information_schema.foreign_servers
    owner to sail;

grant select on information_schema.foreign_servers to public;

