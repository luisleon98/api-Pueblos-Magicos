create aggregate pg_catalog.string_agg(text, text) (
    sfunc = string_agg_transfn,
    stype = internal,
    finalfunc = string_agg_finalfn,
    parallel = safe
    );

comment on aggregate pg_catalog.string_agg(text, text) is 'concatenate aggregate input into a string';

alter aggregate pg_catalog.string_agg(text, text) owner to sail;

create aggregate pg_catalog.string_agg(bytea, bytea) (
    sfunc = bytea_string_agg_transfn,
    stype = internal,
    finalfunc = bytea_string_agg_finalfn,
    parallel = safe
    );

comment on aggregate pg_catalog.string_agg(bytea, bytea) is 'concatenate aggregate input into a bytea';

alter aggregate pg_catalog.string_agg(bytea, bytea) owner to sail;

