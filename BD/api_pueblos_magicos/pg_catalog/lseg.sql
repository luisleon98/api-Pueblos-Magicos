-- Unknown how to generate base type type

comment on type pg_catalog.lseg is 'geometric line segment ''(pt1,pt2)''';

alter type pg_catalog.lseg owner to sail;

create function pg_catalog.lseg(point, point) returns lseg
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

comment on function pg_catalog.lseg(point, point) is 'convert points to line segment';

alter function pg_catalog.lseg(point, point) owner to sail;

create function pg_catalog.lseg(box) returns lseg
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

comment on function pg_catalog.lseg(box) is 'diagonal of';

alter function pg_catalog.lseg(box) owner to sail;

