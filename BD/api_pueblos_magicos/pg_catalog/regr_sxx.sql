create aggregate pg_catalog.regr_sxx(double precision, double precision) (
    sfunc = float8_regr_accum,
    stype = double precision[],
    finalfunc = float8_regr_sxx,
    combinefunc = float8_regr_combine,
    initcond = '{0,0,0,0,0,0}',
    parallel = safe
    );

comment on aggregate pg_catalog.regr_sxx(double precision, double precision) is 'sum of squares of the independent variable (sum(X^2) - sum(X)^2/N)';

alter aggregate pg_catalog.regr_sxx(double precision, double precision) owner to sail;

