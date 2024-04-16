create aggregate pg_catalog.regr_avgy(double precision, double precision) (
    sfunc = float8_regr_accum,
    stype = double precision[],
    finalfunc = float8_regr_avgy,
    combinefunc = float8_regr_combine,
    initcond = '{0,0,0,0,0,0}',
    parallel = safe
    );

comment on aggregate pg_catalog.regr_avgy(double precision, double precision) is 'average of the dependent variable (sum(Y)/N)';

alter aggregate pg_catalog.regr_avgy(double precision, double precision) owner to sail;

