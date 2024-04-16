create aggregate pg_catalog.regr_count(double precision, double precision) (
    sfunc = int8inc_float8_float8,
    stype = bigint,
    combinefunc = int8pl,
    initcond = '0',
    parallel = safe
    );

comment on aggregate pg_catalog.regr_count(double precision, double precision) is 'number of input rows in which both expressions are not null';

alter aggregate pg_catalog.regr_count(double precision, double precision) owner to sail;

