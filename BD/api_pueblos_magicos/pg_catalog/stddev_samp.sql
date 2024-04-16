create aggregate pg_catalog.stddev_samp(bigint) (
    sfunc = int8_accum,
    stype = internal,
    sspace = 128,
    finalfunc = numeric_stddev_samp,
    combinefunc = numeric_combine,
    serialfunc = numeric_serialize,
    deserialfunc = numeric_deserialize,
    parallel = safe,
    msfunc = int8_accum,
    minvfunc = int8_accum_inv,
    mstype = internal,
    msspace = 128,
    mfinalfunc = numeric_stddev_samp
    );

comment on aggregate pg_catalog.stddev_samp(bigint) is 'sample standard deviation of bigint input values';

alter aggregate pg_catalog.stddev_samp(bigint) owner to sail;

create aggregate pg_catalog.stddev_samp(integer) (
    sfunc = int4_accum,
    stype = internal,
    sspace = 48,
    finalfunc = numeric_poly_stddev_samp,
    combinefunc = numeric_poly_combine,
    serialfunc = numeric_poly_serialize,
    deserialfunc = numeric_poly_deserialize,
    parallel = safe,
    msfunc = int4_accum,
    minvfunc = int4_accum_inv,
    mstype = internal,
    msspace = 48,
    mfinalfunc = numeric_poly_stddev_samp
    );

comment on aggregate pg_catalog.stddev_samp(integer) is 'sample standard deviation of integer input values';

alter aggregate pg_catalog.stddev_samp(integer) owner to sail;

create aggregate pg_catalog.stddev_samp(smallint) (
    sfunc = int2_accum,
    stype = internal,
    sspace = 48,
    finalfunc = numeric_poly_stddev_samp,
    combinefunc = numeric_poly_combine,
    serialfunc = numeric_poly_serialize,
    deserialfunc = numeric_poly_deserialize,
    parallel = safe,
    msfunc = int2_accum,
    minvfunc = int2_accum_inv,
    mstype = internal,
    msspace = 48,
    mfinalfunc = numeric_poly_stddev_samp
    );

comment on aggregate pg_catalog.stddev_samp(smallint) is 'sample standard deviation of smallint input values';

alter aggregate pg_catalog.stddev_samp(smallint) owner to sail;

create aggregate pg_catalog.stddev_samp(real) (
    sfunc = float4_accum,
    stype = double precision[],
    finalfunc = float8_stddev_samp,
    combinefunc = float8_combine,
    initcond = '{0,0,0}',
    parallel = safe
    );

comment on aggregate pg_catalog.stddev_samp(real) is 'sample standard deviation of float4 input values';

alter aggregate pg_catalog.stddev_samp(real) owner to sail;

create aggregate pg_catalog.stddev_samp(double precision) (
    sfunc = float8_accum,
    stype = double precision[],
    finalfunc = float8_stddev_samp,
    combinefunc = float8_combine,
    initcond = '{0,0,0}',
    parallel = safe
    );

comment on aggregate pg_catalog.stddev_samp(double precision) is 'sample standard deviation of float8 input values';

alter aggregate pg_catalog.stddev_samp(double precision) owner to sail;

create aggregate pg_catalog.stddev_samp(numeric) (
    sfunc = numeric_accum,
    stype = internal,
    sspace = 128,
    finalfunc = numeric_stddev_samp,
    combinefunc = numeric_combine,
    serialfunc = numeric_serialize,
    deserialfunc = numeric_deserialize,
    parallel = safe,
    msfunc = numeric_accum,
    minvfunc = numeric_accum_inv,
    mstype = internal,
    msspace = 128,
    mfinalfunc = numeric_stddev_samp
    );

comment on aggregate pg_catalog.stddev_samp(numeric) is 'sample standard deviation of numeric input values';

alter aggregate pg_catalog.stddev_samp(numeric) owner to sail;

