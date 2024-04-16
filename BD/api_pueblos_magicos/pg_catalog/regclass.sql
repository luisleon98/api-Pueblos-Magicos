-- Unknown how to generate base type type

comment on type pg_catalog.regclass is 'registered class';

alter type pg_catalog.regclass owner to sail;

create function pg_catalog.regclass(text) returns regclass
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

comment on function pg_catalog.regclass(text) is 'convert text to regclass';

alter function pg_catalog.regclass(text) owner to sail;

