create function pg_catalog.percent_rank() returns double precision
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

comment on function pg_catalog.percent_rank() is 'fractional rank within partition';

alter function pg_catalog.percent_rank() owner to sail;

create aggregate pg_catalog.percent_rank("any") (
    sfunc = ordered_set_transition_multi,
    stype = internal,
    finalfunc = percent_rank_final,
    finalfunc_extra,
    parallel = safe,
    hypothetical
    );

comment on aggregate pg_catalog.percent_rank("any") is 'fractional rank of hypothetical row';

alter aggregate pg_catalog.percent_rank("any") owner to sail;

