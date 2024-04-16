create aggregate pg_catalog.count("any") (
    sfunc = int8inc_any,
    stype = bigint,
    combinefunc = int8pl,
    initcond = '0',
    parallel = safe,
    msfunc = int8inc_any,
    minvfunc = int8dec_any,
    mstype = bigint,
    minitcond = '0'
    );

comment on aggregate pg_catalog.count("any") is 'number of input rows for which the input expression is not null';

alter aggregate pg_catalog.count("any") owner to sail;

create aggregate pg_catalog.count() (
    sfunc = int8inc,
    stype = bigint,
    combinefunc = int8pl,
    initcond = '0',
    parallel = safe,
    msfunc = int8inc,
    minvfunc = int8dec,
    mstype = bigint,
    minitcond = '0'
    );

comment on aggregate pg_catalog.count() is 'number of input rows';

alter aggregate pg_catalog.count() owner to sail;

