-- Unknown how to generate base type type

comment on type pg_catalog.bool is 'boolean, ''true''/''false''';

alter type pg_catalog.bool owner to sail;

create function pg_catalog.bool(integer) returns boolean
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

comment on function pg_catalog.bool(integer) is 'convert int4 to boolean';

alter function pg_catalog.bool(integer) owner to sail;

create function pg_catalog.bool(jsonb) returns boolean
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

comment on function pg_catalog.bool(jsonb) is 'convert jsonb to boolean';

alter function pg_catalog.bool(jsonb) owner to sail;

