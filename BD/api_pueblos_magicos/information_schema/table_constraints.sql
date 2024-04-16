create view information_schema.table_constraints
            (constraint_catalog, constraint_schema, constraint_name, table_catalog, table_schema, table_name,
             constraint_type, is_deferrable, initially_deferred, enforced, nulls_distinct)
as
SELECT current_database()::information_schema.sql_identifier  AS constraint_catalog,
       nc.nspname::information_schema.sql_identifier          AS constraint_schema,
       c.conname::information_schema.sql_identifier           AS constraint_name,
       current_database()::information_schema.sql_identifier  AS table_catalog,
       nr.nspname::information_schema.sql_identifier          AS table_schema,
       r.relname::information_schema.sql_identifier           AS table_name,
       CASE c.contype
           WHEN 'c'::"char" THEN 'CHECK'::text
           WHEN 'f'::"char" THEN 'FOREIGN KEY'::text
           WHEN 'p'::"char" THEN 'PRIMARY KEY'::text
           WHEN 'u'::"char" THEN 'UNIQUE'::text
           ELSE NULL::text
           END::information_schema.character_data             AS constraint_type,
       CASE
           WHEN c.condeferrable THEN 'YES'::text
           ELSE 'NO'::text
           END::information_schema.yes_or_no                  AS is_deferrable,
       CASE
           WHEN c.condeferred THEN 'YES'::text
           ELSE 'NO'::text
           END::information_schema.yes_or_no                  AS initially_deferred,
       'YES'::character varying::information_schema.yes_or_no AS enforced,
       CASE
           WHEN c.contype = 'u'::"char" THEN
               CASE
                   WHEN (SELECT NOT pg_index.indnullsnotdistinct
                         FROM pg_index
                         WHERE pg_index.indexrelid = c.conindid) THEN 'YES'::text
                   ELSE 'NO'::text
                   END
           ELSE NULL::text
           END::information_schema.yes_or_no                  AS nulls_distinct
FROM pg_namespace nc,
     pg_namespace nr,
     pg_constraint c,
     pg_class r
WHERE nc.oid = c.connamespace
  AND nr.oid = r.relnamespace
  AND c.conrelid = r.oid
  AND (c.contype <> ALL (ARRAY ['t'::"char", 'x'::"char"]))
  AND (r.relkind = ANY (ARRAY ['r'::"char", 'p'::"char"]))
  AND NOT pg_is_other_temp_schema(nr.oid)
  AND (pg_has_role(r.relowner, 'USAGE'::text) OR
       has_table_privilege(r.oid, 'INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER'::text) OR
       has_any_column_privilege(r.oid, 'INSERT, UPDATE, REFERENCES'::text))
UNION ALL
SELECT current_database()::information_schema.sql_identifier         AS constraint_catalog,
       nr.nspname::information_schema.sql_identifier                 AS constraint_schema,
       (((((nr.oid::text || '_'::text) || r.oid::text) || '_'::text) || a.attnum::text) ||
        '_not_null'::text)::information_schema.sql_identifier        AS constraint_name,
       current_database()::information_schema.sql_identifier         AS table_catalog,
       nr.nspname::information_schema.sql_identifier                 AS table_schema,
       r.relname::information_schema.sql_identifier                  AS table_name,
       'CHECK'::character varying::information_schema.character_data AS constraint_type,
       'NO'::character varying::information_schema.yes_or_no         AS is_deferrable,
       'NO'::character varying::information_schema.yes_or_no         AS initially_deferred,
       'YES'::character varying::information_schema.yes_or_no        AS enforced,
       NULL::character varying::information_schema.yes_or_no         AS nulls_distinct
FROM pg_namespace nr,
     pg_class r,
     pg_attribute a
WHERE nr.oid = r.relnamespace
  AND r.oid = a.attrelid
  AND a.attnotnull
  AND a.attnum > 0
  AND NOT a.attisdropped
  AND (r.relkind = ANY (ARRAY ['r'::"char", 'p'::"char"]))
  AND NOT pg_is_other_temp_schema(nr.oid)
  AND (pg_has_role(r.relowner, 'USAGE'::text) OR
       has_table_privilege(r.oid, 'INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER'::text) OR
       has_any_column_privilege(r.oid, 'INSERT, UPDATE, REFERENCES'::text));

alter table information_schema.table_constraints
    owner to sail;

grant select on information_schema.table_constraints to public;

