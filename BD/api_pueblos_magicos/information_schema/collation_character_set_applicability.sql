create view information_schema.collation_character_set_applicability
            (collation_catalog, collation_schema, collation_name, character_set_catalog, character_set_schema,
             character_set_name) as
SELECT current_database()::information_schema.sql_identifier    AS collation_catalog,
       nc.nspname::information_schema.sql_identifier            AS collation_schema,
       c.collname::information_schema.sql_identifier            AS collation_name,
       NULL::name::information_schema.sql_identifier            AS character_set_catalog,
       NULL::name::information_schema.sql_identifier            AS character_set_schema,
       getdatabaseencoding()::information_schema.sql_identifier AS character_set_name
FROM pg_collation c,
     pg_namespace nc
WHERE c.collnamespace = nc.oid
  AND (c.collencoding = ANY (ARRAY ['-1'::integer, (SELECT pg_database.encoding
                                                    FROM pg_database
                                                    WHERE pg_database.datname = current_database())]));

alter table information_schema.collation_character_set_applicability
    owner to sail;

grant select on information_schema.collation_character_set_applicability to public;

