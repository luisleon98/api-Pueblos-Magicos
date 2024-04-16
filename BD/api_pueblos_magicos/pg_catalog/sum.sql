create aggregate pg_catalog.sum(bigint) (
    sfunc = int8_avg_accum,
    stype = internal,
    sspace = 48,
    finalfunc = numeric_poly_sum,
    combinefunc = int8_avg_combine,
    serialfunc = int8_avg_serialize,
    deserialfunc = int8_avg_deserialize,
    parallel = safe,
    msfunc = int8_avg_accum,
    minvfunc = int8_avg_accum_inv,
    mstype = internal,
    msspace = 48,
    mfinalfunc = numeric_poly_sum
    );

comment on aggregate pg_catalog.sum(bigint) is 'sum as numeric across all bigint input values';

alter aggregate pg_catalog.sum(bigint) owner to sail;

create aggregate pg_catalog.sum(integer) (
    sfunc = int4_sum,
    stype = bigint,
    combinefunc = int8pl,
    parallel = safe,
    msfunc = int4_avg_accum,
    minvfunc = int4_avg_accum_inv,
    mstype = bigint[],
    mfinalfunc = int2int4_sum,
    minitcond = '{0,0}'
    );

comment on aggregate pg_catalog.sum(integer) is 'sum as bigint across all integer input values';

alter aggregate pg_catalog.sum(integer) owner to sail;

create aggregate pg_catalog.sum(smallint) (
    sfunc = int2_sum,
    stype = bigint,
    combinefunc = int8pl,
    parallel = safe,
    msfunc = int2_avg_accum,
    minvfunc = int2_avg_accum_inv,
    mstype = bigint[],
    mfinalfunc = int2int4_sum,
    minitcond = '{0,0}'
    );

comment on aggregate pg_catalog.sum(smallint) is 'sum as bigint across all smallint input values';

alter aggregate pg_catalog.sum(smallint) owner to sail;

create aggregate pg_catalog.sum(real) (
    sfunc = float4pl,
    stype = real,
    combinefunc = float4pl,
    parallel = safe
    );

comment on aggregate pg_catalog.sum(real) is 'sum as float4 across all float4 input values';

alter aggregate pg_catalog.sum(real) owner to sail;

create aggregate pg_catalog.sum(double precision) (
    sfunc = float8pl,
    stype = double precision,
    combinefunc = float8pl,
    parallel = safe
    );

comment on aggregate pg_catalog.sum(double precision) is 'sum as float8 across all float8 input values';

alter aggregate pg_catalog.sum(double precision) owner to sail;

create aggregate pg_catalog.sum(money) (
    sfunc = cash_pl,
    stype = money,
    combinefunc = cash_pl,
    parallel = safe,
    msfunc = cash_pl,
    minvfunc = cash_mi,
    mstype = money
    );

comment on aggregate pg_catalog.sum(money) is 'sum as money across all money input values';

alter aggregate pg_catalog.sum(money) owner to sail;

create aggregate pg_catalog.sum(interval) (
    sfunc = interval_pl,
    stype = interval,
    combinefunc = interval_pl,
    parallel = safe,
    msfunc = interval_pl,
    minvfunc = interval_mi,
    mstype = interval
    );

comment on aggregate pg_catalog.sum(interval) is 'sum as interval across all interval input values';

alter aggregate pg_catalog.sum(interval) owner to sail;

create aggregate pg_catalog.sum(numeric) (
    sfunc = numeric_avg_accum,
    stype = internal,
    sspace = 128,
    finalfunc = numeric_sum,
    combinefunc = numeric_avg_combine,
    serialfunc = numeric_avg_serialize,
    deserialfunc = numeric_avg_deserialize,
    parallel = safe,
    msfunc = numeric_avg_accum,
    minvfunc = numeric_accum_inv,
    mstype = internal,
    msspace = 128,
    mfinalfunc = numeric_sum
    );

comment on aggregate pg_catalog.sum(numeric) is 'sum as numeric across all numeric input values';

alter aggregate pg_catalog.sum(numeric) owner to sail;

