-- Unknown how to generate base type type

comment on type pg_catalog.float4 is 'single-precision floating point number, 4-byte storage';

alter type pg_catalog.float4 owner to sail;

create function pg_catalog.float4(smallint) returns real
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

comment on function pg_catalog.float4(smallint) is 'convert int2 to float4';

alter function pg_catalog.float4(smallint) owner to sail;

create function pg_catalog.float4(double precision) returns real
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

comment on function pg_catalog.float4(double precision) is 'convert float8 to float4';

alter function pg_catalog.float4(double precision) owner to sail;

create function pg_catalog.float4(integer) returns real
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

comment on function pg_catalog.float4(integer) is 'convert int4 to float4';

alter function pg_catalog.float4(integer) owner to sail;

create function pg_catalog.float4(bigint) returns real
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

comment on function pg_catalog.float4(bigint) is 'convert int8 to float4';

alter function pg_catalog.float4(bigint) owner to sail;

create function pg_catalog.float4(numeric) returns real
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

comment on function pg_catalog.float4(numeric) is 'convert numeric to float4';

alter function pg_catalog.float4(numeric) owner to sail;

create function pg_catalog.float4(jsonb) returns real
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

comment on function pg_catalog.float4(jsonb) is 'convert jsonb to float4';

alter function pg_catalog.float4(jsonb) owner to sail;

