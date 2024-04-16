-- Unknown how to generate base type type

comment on type pg_catalog.date is 'date';

alter type pg_catalog.date owner to sail;

create function pg_catalog.date(timestamp with time zone) returns date
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

comment on function pg_catalog.date(timestamp with time zone) is 'convert timestamp with time zone to date';

alter function pg_catalog.date(timestamp with time zone) owner to sail;

create function pg_catalog.date(timestamp) returns date
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

comment on function pg_catalog.date(timestamp) is 'convert timestamp to date';

alter function pg_catalog.date(timestamp) owner to sail;

