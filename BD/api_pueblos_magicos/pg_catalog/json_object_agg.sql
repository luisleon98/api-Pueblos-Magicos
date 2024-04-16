create aggregate pg_catalog.json_object_agg("any", "any") (
    sfunc = json_object_agg_transfn,
    stype = internal,
    finalfunc = json_object_agg_finalfn,
    parallel = safe
    );

comment on aggregate pg_catalog.json_object_agg("any", "any") is 'aggregate input into a json object';

alter aggregate pg_catalog.json_object_agg("any", "any") owner to sail;

