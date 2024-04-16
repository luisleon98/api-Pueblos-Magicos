create aggregate pg_catalog.jsonb_object_agg("any", "any") (
    sfunc = jsonb_object_agg_transfn,
    stype = internal,
    finalfunc = jsonb_object_agg_finalfn,
    parallel = safe
    );

comment on aggregate pg_catalog.jsonb_object_agg("any", "any") is 'aggregate inputs into jsonb object';

alter aggregate pg_catalog.jsonb_object_agg("any", "any") owner to sail;

