create view information_schema.domain_udt_usage
            (udt_catalog, udt_schema, udt_name, domain_catalog, domain_schema, domain_name) as
SELECT current_database()::information_schema.sql_identifier AS udt_catalog,
       nbt.nspname::information_schema.sql_identifier        AS udt_schema,
       bt.typname::information_schema.sql_identifier         AS udt_name,
       current_database()::information_schema.sql_identifier AS domain_catalog,
       nt.nspname::information_schema.sql_identifier         AS domain_schema,
       t.typname::information_schema.sql_identifier          AS domain_name
FROM pg_type t,
     pg_namespace nt,
     pg_type bt,
     pg_namespace nbt
WHERE t.typnamespace = nt.oid
  AND t.typbasetype = bt.oid
  AND bt.typnamespace = nbt.oid
  AND t.typtype = 'd'::"char"
  AND pg_has_role(bt.typowner, 'USAGE'::text);

alter table information_schema.domain_udt_usage
    owner to sail;

grant select on information_schema.domain_udt_usage to public;

