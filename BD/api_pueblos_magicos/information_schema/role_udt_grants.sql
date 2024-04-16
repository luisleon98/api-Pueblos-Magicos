create view information_schema.role_udt_grants
            (grantor, grantee, udt_catalog, udt_schema, udt_name, privilege_type, is_grantable) as
SELECT udt_privileges.grantor,
       udt_privileges.grantee,
       udt_privileges.udt_catalog,
       udt_privileges.udt_schema,
       udt_privileges.udt_name,
       udt_privileges.privilege_type,
       udt_privileges.is_grantable
FROM information_schema.udt_privileges
WHERE (udt_privileges.grantor::name IN (SELECT enabled_roles.role_name
                                        FROM information_schema.enabled_roles))
   OR (udt_privileges.grantee::name IN (SELECT enabled_roles.role_name
                                        FROM information_schema.enabled_roles));

alter table information_schema.role_udt_grants
    owner to sail;

grant select on information_schema.role_udt_grants to public;

