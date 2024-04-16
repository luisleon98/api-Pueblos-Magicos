-- Unknown how to generate base type type

comment on type pg_catalog.money is 'monetary amounts, $d,ddd.cc';

alter type pg_catalog.money owner to sail;

create function pg_catalog.money(integer) returns money
    stable
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

comment on function pg_catalog.money(integer) is 'convert int4 to money';

alter function pg_catalog.money(integer) owner to sail;

create function pg_catalog.money(bigint) returns money
    stable
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

comment on function pg_catalog.money(bigint) is 'convert int8 to money';

alter function pg_catalog.money(bigint) owner to sail;

create function pg_catalog.money(numeric) returns money
    stable
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

comment on function pg_catalog.money(numeric) is 'convert numeric to money';

alter function pg_catalog.money(numeric) owner to sail;

