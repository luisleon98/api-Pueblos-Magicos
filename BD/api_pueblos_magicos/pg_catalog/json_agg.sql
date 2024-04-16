create aggregate pg_catalog.json_agg(anyelement) (
    sfunc = json_agg_transfn,
    stype = internal,
    finalfunc = json_agg_finalfn,
    parallel = safe
    );

comment on aggregate pg_catalog.json_agg(anyelement) is 'aggregate input into json';

alter aggregate pg_catalog.json_agg(anyelement) owner to sail;

