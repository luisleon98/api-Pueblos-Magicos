create view information_schema.enabled_roles(role_name) as
SELECT a.rolname::information_schema.sql_identifier AS role_name
FROM pg_authid a
WHERE pg_has_role(a.oid, 'USAGE'::text);

alter table information_schema.enabled_roles
    owner to sail;

grant select on information_schema.enabled_roles to public;

