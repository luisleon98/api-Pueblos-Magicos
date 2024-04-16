create view information_schema.role_routine_grants
            (grantor, grantee, specific_catalog, specific_schema, specific_name, routine_catalog, routine_schema,
             routine_name, privilege_type, is_grantable)
as
SELECT routine_privileges.grantor,
       routine_privileges.grantee,
       routine_privileges.specific_catalog,
       routine_privileges.specific_schema,
       routine_privileges.specific_name,
       routine_privileges.routine_catalog,
       routine_privileges.routine_schema,
       routine_privileges.routine_name,
       routine_privileges.privilege_type,
       routine_privileges.is_grantable
FROM information_schema.routine_privileges
WHERE (routine_privileges.grantor::name IN (SELECT enabled_roles.role_name
                                            FROM information_schema.enabled_roles))
   OR (routine_privileges.grantee::name IN (SELECT enabled_roles.role_name
                                            FROM information_schema.enabled_roles));

alter table information_schema.role_routine_grants
    owner to sail;

grant select on information_schema.role_routine_grants to public;

