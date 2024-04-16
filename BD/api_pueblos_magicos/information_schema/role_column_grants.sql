create view information_schema.role_column_grants
            (grantor, grantee, table_catalog, table_schema, table_name, column_name, privilege_type, is_grantable) as
SELECT column_privileges.grantor,
       column_privileges.grantee,
       column_privileges.table_catalog,
       column_privileges.table_schema,
       column_privileges.table_name,
       column_privileges.column_name,
       column_privileges.privilege_type,
       column_privileges.is_grantable
FROM information_schema.column_privileges
WHERE (column_privileges.grantor::name IN (SELECT enabled_roles.role_name
                                           FROM information_schema.enabled_roles))
   OR (column_privileges.grantee::name IN (SELECT enabled_roles.role_name
                                           FROM information_schema.enabled_roles));

alter table information_schema.role_column_grants
    owner to sail;

grant select on information_schema.role_column_grants to public;

