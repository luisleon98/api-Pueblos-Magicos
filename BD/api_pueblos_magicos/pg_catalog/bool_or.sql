create aggregate pg_catalog.bool_or(boolean) (
    sfunc = boolor_statefunc,
    stype = boolean,
    combinefunc = boolor_statefunc,
    parallel = safe,
    msfunc = bool_accum,
    minvfunc = bool_accum_inv,
    mstype = internal,
    msspace = 16,
    mfinalfunc = bool_anytrue,
    sortop = operator (>)
    );

comment on aggregate pg_catalog.bool_or(boolean) is 'boolean-or aggregate';

alter aggregate pg_catalog.bool_or(boolean) owner to sail;

