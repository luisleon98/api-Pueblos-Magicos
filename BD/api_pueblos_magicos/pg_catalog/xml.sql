-- Unknown how to generate base type type

comment on type pg_catalog.xml is 'XML content';

alter type pg_catalog.xml owner to sail;

create function pg_catalog.xml(text) returns xml
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

comment on function pg_catalog.xml(text) is 'perform a non-validating parse of a character string to produce an XML value';

alter function pg_catalog.xml(text) owner to sail;

