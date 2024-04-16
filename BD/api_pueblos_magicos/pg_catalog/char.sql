-- Unknown how to generate base type type

comment on type pg_catalog.char is 'single character';

alter type pg_catalog.char owner to sail;

create function pg_catalog.char(integer) returns "char"
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

comment on function pg_catalog.char(integer) is 'convert int4 to char';

alter function pg_catalog.char(integer) owner to sail;

create function pg_catalog.char(text) returns "char"
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

comment on function pg_catalog.char(text) is 'convert text to char';

alter function pg_catalog.char(text) owner to sail;

