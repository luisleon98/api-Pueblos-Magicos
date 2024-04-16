-- Unknown how to generate base type type

comment on type pg_catalog.int4 is '-2 billion to 2 billion integer, 4-byte storage';

alter type pg_catalog.int4 owner to sail;

create function pg_catalog.int4("char") returns integer
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

comment on function pg_catalog.int4("char") is 'convert char to int4';

alter function pg_catalog.int4("char") owner to sail;

create function pg_catalog.int4(smallint) returns integer
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

comment on function pg_catalog.int4(smallint) is 'convert int2 to int4';

alter function pg_catalog.int4(smallint) owner to sail;

create function pg_catalog.int4(double precision) returns integer
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

comment on function pg_catalog.int4(double precision) is 'convert float8 to int4';

alter function pg_catalog.int4(double precision) owner to sail;

create function pg_catalog.int4(real) returns integer
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

comment on function pg_catalog.int4(real) is 'convert float4 to int4';

alter function pg_catalog.int4(real) owner to sail;

create function pg_catalog.int4(bigint) returns integer
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

comment on function pg_catalog.int4(bigint) is 'convert int8 to int4';

alter function pg_catalog.int4(bigint) owner to sail;

create function pg_catalog.int4(bit) returns integer
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

comment on function pg_catalog.int4(bit) is 'convert bitstring to int4';

alter function pg_catalog.int4(bit) owner to sail;

create function pg_catalog.int4(numeric) returns integer
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

comment on function pg_catalog.int4(numeric) is 'convert numeric to int4';

alter function pg_catalog.int4(numeric) owner to sail;

create function pg_catalog.int4(boolean) returns integer
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

comment on function pg_catalog.int4(boolean) is 'convert boolean to int4';

alter function pg_catalog.int4(boolean) owner to sail;

create function pg_catalog.int4(jsonb) returns integer
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

comment on function pg_catalog.int4(jsonb) is 'convert jsonb to int4';

alter function pg_catalog.int4(jsonb) owner to sail;

