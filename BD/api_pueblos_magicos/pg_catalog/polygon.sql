-- Unknown how to generate base type type

comment on type pg_catalog.polygon is 'geometric polygon ''(pt1,...)''';

alter type pg_catalog.polygon owner to sail;

create function pg_catalog.polygon(box) returns polygon
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

comment on function pg_catalog.polygon(box) is 'convert box to polygon';

alter function pg_catalog.polygon(box) owner to sail;

create function pg_catalog.polygon(path) returns polygon
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

comment on function pg_catalog.polygon(path) is 'convert path to polygon';

alter function pg_catalog.polygon(path) owner to sail;

create function pg_catalog.polygon(integer, circle) returns polygon
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

comment on function pg_catalog.polygon(integer, circle) is 'convert vertex count and circle to polygon';

alter function pg_catalog.polygon(integer, circle) owner to sail;

create function pg_catalog.polygon(circle) returns polygon
    immutable
    strict
    parallel safe
    cost 1
    language sql
RETURN polygon(12, $1);

comment on function pg_catalog.polygon(circle) is 'convert circle to 12-vertex polygon';

alter function pg_catalog.polygon(circle) owner to sail;

