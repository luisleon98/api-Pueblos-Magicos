-- Unknown how to generate base type type

comment on type pg_catalog.numeric is 'numeric(precision, decimal), arbitrary precision number';

alter type pg_catalog.numeric owner to sail;

create function pg_catalog.numeric(numeric, integer) returns numeric
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

comment on function pg_catalog.numeric(numeric, integer) is 'adjust numeric to typmod precision/scale';

alter function pg_catalog.numeric(numeric, integer) owner to sail;

create function pg_catalog.numeric(integer) returns numeric
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

comment on function pg_catalog.numeric(integer) is 'convert int4 to numeric';

alter function pg_catalog.numeric(integer) owner to sail;

create function pg_catalog.numeric(real) returns numeric
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

comment on function pg_catalog.numeric(real) is 'convert float4 to numeric';

alter function pg_catalog.numeric(real) owner to sail;

create function pg_catalog.numeric(double precision) returns numeric
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

comment on function pg_catalog.numeric(double precision) is 'convert float8 to numeric';

alter function pg_catalog.numeric(double precision) owner to sail;

create function pg_catalog.numeric(bigint) returns numeric
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

comment on function pg_catalog.numeric(bigint) is 'convert int8 to numeric';

alter function pg_catalog.numeric(bigint) owner to sail;

create function pg_catalog.numeric(smallint) returns numeric
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

comment on function pg_catalog.numeric(smallint) is 'convert int2 to numeric';

alter function pg_catalog.numeric(smallint) owner to sail;

create function pg_catalog.numeric(jsonb) returns numeric
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

comment on function pg_catalog.numeric(jsonb) is 'convert jsonb to numeric';

alter function pg_catalog.numeric(jsonb) owner to sail;

create function pg_catalog.numeric(money) returns numeric
    stable
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

comment on function pg_catalog.numeric(money) is 'convert money to numeric';

alter function pg_catalog.numeric(money) owner to sail;

