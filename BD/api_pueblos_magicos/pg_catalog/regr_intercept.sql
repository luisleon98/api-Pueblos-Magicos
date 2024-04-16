create aggregate pg_catalog.regr_intercept(double precision, double precision) (
    sfunc = float8_regr_accum,
    stype = double precision[],
    finalfunc = float8_regr_intercept,
    combinefunc = float8_regr_combine,
    initcond = '{0,0,0,0,0,0}',
    parallel = safe
    );

comment on aggregate pg_catalog.regr_intercept(double precision, double precision) is 'y-intercept of the least-squares-fit linear equation determined by the (X, Y) pairs';

alter aggregate pg_catalog.regr_intercept(double precision, double precision) owner to sail;

