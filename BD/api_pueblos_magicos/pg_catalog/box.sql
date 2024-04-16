-- Unknown how to generate base type type

comment on type pg_catalog.box is 'geometric box ''(lower left,upper right)''';

alter type pg_catalog.box owner to sail;

create function pg_catalog.box(point, point) returns box
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

comment on function pg_catalog.box(point, point) is 'convert points to box';

alter function pg_catalog.box(point, point) owner to sail;

create function pg_catalog.box(polygon) returns box
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

comment on function pg_catalog.box(polygon) is 'convert polygon to bounding box';

alter function pg_catalog.box(polygon) owner to sail;

create function pg_catalog.box(circle) returns box
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

comment on function pg_catalog.box(circle) is 'convert circle to box';

alter function pg_catalog.box(circle) owner to sail;

create function pg_catalog.box(point) returns box
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

comment on function pg_catalog.box(point) is 'convert point to empty box';

alter function pg_catalog.box(point) owner to sail;

