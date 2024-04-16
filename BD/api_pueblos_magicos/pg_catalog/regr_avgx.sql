create aggregate pg_catalog.regr_avgx(double precision, double precision) (
    sfunc = float8_regr_accum,
    stype = double precision[],
    finalfunc = float8_regr_avgx,
    combinefunc = float8_regr_combine,
    initcond = '{0,0,0,0,0,0}',
    parallel = safe
    );

comment on aggregate pg_catalog.regr_avgx(double precision, double precision) is 'average of the independent variable (sum(X)/N)';

alter aggregate pg_catalog.regr_avgx(double precision, double precision) owner to sail;

