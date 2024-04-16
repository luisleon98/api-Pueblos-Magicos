-- Unknown how to generate base type type

comment on type pg_catalog.point is 'geometric point ''(x, y)''';

alter type pg_catalog.point owner to sail;

create function pg_catalog.point(circle) returns point
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

comment on function pg_catalog.point(circle) is 'center of';

alter function pg_catalog.point(circle) owner to sail;

create function pg_catalog.point(double precision, double precision) returns point
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

comment on function pg_catalog.point(double precision, double precision) is 'convert x, y to point';

alter function pg_catalog.point(double precision, double precision) owner to sail;

create function pg_catalog.point(lseg) returns point
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

comment on function pg_catalog.point(lseg) is 'center of';

alter function pg_catalog.point(lseg) owner to sail;

create function pg_catalog.point(box) returns point
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

comment on function pg_catalog.point(box) is 'center of';

alter function pg_catalog.point(box) owner to sail;

create function pg_catalog.point(polygon) returns point
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

comment on function pg_catalog.point(polygon) is 'center of';

alter function pg_catalog.point(polygon) owner to sail;

