-- Unknown how to generate base type type

comment on type pg_catalog.varbit is 'variable-length bit string';

alter type pg_catalog.varbit owner to sail;

create function pg_catalog.varbit(bit varying, integer, boolean) returns bit varying
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

comment on function pg_catalog.varbit(bit varying, integer, boolean) is 'adjust varbit() to typmod length';

alter function pg_catalog.varbit(bit varying, integer, boolean) owner to sail;

