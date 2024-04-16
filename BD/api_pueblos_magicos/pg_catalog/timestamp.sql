-- Unknown how to generate base type type

comment on type pg_catalog.timestamp is 'date and time';

alter type pg_catalog.timestamp owner to sail;

create function pg_catalog.timestamp(timestamp, integer) returns timestamp
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

comment on function pg_catalog.timestamp(timestamp, integer) is 'adjust timestamp precision';

alter function pg_catalog.timestamp(timestamp, integer) owner to sail;

create function pg_catalog.timestamp(date) returns timestamp
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

comment on function pg_catalog.timestamp(date) is 'convert date to timestamp';

alter function pg_catalog.timestamp(date) owner to sail;

create function pg_catalog.timestamp(date, time) returns timestamp
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

comment on function pg_catalog.timestamp(date, time) is 'convert date and time to timestamp';

alter function pg_catalog.timestamp(date, time) owner to sail;

create function pg_catalog.timestamp(timestamp with time zone) returns timestamp
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

comment on function pg_catalog.timestamp(timestamp with time zone) is 'convert timestamp with time zone to timestamp';

alter function pg_catalog.timestamp(timestamp with time zone) owner to sail;

