-- Unknown how to generate base type type

comment on type pg_catalog.circle is 'geometric circle ''(center,radius)''';

alter type pg_catalog.circle owner to sail;

create function pg_catalog.circle(point, double precision) returns circle
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

comment on function pg_catalog.circle(point, double precision) is 'convert point and radius to circle';

alter function pg_catalog.circle(point, double precision) owner to sail;

create function pg_catalog.circle(polygon) returns circle
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

comment on function pg_catalog.circle(polygon) is 'convert polygon to circle';

alter function pg_catalog.circle(polygon) owner to sail;

create function pg_catalog.circle(box) returns circle
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

comment on function pg_catalog.circle(box) is 'convert box to circle';

alter function pg_catalog.circle(box) owner to sail;

