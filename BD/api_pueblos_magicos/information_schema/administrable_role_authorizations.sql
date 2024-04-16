create view information_schema.administrable_role_authorizations(grantee, role_name, is_grantable) as
SELECT applicable_roles.grantee,
       applicable_roles.role_name,
       applicable_roles.is_grantable
FROM information_schema.applicable_roles
WHERE applicable_roles.is_grantable::text = 'YES'::text;

alter table information_schema.administrable_role_authorizations
    owner to sail;

grant select on information_schema.administrable_role_authorizations to public;

