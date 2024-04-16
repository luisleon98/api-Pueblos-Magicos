create collation pg_catalog."POSIX" (
    locale = 'POSIX'
    );

comment on collation pg_catalog."POSIX" is 'standard POSIX collation';

alter collation pg_catalog."POSIX" owner to sail;

