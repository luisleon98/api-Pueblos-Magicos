create aggregate pg_catalog.mode( order by anyelement) (
    sfunc = ordered_set_transition,
    stype = internal,
    finalfunc = mode_final,
    finalfunc_extra,
    parallel = safe
    );

comment on aggregate pg_catalog.mode(anyelement) is 'most common value';

alter aggregate pg_catalog.mode( order by anyelement) owner to sail;

