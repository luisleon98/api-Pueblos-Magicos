-- Unknown how to generate base type type

comment on type pg_catalog.time is 'time of day';

alter type pg_catalog.time owner to sail;

create function pg_catalog.time(timestamp) returns time
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

comment on function pg_catalog.time(timestamp) is 'convert timestamp to time';

alter function pg_catalog.time(timestamp) owner to sail;

create function pg_catalog.time(interval) returns time
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

comment on function pg_catalog.time(interval) is 'convert interval to time';

alter function pg_catalog.time(interval) owner to sail;

create function pg_catalog.time(time, integer) returns time
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

comment on function pg_catalog.time(time, integer) is 'adjust time precision';

alter function pg_catalog.time(time, integer) owner to sail;

create function pg_catalog.time(timestamp with time zone) returns time
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

comment on function pg_catalog.time(timestamp with time zone) is 'convert timestamp with time zone to time';

alter function pg_catalog.time(timestamp with time zone) owner to sail;

create function pg_catalog.time(time with time zone) returns time
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

comment on function pg_catalog.time(time with time zone) is 'convert time with time zone to time';

alter function pg_catalog.time(time with time zone) owner to sail;

