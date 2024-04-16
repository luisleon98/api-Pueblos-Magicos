-- Unknown how to generate base type type

comment on type pg_catalog.timestamptz is 'date and time with time zone';

alter type pg_catalog.timestamptz owner to sail;

create function pg_catalog.timestamptz(date) returns timestamp with time zone
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

comment on function pg_catalog.timestamptz(date) is 'convert date to timestamp with time zone';

alter function pg_catalog.timestamptz(date) owner to sail;

create function pg_catalog.timestamptz(date, time without time zone) returns timestamp with time zone
    stable
    strict
    parallel safe
    cost 1
    language sql
RETURN (($1 + $2))::timestamp with time zone;

comment on function pg_catalog.timestamptz(date, time) is 'convert date and time to timestamp with time zone';

alter function pg_catalog.timestamptz(date, time) owner to sail;

create function pg_catalog.timestamptz(date, time with time zone) returns timestamp with time zone
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

comment on function pg_catalog.timestamptz(date, time with time zone) is 'convert date and time with time zone to timestamp with time zone';

alter function pg_catalog.timestamptz(date, time with time zone) owner to sail;

create function pg_catalog.timestamptz(timestamp with time zone, integer) returns timestamp with time zone
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

comment on function pg_catalog.timestamptz(timestamp with time zone, integer) is 'adjust timestamptz precision';

alter function pg_catalog.timestamptz(timestamp with time zone, integer) owner to sail;

create function pg_catalog.timestamptz(timestamp) returns timestamp with time zone
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

comment on function pg_catalog.timestamptz(timestamp) is 'convert timestamp to timestamp with time zone';

alter function pg_catalog.timestamptz(timestamp) owner to sail;

