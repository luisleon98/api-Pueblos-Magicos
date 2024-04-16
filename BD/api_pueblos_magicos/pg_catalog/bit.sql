-- Unknown how to generate base type type

comment on type pg_catalog.bit is 'fixed-length bit string';

alter type pg_catalog.bit owner to sail;

create function pg_catalog.bit(integer, integer) returns bit
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

comment on function pg_catalog.bit(integer, integer) is 'convert int4 to bitstring';

alter function pg_catalog.bit(integer, integer) owner to sail;

create function pg_catalog.bit(bit, integer, boolean) returns bit
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

comment on function pg_catalog.bit(bit, integer, boolean) is 'adjust bit() to typmod length';

alter function pg_catalog.bit(bit, integer, boolean) owner to sail;

create function pg_catalog.bit(bigint, integer) returns bit
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

comment on function pg_catalog.bit(bigint, integer) is 'convert int8 to bitstring';

alter function pg_catalog.bit(bigint, integer) owner to sail;

