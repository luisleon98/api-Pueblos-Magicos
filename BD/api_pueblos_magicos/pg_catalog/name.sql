-- Unknown how to generate base type type

comment on type pg_catalog.name is '63-byte type for storing system identifiers';

alter type pg_catalog.name owner to sail;

create function pg_catalog.name(text) returns name
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

comment on function pg_catalog.name(text) is 'convert text to name';

alter function pg_catalog.name(text) owner to sail;

create function pg_catalog.name(char) returns name
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

comment on function pg_catalog.name(char) is 'convert char(n) to name';

alter function pg_catalog.name(char) owner to sail;

create function pg_catalog.name(varchar) returns name
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

comment on function pg_catalog.name(varchar) is 'convert varchar to name';

alter function pg_catalog.name(varchar) owner to sail;

