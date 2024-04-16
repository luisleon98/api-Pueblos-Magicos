create aggregate pg_catalog.covar_samp(double precision, double precision) (
    sfunc = float8_regr_accum,
    stype = double precision[],
    finalfunc = float8_covar_samp,
    combinefunc = float8_regr_combine,
    initcond = '{0,0,0,0,0,0}',
    parallel = safe
    );

comment on aggregate pg_catalog.covar_samp(double precision, double precision) is 'sample covariance';

alter aggregate pg_catalog.covar_samp(double precision, double precision) owner to sail;

