create function pg_catalog.cume_dist() returns double precision
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

comment on function pg_catalog.cume_dist() is 'fractional row number within partition';

alter function pg_catalog.cume_dist() owner to sail;

create aggregate pg_catalog.cume_dist("any") (
    sfunc = ordered_set_transition_multi,
    stype = internal,
    finalfunc = cume_dist_final,
    finalfunc_extra,
    parallel = safe,
    hypothetical
    );

comment on aggregate pg_catalog.cume_dist("any") is 'cumulative distribution of hypothetical row';

alter aggregate pg_catalog.cume_dist("any") owner to sail;

