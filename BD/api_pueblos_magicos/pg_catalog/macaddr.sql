-- Unknown how to generate base type type

comment on type pg_catalog.macaddr is 'XX:XX:XX:XX:XX:XX, MAC address';

alter type pg_catalog.macaddr owner to sail;

create function pg_catalog.macaddr(macaddr8) returns macaddr
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

comment on function pg_catalog.macaddr(macaddr8) is 'convert macaddr8 to macaddr';

alter function pg_catalog.macaddr(macaddr8) owner to sail;

