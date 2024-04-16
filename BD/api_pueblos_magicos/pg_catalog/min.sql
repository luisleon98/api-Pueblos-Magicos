create aggregate pg_catalog.min(anyarray) (
    sfunc = array_smaller,
    stype = anyarray,
    combinefunc = array_smaller,
    parallel = safe,
    sortop = operator (<)
    );

comment on aggregate pg_catalog.min(anyarray) is 'minimum value of all anyarray input values';

alter aggregate pg_catalog.min(anyarray) owner to sail;

create aggregate pg_catalog.min(bigint) (
    sfunc = int8smaller,
    stype = bigint,
    combinefunc = int8smaller,
    parallel = safe,
    sortop = operator (<)
    );

comment on aggregate pg_catalog.min(bigint) is 'minimum value of all bigint input values';

alter aggregate pg_catalog.min(bigint) owner to sail;

create aggregate pg_catalog.min(integer) (
    sfunc = int4smaller,
    stype = integer,
    combinefunc = int4smaller,
    parallel = safe,
    sortop = operator (<)
    );

comment on aggregate pg_catalog.min(integer) is 'minimum value of all integer input values';

alter aggregate pg_catalog.min(integer) owner to sail;

create aggregate pg_catalog.min(smallint) (
    sfunc = int2smaller,
    stype = smallint,
    combinefunc = int2smaller,
    parallel = safe,
    sortop = operator (<)
    );

comment on aggregate pg_catalog.min(smallint) is 'minimum value of all smallint input values';

alter aggregate pg_catalog.min(smallint) owner to sail;

create aggregate pg_catalog.min(oid) (
    sfunc = oidsmaller,
    stype = oid,
    combinefunc = oidsmaller,
    parallel = safe,
    sortop = operator (<)
    );

comment on aggregate pg_catalog.min(oid) is 'minimum value of all oid input values';

alter aggregate pg_catalog.min(oid) owner to sail;

create aggregate pg_catalog.min(real) (
    sfunc = float4smaller,
    stype = real,
    combinefunc = float4smaller,
    parallel = safe,
    sortop = operator (<)
    );

comment on aggregate pg_catalog.min(real) is 'minimum value of all float4 input values';

alter aggregate pg_catalog.min(real) owner to sail;

create aggregate pg_catalog.min(double precision) (
    sfunc = float8smaller,
    stype = double precision,
    combinefunc = float8smaller,
    parallel = safe,
    sortop = operator (<)
    );

comment on aggregate pg_catalog.min(double precision) is 'minimum value of all float8 input values';

alter aggregate pg_catalog.min(double precision) owner to sail;

create aggregate pg_catalog.min(date) (
    sfunc = date_smaller,
    stype = date,
    combinefunc = date_smaller,
    parallel = safe,
    sortop = operator (<)
    );

comment on aggregate pg_catalog.min(date) is 'minimum value of all date input values';

alter aggregate pg_catalog.min(date) owner to sail;

create aggregate pg_catalog.min(time) (
    sfunc = time_smaller,
    stype = time,
    combinefunc = time_smaller,
    parallel = safe,
    sortop = operator (<)
    );

comment on aggregate pg_catalog.min(time) is 'minimum value of all time input values';

alter aggregate pg_catalog.min(time) owner to sail;

create aggregate pg_catalog.min(time with time zone) (
    sfunc = timetz_smaller,
    stype = time with time zone,
    combinefunc = timetz_smaller,
    parallel = safe,
    sortop = operator (<)
    );

comment on aggregate pg_catalog.min(time with time zone) is 'minimum value of all time with time zone input values';

alter aggregate pg_catalog.min(time with time zone) owner to sail;

create aggregate pg_catalog.min(money) (
    sfunc = cashsmaller,
    stype = money,
    combinefunc = cashsmaller,
    parallel = safe,
    sortop = operator (<)
    );

comment on aggregate pg_catalog.min(money) is 'minimum value of all money input values';

alter aggregate pg_catalog.min(money) owner to sail;

create aggregate pg_catalog.min(timestamp) (
    sfunc = timestamp_smaller,
    stype = timestamp,
    combinefunc = timestamp_smaller,
    parallel = safe,
    sortop = operator (<)
    );

comment on aggregate pg_catalog.min(timestamp) is 'minimum value of all timestamp input values';

alter aggregate pg_catalog.min(timestamp) owner to sail;

create aggregate pg_catalog.min(timestamp with time zone) (
    sfunc = timestamptz_smaller,
    stype = timestamp with time zone,
    combinefunc = timestamptz_smaller,
    parallel = safe,
    sortop = operator (<)
    );

comment on aggregate pg_catalog.min(timestamp with time zone) is 'minimum value of all timestamp with time zone input values';

alter aggregate pg_catalog.min(timestamp with time zone) owner to sail;

create aggregate pg_catalog.min(interval) (
    sfunc = interval_smaller,
    stype = interval,
    combinefunc = interval_smaller,
    parallel = safe,
    sortop = operator (<)
    );

comment on aggregate pg_catalog.min(interval) is 'minimum value of all interval input values';

alter aggregate pg_catalog.min(interval) owner to sail;

create aggregate pg_catalog.min(text) (
    sfunc = text_smaller,
    stype = text,
    combinefunc = text_smaller,
    parallel = safe,
    sortop = operator (<)
    );

comment on aggregate pg_catalog.min(text) is 'minimum value of all text values';

alter aggregate pg_catalog.min(text) owner to sail;

create aggregate pg_catalog.min(numeric) (
    sfunc = numeric_smaller,
    stype = numeric,
    combinefunc = numeric_smaller,
    parallel = safe,
    sortop = operator (<)
    );

comment on aggregate pg_catalog.min(numeric) is 'minimum value of all numeric input values';

alter aggregate pg_catalog.min(numeric) owner to sail;

create aggregate pg_catalog.min(char) (
    sfunc = bpchar_smaller,
    stype = char,
    combinefunc = bpchar_smaller,
    parallel = safe,
    sortop = operator (<)
    );

comment on aggregate pg_catalog.min(char) is 'minimum value of all bpchar input values';

alter aggregate pg_catalog.min(char) owner to sail;

create aggregate pg_catalog.min(tid) (
    sfunc = tidsmaller,
    stype = tid,
    combinefunc = tidsmaller,
    parallel = safe,
    sortop = operator (<)
    );

comment on aggregate pg_catalog.min(tid) is 'minimum value of all tid input values';

alter aggregate pg_catalog.min(tid) owner to sail;

create aggregate pg_catalog.min(anyenum) (
    sfunc = enum_smaller,
    stype = anyenum,
    combinefunc = enum_smaller,
    parallel = safe,
    sortop = operator (<)
    );

comment on aggregate pg_catalog.min(anyenum) is 'minimum value of all enum input values';

alter aggregate pg_catalog.min(anyenum) owner to sail;

create aggregate pg_catalog.min(inet) (
    sfunc = network_smaller,
    stype = inet,
    combinefunc = network_smaller,
    parallel = safe,
    sortop = operator (<)
    );

comment on aggregate pg_catalog.min(inet) is 'minimum value of all inet input values';

alter aggregate pg_catalog.min(inet) owner to sail;

create aggregate pg_catalog.min(pg_lsn) (
    sfunc = pg_lsn_smaller,
    stype = pg_lsn,
    combinefunc = pg_lsn_smaller,
    parallel = safe,
    sortop = operator (<)
    );

comment on aggregate pg_catalog.min(pg_lsn) is 'minimum value of all pg_lsn input values';

alter aggregate pg_catalog.min(pg_lsn) owner to sail;

create aggregate pg_catalog.min(xid8) (
    sfunc = xid8_smaller,
    stype = xid8,
    combinefunc = xid8_smaller,
    parallel = safe,
    sortop = operator (<)
    );

comment on aggregate pg_catalog.min(xid8) is 'minimum value of all xid8 input values';

alter aggregate pg_catalog.min(xid8) owner to sail;

