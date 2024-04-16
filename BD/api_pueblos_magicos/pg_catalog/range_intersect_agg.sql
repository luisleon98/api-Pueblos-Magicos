create aggregate pg_catalog.range_intersect_agg(anymultirange) (
    sfunc = multirange_intersect_agg_transfn,
    stype = anymultirange,
    combinefunc = multirange_intersect_agg_transfn,
    parallel = safe
    );

comment on aggregate pg_catalog.range_intersect_agg(anymultirange) is 'range aggregate by intersecting';

alter aggregate pg_catalog.range_intersect_agg(anymultirange) owner to sail;

create aggregate pg_catalog.range_intersect_agg(anyrange) (
    sfunc = range_intersect_agg_transfn,
    stype = anyrange,
    combinefunc = range_intersect_agg_transfn,
    parallel = safe
    );

comment on aggregate pg_catalog.range_intersect_agg(anyrange) is 'range aggregate by intersecting';

alter aggregate pg_catalog.range_intersect_agg(anyrange) owner to sail;

