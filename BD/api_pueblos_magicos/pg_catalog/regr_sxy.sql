create aggregate pg_catalog.regr_sxy(double precision, double precision) (
    sfunc = float8_regr_accum,
    stype = double precision[],
    finalfunc = float8_regr_sxy,
    combinefunc = float8_regr_combine,
    initcond = '{0,0,0,0,0,0}',
    parallel = safe
    );

comment on aggregate pg_catalog.regr_sxy(double precision, double precision) is 'sum of products of independent times dependent variable (sum(X*Y) - sum(X) * sum(Y)/N)';

alter aggregate pg_catalog.regr_sxy(double precision, double precision) owner to sail;

