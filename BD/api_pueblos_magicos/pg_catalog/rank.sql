create function pg_catalog.rank() returns bigint
    immutable
    window
    parallel safe
    cost 1
    language internal
as
$$
begin
-- missing source code
end;
$$;

comment on function pg_catalog.rank() is 'integer rank with gaps';

alter function pg_catalog.rank() owner to sail;

create aggregate pg_catalog.rank("any") (
    sfunc = ordered_set_transition_multi,
    stype = internal,
    finalfunc = rank_final,
    finalfunc_extra,
    parallel = safe,
    hypothetical
    );

comment on aggregate pg_catalog.rank("any") is 'rank of hypothetical row';

alter aggregate pg_catalog.rank("any") owner to sail;

