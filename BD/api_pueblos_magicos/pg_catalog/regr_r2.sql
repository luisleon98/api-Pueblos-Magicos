create aggregate pg_catalog.regr_r2(double precision, double precision) (
    sfunc = float8_regr_accum,
    stype = double precision[],
    finalfunc = float8_regr_r2,
    combinefunc = float8_regr_combine,
    initcond = '{0,0,0,0,0,0}',
    parallel = safe
    );

comment on aggregate pg_catalog.regr_r2(double precision, double precision) is 'square of the correlation coefficient';

alter aggregate pg_catalog.regr_r2(double precision, double precision) owner to sail;

