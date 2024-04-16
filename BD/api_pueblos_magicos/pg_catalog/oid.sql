-- Unknown how to generate base type type

comment on type pg_catalog.oid is 'object identifier(oid), maximum 4 billion';

alter type pg_catalog.oid owner to sail;

create function pg_catalog.oid(bigint) returns oid
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

comment on function pg_catalog.oid(bigint) is 'convert int8 to oid';

alter function pg_catalog.oid(bigint) owner to sail;

