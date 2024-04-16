create view information_schema.check_constraints(constraint_catalog, constraint_schema, constraint_name, check_clause) as
SELECT current_database()::information_schema.sql_identifier                              AS constraint_catalog,
       rs.nspname::information_schema.sql_identifier                                      AS constraint_schema,
       con.conname::information_schema.sql_identifier                                     AS constraint_name,
       SUBSTRING(pg_get_constraintdef(con.oid) FROM 7)::information_schema.character_data AS check_clause
FROM pg_constraint con
         LEFT JOIN pg_namespace rs ON rs.oid = con.connamespace
         LEFT JOIN pg_class c ON c.oid = con.conrelid
         LEFT JOIN pg_type t ON t.oid = con.contypid
WHERE pg_has_role(COALESCE(c.relowner, t.typowner), 'USAGE'::text)
  AND con.contype = 'c'::"char"
UNION
SELECT current_database()::information_schema.sql_identifier                        AS constraint_catalog,
       n.nspname::information_schema.sql_identifier                                 AS constraint_schema,
       (((((n.oid::text || '_'::text) || r.oid::text) || '_'::text) || a.attnum::text) ||
        '_not_null'::text)::information_schema.sql_identifier                       AS constraint_name,
       (a.attname::text || ' IS NOT NULL'::text)::information_schema.character_data AS check_clause
FROM pg_namespace n,
     pg_class r,
     pg_attribute a
WHERE n.oid = r.relnamespace
  AND r.oid = a.attrelid
  AND a.attnum > 0
  AND NOT a.attisdropped
  AND a.attnotnull
  AND (r.relkind = ANY (ARRAY ['r'::"char", 'p'::"char"]))
  AND pg_has_role(r.relowner, 'USAGE'::text);

alter table information_schema.check_constraints
    owner to sail;

grant select on information_schema.check_constraints to public;

