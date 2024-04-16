create view information_schema.role_table_grants
            (grantor, grantee, table_catalog, table_schema, table_name, privilege_type, is_grantable, with_hierarchy) as
SELECT table_privileges.grantor,
       table_privileges.grantee,
       table_privileges.table_catalog,
       table_privileges.table_schema,
       table_privileges.table_name,
       table_privileges.privilege_type,
       table_privileges.is_grantable,
       table_privileges.with_hierarchy
FROM information_schema.table_privileges
WHERE (table_privileges.grantor::name IN (SELECT enabled_roles.role_name
                                          FROM information_schema.enabled_roles))
   OR (table_privileges.grantee::name IN (SELECT enabled_roles.role_name
                                          FROM information_schema.enabled_roles));

alter table information_schema.role_table_grants
    owner to sail;

grant select on information_schema.role_table_grants to public;

