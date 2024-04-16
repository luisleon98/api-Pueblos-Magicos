create aggregate pg_catalog.jsonb_agg(anyelement) (
    sfunc = jsonb_agg_transfn,
    stype = internal,
    finalfunc = jsonb_agg_finalfn,
    parallel = safe
    );

comment on aggregate pg_catalog.jsonb_agg(anyelement) is 'aggregate input into jsonb';

alter aggregate pg_catalog.jsonb_agg(anyelement) owner to sail;

