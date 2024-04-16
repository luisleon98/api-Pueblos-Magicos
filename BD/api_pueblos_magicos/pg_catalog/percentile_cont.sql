create aggregate pg_catalog.percentile_cont(double precision order by double precision) (
    sfunc = ordered_set_transition,
    stype = internal,
    finalfunc = percentile_cont_float8_final,
    parallel = safe
    );

comment on aggregate pg_catalog.percentile_cont(double precision, double precision) is 'continuous distribution percentile';

alter aggregate pg_catalog.percentile_cont(double precision order by double precision) owner to sail;

create aggregate pg_catalog.percentile_cont(double precision order by interval) (
    sfunc = ordered_set_transition,
    stype = internal,
    finalfunc = percentile_cont_interval_final,
    parallel = safe
    );

comment on aggregate pg_catalog.percentile_cont(double precision, interval) is 'continuous distribution percentile';

alter aggregate pg_catalog.percentile_cont(double precision order by interval) owner to sail;

create aggregate pg_catalog.percentile_cont(double precision[] order by double precision) (
    sfunc = ordered_set_transition,
    stype = internal,
    finalfunc = percentile_cont_float8_multi_final,
    parallel = safe
    );

comment on aggregate pg_catalog.percentile_cont(double precision[], double precision) is 'multiple continuous percentiles';

alter aggregate pg_catalog.percentile_cont(double precision[] order by double precision) owner to sail;

create aggregate pg_catalog.percentile_cont(double precision[] order by interval) (
    sfunc = ordered_set_transition,
    stype = internal,
    finalfunc = percentile_cont_interval_multi_final,
    parallel = safe
    );

comment on aggregate pg_catalog.percentile_cont(double precision[], interval) is 'multiple continuous percentiles';

alter aggregate pg_catalog.percentile_cont(double precision[] order by interval) owner to sail;

