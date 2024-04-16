-- Unknown how to generate base type type

comment on type pg_catalog.path is 'geometric path ''(pt1,...)''';

alter type pg_catalog.path owner to sail;

create function pg_catalog.path(polygon) returns path
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

comment on function pg_catalog.path(polygon) is 'convert polygon to path';

alter function pg_catalog.path(polygon) owner to sail;

