create aggregate pg_catalog.stddev(bigint) (
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

comment on aggregate pg_catalog.stddev(bigint) is 'historical alias for stddev_samp';

alter aggregate pg_catalog.stddev(bigint) owner to sail;

create aggregate pg_catalog.stddev(integer) (
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

comment on aggregate pg_catalog.stddev(integer) is 'historical alias for stddev_samp';

alter aggregate pg_catalog.stddev(integer) owner to sail;

create aggregate pg_catalog.stddev(smallint) (
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

comment on aggregate pg_catalog.stddev(smallint) is 'historical alias for stddev_samp';

alter aggregate pg_catalog.stddev(smallint) owner to sail;

create aggregate pg_catalog.stddev(real) (
    sfunc = float4_accum,
    stype = double precision[],
    finalfunc = float8_stddev_samp,
    combinefunc = float8_combine,
    initcond = '{0,0,0}',
    parallel = safe
    );

comment on aggregate pg_catalog.stddev(real) is 'historical alias for stddev_samp';

alter aggregate pg_catalog.stddev(real) owner to sail;

create aggregate pg_catalog.stddev(double precision) (
    sfunc = float8_accum,
    stype = double precision[],
    finalfunc = float8_stddev_samp,
    combinefunc = float8_combine,
    initcond = '{0,0,0}',
    parallel = safe
    );

comment on aggregate pg_catalog.stddev(double precision) is 'historical alias for stddev_samp';

alter aggregate pg_catalog.stddev(double precision) owner to sail;

create aggregate pg_catalog.stddev(numeric) (
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

comment on aggregate pg_catalog.stddev(numeric) is 'historical alias for stddev_samp';

alter aggregate pg_catalog.stddev(numeric) owner to sail;

