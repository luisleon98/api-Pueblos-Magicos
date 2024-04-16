create aggregate pg_catalog.stddev_pop(bigint) (
    sfunc = int8_accum,
    stype = internal,
    sspace = 128,
    finalfunc = numeric_stddev_pop,
    combinefunc = numeric_combine,
    serialfunc = numeric_serialize,
    deserialfunc = numeric_deserialize,
    parallel = safe,
    msfunc = int8_accum,
    minvfunc = int8_accum_inv,
    mstype = internal,
    msspace = 128,
    mfinalfunc = numeric_stddev_pop
    );

comment on aggregate pg_catalog.stddev_pop(bigint) is 'population standard deviation of bigint input values';

alter aggregate pg_catalog.stddev_pop(bigint) owner to sail;

create aggregate pg_catalog.stddev_pop(integer) (
    sfunc = int4_accum,
    stype = internal,
    sspace = 48,
    finalfunc = numeric_poly_stddev_pop,
    combinefunc = numeric_poly_combine,
    serialfunc = numeric_poly_serialize,
    deserialfunc = numeric_poly_deserialize,
    parallel = safe,
    msfunc = int4_accum,
    minvfunc = int4_accum_inv,
    mstype = internal,
    msspace = 48,
    mfinalfunc = numeric_poly_stddev_pop
    );

comment on aggregate pg_catalog.stddev_pop(integer) is 'population standard deviation of integer input values';

alter aggregate pg_catalog.stddev_pop(integer) owner to sail;

create aggregate pg_catalog.stddev_pop(smallint) (
    sfunc = int2_accum,
    stype = internal,
    sspace = 48,
    finalfunc = numeric_poly_stddev_pop,
    combinefunc = numeric_poly_combine,
    serialfunc = numeric_poly_serialize,
    deserialfunc = numeric_poly_deserialize,
    parallel = safe,
    msfunc = int2_accum,
    minvfunc = int2_accum_inv,
    mstype = internal,
    msspace = 48,
    mfinalfunc = numeric_poly_stddev_pop
    );

comment on aggregate pg_catalog.stddev_pop(smallint) is 'population standard deviation of smallint input values';

alter aggregate pg_catalog.stddev_pop(smallint) owner to sail;

create aggregate pg_catalog.stddev_pop(real) (
    sfunc = float4_accum,
    stype = double precision[],
    finalfunc = float8_stddev_pop,
    combinefunc = float8_combine,
    initcond = '{0,0,0}',
    parallel = safe
    );

comment on aggregate pg_catalog.stddev_pop(real) is 'population standard deviation of float4 input values';

alter aggregate pg_catalog.stddev_pop(real) owner to sail;

create aggregate pg_catalog.stddev_pop(double precision) (
    sfunc = float8_accum,
    stype = double precision[],
    finalfunc = float8_stddev_pop,
    combinefunc = float8_combine,
    initcond = '{0,0,0}',
    parallel = safe
    );

comment on aggregate pg_catalog.stddev_pop(double precision) is 'population standard deviation of float8 input values';

alter aggregate pg_catalog.stddev_pop(double precision) owner to sail;

create aggregate pg_catalog.stddev_pop(numeric) (
    sfunc = numeric_accum,
    stype = internal,
    sspace = 128,
    finalfunc = numeric_stddev_pop,
    combinefunc = numeric_combine,
    serialfunc = numeric_serialize,
    deserialfunc = numeric_deserialize,
    parallel = safe,
    msfunc = numeric_accum,
    minvfunc = numeric_accum_inv,
    mstype = internal,
    msspace = 128,
    mfinalfunc = numeric_stddev_pop
    );

comment on aggregate pg_catalog.stddev_pop(numeric) is 'population standard deviation of numeric input values';

alter aggregate pg_catalog.stddev_pop(numeric) owner to sail;

