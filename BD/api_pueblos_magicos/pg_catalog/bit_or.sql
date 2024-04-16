create aggregate pg_catalog.bit_or(smallint) (
    sfunc = int2or,
    stype = smallint,
    combinefunc = int2or,
    parallel = safe
    );

comment on aggregate pg_catalog.bit_or(smallint) is 'bitwise-or smallint aggregate';

alter aggregate pg_catalog.bit_or(smallint) owner to sail;

create aggregate pg_catalog.bit_or(integer) (
    sfunc = int4or,
    stype = integer,
    combinefunc = int4or,
    parallel = safe
    );

comment on aggregate pg_catalog.bit_or(integer) is 'bitwise-or integer aggregate';

alter aggregate pg_catalog.bit_or(integer) owner to sail;

create aggregate pg_catalog.bit_or(bigint) (
    sfunc = int8or,
    stype = bigint,
    combinefunc = int8or,
    parallel = safe
    );

comment on aggregate pg_catalog.bit_or(bigint) is 'bitwise-or bigint aggregate';

alter aggregate pg_catalog.bit_or(bigint) owner to sail;

create aggregate pg_catalog.bit_or(bit) (
    sfunc = bitor,
    stype = bit,
    combinefunc = bitor,
    parallel = safe
    );

comment on aggregate pg_catalog.bit_or(bit) is 'bitwise-or bit aggregate';

alter aggregate pg_catalog.bit_or(bit) owner to sail;

