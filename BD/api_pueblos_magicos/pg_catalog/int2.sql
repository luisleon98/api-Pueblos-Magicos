-- Unknown how to generate base type type

comment on type pg_catalog.int2 is '-32 thousand to 32 thousand, 2-byte storage';

alter type pg_catalog.int2 owner to sail;

create function pg_catalog.int2(double precision) returns smallint
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

comment on function pg_catalog.int2(double precision) is 'convert float8 to int2';

alter function pg_catalog.int2(double precision) owner to sail;

create function pg_catalog.int2(real) returns smallint
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

comment on function pg_catalog.int2(real) is 'convert float4 to int2';

alter function pg_catalog.int2(real) owner to sail;

create function pg_catalog.int2(integer) returns smallint
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

comment on function pg_catalog.int2(integer) is 'convert int4 to int2';

alter function pg_catalog.int2(integer) owner to sail;

create function pg_catalog.int2(bigint) returns smallint
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

comment on function pg_catalog.int2(bigint) is 'convert int8 to int2';

alter function pg_catalog.int2(bigint) owner to sail;

create function pg_catalog.int2(numeric) returns smallint
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

comment on function pg_catalog.int2(numeric) is 'convert numeric to int2';

alter function pg_catalog.int2(numeric) owner to sail;

create function pg_catalog.int2(jsonb) returns smallint
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

comment on function pg_catalog.int2(jsonb) is 'convert jsonb to int2';

alter function pg_catalog.int2(jsonb) owner to sail;

