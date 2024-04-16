-- Unknown how to generate base type type

comment on type pg_catalog.interval is '@ <number> <units>, time interval';

alter type pg_catalog.interval owner to sail;

create function pg_catalog.interval(interval, integer) returns interval
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

comment on function pg_catalog.interval(interval, integer) is 'adjust interval precision';

alter function pg_catalog.interval(interval, integer) owner to sail;

create function pg_catalog.interval(time) returns interval
    immutable
    leakproof
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

comment on function pg_catalog.interval(time) is 'convert time to interval';

alter function pg_catalog.interval(time) owner to sail;

