create aggregate pg_catalog.bit_and(smallint) (
    sfunc = int2and,
    stype = smallint,
    combinefunc = int2and,
    parallel = safe
    );

comment on aggregate pg_catalog.bit_and(smallint) is 'bitwise-and smallint aggregate';

alter aggregate pg_catalog.bit_and(smallint) owner to sail;

create aggregate pg_catalog.bit_and(integer) (
    sfunc = int4and,
    stype = integer,
    combinefunc = int4and,
    parallel = safe
    );

comment on aggregate pg_catalog.bit_and(integer) is 'bitwise-and integer aggregate';

alter aggregate pg_catalog.bit_and(integer) owner to sail;

create aggregate pg_catalog.bit_and(bigint) (
    sfunc = int8and,
    stype = bigint,
    combinefunc = int8and,
    parallel = safe
    );

comment on aggregate pg_catalog.bit_and(bigint) is 'bitwise-and bigint aggregate';

alter aggregate pg_catalog.bit_and(bigint) owner to sail;

create aggregate pg_catalog.bit_and(bit) (
    sfunc = bitand,
    stype = bit,
    combinefunc = bitand,
    parallel = safe
    );

comment on aggregate pg_catalog.bit_and(bit) is 'bitwise-and bit aggregate';

alter aggregate pg_catalog.bit_and(bit) owner to sail;

