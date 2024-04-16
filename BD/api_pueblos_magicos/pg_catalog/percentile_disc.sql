create aggregate pg_catalog.percentile_disc(double precision order by anyelement) (
    sfunc = ordered_set_transition,
    stype = internal,
    finalfunc = percentile_disc_final,
    finalfunc_extra,
    parallel = safe
    );

comment on aggregate pg_catalog.percentile_disc(double precision, anyelement) is 'discrete percentile';

alter aggregate pg_catalog.percentile_disc(double precision order by anyelement) owner to sail;

create aggregate pg_catalog.percentile_disc(double precision[] order by anyelement) (
    sfunc = ordered_set_transition,
    stype = internal,
    finalfunc = percentile_disc_multi_final,
    finalfunc_extra,
    parallel = safe
    );

comment on aggregate pg_catalog.percentile_disc(double precision[], anyelement) is 'multiple discrete percentiles';

alter aggregate pg_catalog.percentile_disc(double precision[] order by anyelement) owner to sail;

