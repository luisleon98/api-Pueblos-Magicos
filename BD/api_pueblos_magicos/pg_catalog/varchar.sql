-- Unknown how to generate base type type

comment on type pg_catalog.varchar is 'varchar(length), non-blank-padded string, variable storage length';

alter type pg_catalog.varchar owner to sail;

create function pg_catalog.varchar(varchar, integer, boolean) returns varchar
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

comment on function pg_catalog.varchar(varchar, integer, boolean) is 'adjust varchar() to typmod length';

alter function pg_catalog.varchar(varchar, integer, boolean) owner to sail;

create function pg_catalog.varchar(name) returns varchar
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

comment on function pg_catalog.varchar(name) is 'convert name to varchar';

alter function pg_catalog.varchar(name) owner to sail;

