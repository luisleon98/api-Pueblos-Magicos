-- Unknown how to generate base type type

comment on type pg_catalog.macaddr8 is 'XX:XX:XX:XX:XX:XX:XX:XX, MAC address';

alter type pg_catalog.macaddr8 owner to sail;

create function pg_catalog.macaddr8(macaddr) returns macaddr8
    immutable
    leakproof
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

comment on function pg_catalog.macaddr8(macaddr) is 'convert macaddr to macaddr8';

alter function pg_catalog.macaddr8(macaddr) owner to sail;

