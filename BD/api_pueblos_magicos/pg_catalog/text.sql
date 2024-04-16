-- Unknown how to generate base type type

comment on type pg_catalog.text is 'variable-length string, no limit specified';

alter type pg_catalog.text owner to sail;

create function pg_catalog.text(char) returns text
    immutable
    strict
    parallel safe
    cost 1
    language internal
as
$$
begin
-- missing source code
end;
$$;

comment on function pg_catalog.text(char) is 'convert char(n) to text';

alter function pg_catalog.text(char) owner to sail;

create function pg_catalog.text(name) returns text
    immutable
    leakproof
    strict
    parallel safe
    cost 1
    language internal
as
$$
begin
-- missing source code
end;
$$;

comment on function pg_catalog.text(name) is 'convert name to text';

alter function pg_catalog.text(name) owner to sail;

create function pg_catalog.text(inet) returns text
    immutable
    strict
    parallel safe
    cost 1
    language internal
as
$$
begin
-- missing source code
end;
$$;

comment on function pg_catalog.text(inet) is 'show all parts of inet/cidr value';

alter function pg_catalog.text(inet) owner to sail;

create function pg_catalog.text("char") returns text
    immutable
    strict
    parallel safe
    cost 1
    language internal
as
$$
begin
-- missing source code
end;
$$;

comment on function pg_catalog.text("char") is 'convert char to text';

alter function pg_catalog.text("char") owner to sail;

create function pg_catalog.text(xml) returns text
    immutable
    strict
    parallel safe
    cost 1
    language internal
as
$$
begin
-- missing source code
end;
$$;

comment on function pg_catalog.text(xml) is 'serialize an XML value to a character string';

alter function pg_catalog.text(xml) owner to sail;

create function pg_catalog.text(boolean) returns text
    immutable
    strict
    parallel safe
    cost 1
    language internal
as
$$
begin
-- missing source code
end;
$$;

comment on function pg_catalog.text(boolean) is 'convert boolean to text';

alter function pg_catalog.text(boolean) owner to sail;

