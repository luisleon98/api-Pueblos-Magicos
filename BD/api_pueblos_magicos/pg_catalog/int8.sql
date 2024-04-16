-- Unknown how to generate base type type

comment on type pg_catalog.int8 is '~18 digit integer, 8-byte storage';

alter type pg_catalog.int8 owner to sail;

create function pg_catalog.int8(integer) returns bigint
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

comment on function pg_catalog.int8(integer) is 'convert int4 to int8';

alter function pg_catalog.int8(integer) owner to sail;

create function pg_catalog.int8(double precision) returns bigint
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

comment on function pg_catalog.int8(double precision) is 'convert float8 to int8';

alter function pg_catalog.int8(double precision) owner to sail;

create function pg_catalog.int8(real) returns bigint
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

comment on function pg_catalog.int8(real) is 'convert float4 to int8';

alter function pg_catalog.int8(real) owner to sail;

create function pg_catalog.int8(smallint) returns bigint
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

comment on function pg_catalog.int8(smallint) is 'convert int2 to int8';

alter function pg_catalog.int8(smallint) owner to sail;

create function pg_catalog.int8(oid) returns bigint
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

comment on function pg_catalog.int8(oid) is 'convert oid to int8';

alter function pg_catalog.int8(oid) owner to sail;

create function pg_catalog.int8(numeric) returns bigint
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

comment on function pg_catalog.int8(numeric) is 'convert numeric to int8';

alter function pg_catalog.int8(numeric) owner to sail;

create function pg_catalog.int8(bit) returns bigint
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

comment on function pg_catalog.int8(bit) is 'convert bitstring to int8';

alter function pg_catalog.int8(bit) owner to sail;

create function pg_catalog.int8(jsonb) returns bigint
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

comment on function pg_catalog.int8(jsonb) is 'convert jsonb to int8';

alter function pg_catalog.int8(jsonb) owner to sail;

