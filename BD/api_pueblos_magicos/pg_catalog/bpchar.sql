-- Unknown how to generate base type type

comment on type pg_catalog.bpchar is 'char(length), blank-padded string, fixed storage length';

alter type pg_catalog.bpchar owner to sail;

create function pg_catalog.bpchar(name) returns char
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

comment on function pg_catalog.bpchar(name) is 'convert name to char(n)';

alter function pg_catalog.bpchar(name) owner to sail;

create function pg_catalog.bpchar(char, integer, boolean) returns char
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

comment on function pg_catalog.bpchar(char, integer, boolean) is 'adjust char() to typmod length';

alter function pg_catalog.bpchar(char, integer, boolean) owner to sail;

create function pg_catalog.bpchar("char") returns char
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

comment on function pg_catalog.bpchar("char") is 'convert char to char(n)';

alter function pg_catalog.bpchar("char") owner to sail;

