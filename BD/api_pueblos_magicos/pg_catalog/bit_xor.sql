create aggregate pg_catalog.bit_xor(smallint) (
    sfunc = int2xor,
    stype = smallint,
    combinefunc = int2xor,
    parallel = safe
    );

comment on aggregate pg_catalog.bit_xor(smallint) is 'bitwise-xor smallint aggregate';

alter aggregate pg_catalog.bit_xor(smallint) owner to sail;

create aggregate pg_catalog.bit_xor(integer) (
    sfunc = int4xor,
    stype = integer,
    combinefunc = int4xor,
    parallel = safe
    );

comment on aggregate pg_catalog.bit_xor(integer) is 'bitwise-xor integer aggregate';

alter aggregate pg_catalog.bit_xor(integer) owner to sail;

create aggregate pg_catalog.bit_xor(bigint) (
    sfunc = int8xor,
    stype = bigint,
    combinefunc = int8xor,
    parallel = safe
    );

comment on aggregate pg_catalog.bit_xor(bigint) is 'bitwise-xor bigint aggregate';

alter aggregate pg_catalog.bit_xor(bigint) owner to sail;

create aggregate pg_catalog.bit_xor(bit) (
    sfunc = bitxor,
    stype = bit,
    combinefunc = bitxor,
    parallel = safe
    );

comment on aggregate pg_catalog.bit_xor(bit) is 'bitwise-xor bit aggregate';

alter aggregate pg_catalog.bit_xor(bit) owner to sail;

