-- Unknown how to generate base type type

comment on type pg_catalog.timetz is 'time of day with time zone';

alter type pg_catalog.timetz owner to sail;

create function pg_catalog.timetz(timestamp with time zone) returns time with time zone
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

comment on function pg_catalog.timetz(timestamp with time zone) is 'convert timestamp with time zone to time with time zone';

alter function pg_catalog.timetz(timestamp with time zone) owner to sail;

create function pg_catalog.timetz(time with time zone, integer) returns time with time zone
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

comment on function pg_catalog.timetz(time with time zone, integer) is 'adjust time with time zone precision';

alter function pg_catalog.timetz(time with time zone, integer) owner to sail;

create function pg_catalog.timetz(time) returns time with time zone
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

comment on function pg_catalog.timetz(time) is 'convert time to time with time zone';

alter function pg_catalog.timetz(time) owner to sail;

