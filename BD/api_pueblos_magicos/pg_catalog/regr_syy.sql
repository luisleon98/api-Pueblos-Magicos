create aggregate pg_catalog.regr_syy(double precision, double precision) (
    sfunc = float8_regr_accum,
    stype = double precision[],
    finalfunc = float8_regr_syy,
    combinefunc = float8_regr_combine,
    initcond = '{0,0,0,0,0,0}',
    parallel = safe
    );

comment on aggregate pg_catalog.regr_syy(double precision, double precision) is 'sum of squares of the dependent variable (sum(Y^2) - sum(Y)^2/N)';

alter aggregate pg_catalog.regr_syy(double precision, double precision) owner to sail;

