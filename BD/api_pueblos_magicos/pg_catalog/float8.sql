-- Unknown how to generate base type type

comment on type pg_catalog.float8 is 'double-precision floating point number, 8-byte storage';

alter type pg_catalog.float8 owner to sail;

create function pg_catalog.float8(smallint) returns double precision
    immutable
    leakproof
    strict
    parallel safe
    cost 1
    language internal
as
$$
begin
-- missing source code
end;
$$;

comment on function pg_catalog.float8(smallint) is 'convert int2 to float8';

alter function pg_catalog.float8(smallint) owner to sail;

create function pg_catalog.float8(real) returns double precision
    immutable
    leakproof
    strict
    parallel safe
    cost 1
    language internal
as
$$
begin
-- missing source code
end;
$$;

comment on function pg_catalog.float8(real) is 'convert float4 to float8';

alter function pg_catalog.float8(real) owner to sail;

create function pg_catalog.float8(integer) returns double precision
    immutable
    leakproof
    strict
    parallel safe
    cost 1
    language internal
as
$$
begin
-- missing source code
end;
$$;

comment on function pg_catalog.float8(integer) is 'convert int4 to float8';

alter function pg_catalog.float8(integer) owner to sail;

create function pg_catalog.float8(bigint) returns double precision
    immutable
    leakproof
    strict
    parallel safe
    cost 1
    language internal
as
$$
begin
-- missing source code
end;
$$;

comment on function pg_catalog.float8(bigint) is 'convert int8 to float8';

alter function pg_catalog.float8(bigint) owner to sail;

create function pg_catalog.float8(numeric) returns double precision
    immutable
    strict
    parallel safe
    cost 1
    language internal
as
$$
begin
-- missing source code
end;
$$;

comment on function pg_catalog.float8(numeric) is 'convert numeric to float8';

alter function pg_catalog.float8(numeric) owner to sail;

create function pg_catalog.float8(jsonb) returns double precision
    immutable
    strict
    parallel safe
    cost 1
    language internal
as
$$
begin
-- missing source code
end;
$$;

comment on function pg_catalog.float8(jsonb) is 'convert jsonb to float8';

alter function pg_catalog.float8(jsonb) owner to sail;

