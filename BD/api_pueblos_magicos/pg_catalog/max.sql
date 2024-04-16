create aggregate pg_catalog.max(anyarray) (
    sfunc = array_larger,
    stype = anyarray,
    combinefunc = array_larger,
    parallel = safe,
    sortop = operator (>)
    );

comment on aggregate pg_catalog.max(anyarray) is 'maximum value of all anyarray input values';

alter aggregate pg_catalog.max(anyarray) owner to sail;

create aggregate pg_catalog.max(bigint) (
    sfunc = int8larger,
    stype = bigint,
    combinefunc = int8larger,
    parallel = safe,
    sortop = operator (>)
    );

comment on aggregate pg_catalog.max(bigint) is 'maximum value of all bigint input values';

alter aggregate pg_catalog.max(bigint) owner to sail;

create aggregate pg_catalog.max(integer) (
    sfunc = int4larger,
    stype = integer,
    combinefunc = int4larger,
    parallel = safe,
    sortop = operator (>)
    );

comment on aggregate pg_catalog.max(integer) is 'maximum value of all integer input values';

alter aggregate pg_catalog.max(integer) owner to sail;

create aggregate pg_catalog.max(smallint) (
    sfunc = int2larger,
    stype = smallint,
    combinefunc = int2larger,
    parallel = safe,
    sortop = operator (>)
    );

comment on aggregate pg_catalog.max(smallint) is 'maximum value of all smallint input values';

alter aggregate pg_catalog.max(smallint) owner to sail;

create aggregate pg_catalog.max(oid) (
    sfunc = oidlarger,
    stype = oid,
    combinefunc = oidlarger,
    parallel = safe,
    sortop = operator (>)
    );

comment on aggregate pg_catalog.max(oid) is 'maximum value of all oid input values';

alter aggregate pg_catalog.max(oid) owner to sail;

create aggregate pg_catalog.max(real) (
    sfunc = float4larger,
    stype = real,
    combinefunc = float4larger,
    parallel = safe,
    sortop = operator (>)
    );

comment on aggregate pg_catalog.max(real) is 'maximum value of all float4 input values';

alter aggregate pg_catalog.max(real) owner to sail;

create aggregate pg_catalog.max(double precision) (
    sfunc = float8larger,
    stype = double precision,
    combinefunc = float8larger,
    parallel = safe,
    sortop = operator (>)
    );

comment on aggregate pg_catalog.max(double precision) is 'maximum value of all float8 input values';

alter aggregate pg_catalog.max(double precision) owner to sail;

create aggregate pg_catalog.max(date) (
    sfunc = date_larger,
    stype = date,
    combinefunc = date_larger,
    parallel = safe,
    sortop = operator (>)
    );

comment on aggregate pg_catalog.max(date) is 'maximum value of all date input values';

alter aggregate pg_catalog.max(date) owner to sail;

create aggregate pg_catalog.max(time) (
    sfunc = time_larger,
    stype = time,
    combinefunc = time_larger,
    parallel = safe,
    sortop = operator (>)
    );

comment on aggregate pg_catalog.max(time) is 'maximum value of all time input values';

alter aggregate pg_catalog.max(time) owner to sail;

create aggregate pg_catalog.max(time with time zone) (
    sfunc = timetz_larger,
    stype = time with time zone,
    combinefunc = timetz_larger,
    parallel = safe,
    sortop = operator (>)
    );

comment on aggregate pg_catalog.max(time with time zone) is 'maximum value of all time with time zone input values';

alter aggregate pg_catalog.max(time with time zone) owner to sail;

create aggregate pg_catalog.max(money) (
    sfunc = cashlarger,
    stype = money,
    combinefunc = cashlarger,
    parallel = safe,
    sortop = operator (>)
    );

comment on aggregate pg_catalog.max(money) is 'maximum value of all money input values';

alter aggregate pg_catalog.max(money) owner to sail;

create aggregate pg_catalog.max(timestamp) (
    sfunc = timestamp_larger,
    stype = timestamp,
    combinefunc = timestamp_larger,
    parallel = safe,
    sortop = operator (>)
    );

comment on aggregate pg_catalog.max(timestamp) is 'maximum value of all timestamp input values';

alter aggregate pg_catalog.max(timestamp) owner to sail;

create aggregate pg_catalog.max(timestamp with time zone) (
    sfunc = timestamptz_larger,
    stype = timestamp with time zone,
    combinefunc = timestamptz_larger,
    parallel = safe,
    sortop = operator (>)
    );

comment on aggregate pg_catalog.max(timestamp with time zone) is 'maximum value of all timestamp with time zone input values';

alter aggregate pg_catalog.max(timestamp with time zone) owner to sail;

create aggregate pg_catalog.max(interval) (
    sfunc = interval_larger,
    stype = interval,
    combinefunc = interval_larger,
    parallel = safe,
    sortop = operator (>)
    );

comment on aggregate pg_catalog.max(interval) is 'maximum value of all interval input values';

alter aggregate pg_catalog.max(interval) owner to sail;

create aggregate pg_catalog.max(text) (
    sfunc = text_larger,
    stype = text,
    combinefunc = text_larger,
    parallel = safe,
    sortop = operator (>)
    );

comment on aggregate pg_catalog.max(text) is 'maximum value of all text input values';

alter aggregate pg_catalog.max(text) owner to sail;

create aggregate pg_catalog.max(numeric) (
    sfunc = numeric_larger,
    stype = numeric,
    combinefunc = numeric_larger,
    parallel = safe,
    sortop = operator (>)
    );

comment on aggregate pg_catalog.max(numeric) is 'maximum value of all numeric input values';

alter aggregate pg_catalog.max(numeric) owner to sail;

create aggregate pg_catalog.max(char) (
    sfunc = bpchar_larger,
    stype = char,
    combinefunc = bpchar_larger,
    parallel = safe,
    sortop = operator (>)
    );

comment on aggregate pg_catalog.max(char) is 'maximum value of all bpchar input values';

alter aggregate pg_catalog.max(char) owner to sail;

create aggregate pg_catalog.max(tid) (
    sfunc = tidlarger,
    stype = tid,
    combinefunc = tidlarger,
    parallel = safe,
    sortop = operator (>)
    );

comment on aggregate pg_catalog.max(tid) is 'maximum value of all tid input values';

alter aggregate pg_catalog.max(tid) owner to sail;

create aggregate pg_catalog.max(anyenum) (
    sfunc = enum_larger,
    stype = anyenum,
    combinefunc = enum_larger,
    parallel = safe,
    sortop = operator (>)
    );

comment on aggregate pg_catalog.max(anyenum) is 'maximum value of all enum input values';

alter aggregate pg_catalog.max(anyenum) owner to sail;

create aggregate pg_catalog.max(inet) (
    sfunc = network_larger,
    stype = inet,
    combinefunc = network_larger,
    parallel = safe,
    sortop = operator (>)
    );

comment on aggregate pg_catalog.max(inet) is 'maximum value of all inet input values';

alter aggregate pg_catalog.max(inet) owner to sail;

create aggregate pg_catalog.max(pg_lsn) (
    sfunc = pg_lsn_larger,
    stype = pg_lsn,
    combinefunc = pg_lsn_larger,
    parallel = safe,
    sortop = operator (>)
    );

comment on aggregate pg_catalog.max(pg_lsn) is 'maximum value of all pg_lsn input values';

alter aggregate pg_catalog.max(pg_lsn) owner to sail;

create aggregate pg_catalog.max(xid8) (
    sfunc = xid8_larger,
    stype = xid8,
    combinefunc = xid8_larger,
    parallel = safe,
    sortop = operator (>)
    );

comment on aggregate pg_catalog.max(xid8) is 'maximum value of all xid8 input values';

alter aggregate pg_catalog.max(xid8) owner to sail;

