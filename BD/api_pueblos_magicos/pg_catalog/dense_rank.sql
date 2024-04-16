create function pg_catalog.dense_rank() returns bigint
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

comment on function pg_catalog.dense_rank() is 'integer rank without gaps';

alter function pg_catalog.dense_rank() owner to sail;

create aggregate pg_catalog.dense_rank("any") (
    sfunc = ordered_set_transition_multi,
    stype = internal,
    finalfunc = dense_rank_final,
    finalfunc_extra,
    parallel = safe,
    hypothetical
    );

comment on aggregate pg_catalog.dense_rank("any") is 'rank of hypothetical row without gaps';

alter aggregate pg_catalog.dense_rank("any") owner to sail;

