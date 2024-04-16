create aggregate pg_catalog.array_agg(anynonarray) (
    sfunc = array_agg_transfn,
    stype = internal,
    finalfunc = array_agg_finalfn,
    finalfunc_extra,
    parallel = safe
    );

comment on aggregate pg_catalog.array_agg(anynonarray) is 'concatenate aggregate input into an array';

alter aggregate pg_catalog.array_agg(anynonarray) owner to sail;

create aggregate pg_catalog.array_agg(anyarray) (
    sfunc = array_agg_array_transfn,
    stype = internal,
    finalfunc = array_agg_array_finalfn,
    finalfunc_extra,
    parallel = safe
    );

comment on aggregate pg_catalog.array_agg(anyarray) is 'concatenate aggregate input into an array';

alter aggregate pg_catalog.array_agg(anyarray) owner to sail;

