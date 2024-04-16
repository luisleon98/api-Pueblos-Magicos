-- Unknown how to generate base type type

comment on type pg_catalog.cidr is 'network IP address/netmask, network address';

alter type pg_catalog.cidr owner to sail;

create function pg_catalog.cidr(inet) returns cidr
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

comment on function pg_catalog.cidr(inet) is 'convert inet to cidr';

alter function pg_catalog.cidr(inet) owner to sail;

