-- Unknown how to generate base type type

comment on type pg_catalog.pg_lsn is 'PostgreSQL LSN datatype';

alter type pg_catalog.pg_lsn owner to sail;

create function pg_catalog.pg_lsn(numeric) returns pg_lsn
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

comment on function pg_catalog.pg_lsn(numeric) is 'convert numeric to pg_lsn';

alter function pg_catalog.pg_lsn(numeric) owner to sail;

