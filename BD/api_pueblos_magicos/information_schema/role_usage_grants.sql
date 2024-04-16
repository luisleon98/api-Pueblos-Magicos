create view information_schema.role_usage_grants
            (grantor, grantee, object_catalog, object_schema, object_name, object_type, privilege_type, is_grantable) as
SELECT usage_privileges.grantor,
       usage_privileges.grantee,
       usage_privileges.object_catalog,
       usage_privileges.object_schema,
       usage_privileges.object_name,
       usage_privileges.object_type,
       usage_privileges.privilege_type,
       usage_privileges.is_grantable
FROM information_schema.usage_privileges
WHERE (usage_privileges.grantor::name IN (SELECT enabled_roles.role_name
                                          FROM information_schema.enabled_roles))
   OR (usage_privileges.grantee::name IN (SELECT enabled_roles.role_name
                                          FROM information_schema.enabled_roles));

alter table information_schema.role_usage_grants
    owner to sail;

grant select on information_schema.role_usage_grants to public;

