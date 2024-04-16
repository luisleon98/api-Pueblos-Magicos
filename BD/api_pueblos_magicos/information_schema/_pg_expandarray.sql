create function information_schema._pg_expandarray(anyarray, OUT x anyelement, OUT n integer) returns SETOF record
    immutable
    strict
    parallel safe
    language sql
as
$$select $1[s],
        s operator(pg_catalog.-) pg_catalog.array_lower($1,1) operator(pg_catalog.+) 1
        from pg_catalog.generate_series(pg_catalog.array_lower($1,1),
                                        pg_catalog.array_upper($1,1),
                                        1) as g(s)$$;

alter function information_schema._pg_expandarray(anyarray, out anyelement, out integer) owner to sail;

