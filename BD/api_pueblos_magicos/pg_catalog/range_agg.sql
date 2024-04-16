create aggregate pg_catalog.range_agg(anyrange) (
    sfunc = range_agg_transfn,
    stype = internal,
    finalfunc = range_agg_finalfn,
    finalfunc_extra,
    parallel = safe
    );

comment on aggregate pg_catalog.range_agg(anyrange) is 'combine aggregate input into a multirange';

alter aggregate pg_catalog.range_agg(anyrange) owner to sail;

create aggregate pg_catalog.range_agg(anymultirange) (
    sfunc = multirange_agg_transfn,
    stype = internal,
    finalfunc = multirange_agg_finalfn,
    finalfunc_extra,
    parallel = safe
    );

comment on aggregate pg_catalog.range_agg(anymultirange) is 'combine aggregate input into a multirange';

alter aggregate pg_catalog.range_agg(anymultirange) owner to sail;

