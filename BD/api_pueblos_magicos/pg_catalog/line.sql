-- Unknown how to generate base type type

comment on type pg_catalog.line is 'geometric line';

alter type pg_catalog.line owner to sail;

create function pg_catalog.line(point, point) returns line
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

comment on function pg_catalog.line(point, point) is 'construct line from points';

alter function pg_catalog.line(point, point) owner to sail;

