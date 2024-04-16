create operator pg_catalog.!! (procedure = pg_catalog.tsquery_not, rightarg = tsquery);

comment on operator pg_catalog.!!(none, tsquery) is 'NOT tsquery';

alter operator pg_catalog.!!(none, tsquery) owner to sail;

