create aggregate pg_catalog.xmlagg(xml) (
    sfunc = xmlconcat2,
    stype = xml,
    parallel = safe
    );

comment on aggregate pg_catalog.xmlagg(xml) is 'concatenate XML values';

alter aggregate pg_catalog.xmlagg(xml) owner to sail;

