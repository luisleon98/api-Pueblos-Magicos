-- Unknown how to generate base type type

comment on type pg_catalog.xid is 'transaction id';

alter type pg_catalog.xid owner to sail;

create function pg_catalog.xid(xid8) returns xid
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

comment on function pg_catalog.xid(xid8) is 'convert xid8 to xid';

alter function pg_catalog.xid(xid8) owner to sail;

