create aggregate pg_catalog.var_pop(bigint) (
    sfunc = int8_accum,
    stype = internal,
    sspace = 128,
    finalfunc = numeric_var_pop,
    combinefunc = numeric_combine,
    serialfunc = numeric_serialize,
    deserialfunc = numeric_deserialize,
    parallel = safe,
    msfunc = int8_accum,
    minvfunc = int8_accum_inv,
    mstype = internal,
    msspace = 128,
    mfinalfunc = numeric_var_pop
    );

comment on aggregate pg_catalog.var_pop(bigint) is 'population variance of bigint input values (square of the population standard deviation)';

alter aggregate pg_catalog.var_pop(bigint) owner to sail;

create aggregate pg_catalog.var_pop(integer) (
    sfunc = int4_accum,
    stype = internal,
    sspace = 48,
    finalfunc = numeric_poly_var_pop,
    combinefunc = numeric_poly_combine,
    serialfunc = numeric_poly_serialize,
    deserialfunc = numeric_poly_deserialize,
    parallel = safe,
    msfunc = int4_accum,
    minvfunc = int4_accum_inv,
    mstype = internal,
    msspace = 48,
    mfinalfunc = numeric_poly_var_pop
    );

comment on aggregate pg_catalog.var_pop(integer) is 'population variance of integer input values (square of the population standard deviation)';

alter aggregate pg_catalog.var_pop(integer) owner to sail;

create aggregate pg_catalog.var_pop(smallint) (
    sfunc = int2_accum,
    stype = internal,
    sspace = 48,
    finalfunc = numeric_poly_var_pop,
    combinefunc = numeric_poly_combine,
    serialfunc = numeric_poly_serialize,
    deserialfunc = numeric_poly_deserialize,
    parallel = safe,
    msfunc = int2_accum,
    minvfunc = int2_accum_inv,
    mstype = internal,
    msspace = 48,
    mfinalfunc = numeric_poly_var_pop
    );

comment on aggregate pg_catalog.var_pop(smallint) is 'population variance of smallint input values (square of the population standard deviation)';

alter aggregate pg_catalog.var_pop(smallint) owner to sail;

create aggregate pg_catalog.var_pop(real) (
    sfunc = float4_accum,
    stype = double precision[],
    finalfunc = float8_var_pop,
    combinefunc = float8_combine,
    initcond = '{0,0,0}',
    parallel = safe
    );

comment on aggregate pg_catalog.var_pop(real) is 'population variance of float4 input values (square of the population standard deviation)';

alter aggregate pg_catalog.var_pop(real) owner to sail;

create aggregate pg_catalog.var_pop(double precision) (
    sfunc = float8_accum,
    stype = double precision[],
    finalfunc = float8_var_pop,
    combinefunc = float8_combine,
    initcond = '{0,0,0}',
    parallel = safe
    );

comment on aggregate pg_catalog.var_pop(double precision) is 'population variance of float8 input values (square of the population standard deviation)';

alter aggregate pg_catalog.var_pop(double precision) owner to sail;

create aggregate pg_catalog.var_pop(numeric) (
    sfunc = numeric_accum,
    stype = internal,
    sspace = 128,
    finalfunc = numeric_var_pop,
    combinefunc = numeric_combine,
    serialfunc = numeric_serialize,
    deserialfunc = numeric_deserialize,
    parallel = safe,
    msfunc = numeric_accum,
    minvfunc = numeric_accum_inv,
    mstype = internal,
    msspace = 128,
    mfinalfunc = numeric_var_pop
    );

comment on aggregate pg_catalog.var_pop(numeric) is 'population variance of numeric input values (square of the population standard deviation)';

alter aggregate pg_catalog.var_pop(numeric) owner to sail;

