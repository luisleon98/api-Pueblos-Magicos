create aggregate pg_catalog.avg(bigint) (
    sfunc = int8_avg_accum,
    stype = internal,
    sspace = 48,
    finalfunc = numeric_poly_avg,
    combinefunc = int8_avg_combine,
    serialfunc = int8_avg_serialize,
    deserialfunc = int8_avg_deserialize,
    parallel = safe,
    msfunc = int8_avg_accum,
    minvfunc = int8_avg_accum_inv,
    mstype = internal,
    msspace = 48,
    mfinalfunc = numeric_poly_avg
    );

comment on aggregate pg_catalog.avg(bigint) is 'the average (arithmetic mean) as numeric of all bigint values';

alter aggregate pg_catalog.avg(bigint) owner to sail;

create aggregate pg_catalog.avg(integer) (
    sfunc = int4_avg_accum,
    stype = bigint[],
    finalfunc = int8_avg,
    combinefunc = int4_avg_combine,
    initcond = '{0,0}',
    parallel = safe,
    msfunc = int4_avg_accum,
    minvfunc = int4_avg_accum_inv,
    mstype = bigint[],
    mfinalfunc = int8_avg,
    minitcond = '{0,0}'
    );

comment on aggregate pg_catalog.avg(integer) is 'the average (arithmetic mean) as numeric of all integer values';

alter aggregate pg_catalog.avg(integer) owner to sail;

create aggregate pg_catalog.avg(smallint) (
    sfunc = int2_avg_accum,
    stype = bigint[],
    finalfunc = int8_avg,
    combinefunc = int4_avg_combine,
    initcond = '{0,0}',
    parallel = safe,
    msfunc = int2_avg_accum,
    minvfunc = int2_avg_accum_inv,
    mstype = bigint[],
    mfinalfunc = int8_avg,
    minitcond = '{0,0}'
    );

comment on aggregate pg_catalog.avg(smallint) is 'the average (arithmetic mean) as numeric of all smallint values';

alter aggregate pg_catalog.avg(smallint) owner to sail;

create aggregate pg_catalog.avg(numeric) (
    sfunc = numeric_avg_accum,
    stype = internal,
    sspace = 128,
    finalfunc = numeric_avg,
    combinefunc = numeric_avg_combine,
    serialfunc = numeric_avg_serialize,
    deserialfunc = numeric_avg_deserialize,
    parallel = safe,
    msfunc = numeric_avg_accum,
    minvfunc = numeric_accum_inv,
    mstype = internal,
    msspace = 128,
    mfinalfunc = numeric_avg
    );

comment on aggregate pg_catalog.avg(numeric) is 'the average (arithmetic mean) as numeric of all numeric values';

alter aggregate pg_catalog.avg(numeric) owner to sail;

create aggregate pg_catalog.avg(real) (
    sfunc = float4_accum,
    stype = double precision[],
    finalfunc = float8_avg,
    combinefunc = float8_combine,
    initcond = '{0,0,0}',
    parallel = safe
    );

comment on aggregate pg_catalog.avg(real) is 'the average (arithmetic mean) as float8 of all float4 values';

alter aggregate pg_catalog.avg(real) owner to sail;

create aggregate pg_catalog.avg(double precision) (
    sfunc = float8_accum,
    stype = double precision[],
    finalfunc = float8_avg,
    combinefunc = float8_combine,
    initcond = '{0,0,0}',
    parallel = safe
    );

comment on aggregate pg_catalog.avg(double precision) is 'the average (arithmetic mean) as float8 of all float8 values';

alter aggregate pg_catalog.avg(double precision) owner to sail;

create aggregate pg_catalog.avg(interval) (
    sfunc = interval_accum,
    stype = interval[],
    finalfunc = interval_avg,
    combinefunc = interval_combine,
    initcond = '{0 second,0 second}',
    parallel = safe,
    msfunc = interval_accum,
    minvfunc = interval_accum_inv,
    mstype = interval[],
    mfinalfunc = interval_avg,
    minitcond = '{0 second,0 second}'
    );

comment on aggregate pg_catalog.avg(interval) is 'the average (arithmetic mean) as interval of all interval values';

alter aggregate pg_catalog.avg(interval) owner to sail;

