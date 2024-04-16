create operator pg_catalog.!~ (procedure = pg_catalog.nameregexne, leftarg = name, rightarg = text, negator = pg_catalog.~, join = pg_catalog.regexnejoinsel, restrict = pg_catalog.regexnesel);

comment on operator pg_catalog.!~(name, text) is 'does not match regular expression, case-sensitive';

alter operator pg_catalog.!~(name, text) owner to sail;

create operator pg_catalog.!~ (procedure = pg_catalog.textregexne, leftarg = text, rightarg = text, negator = pg_catalog.~, join = pg_catalog.regexnejoinsel, restrict = pg_catalog.regexnesel);

comment on operator pg_catalog.!~(text, text) is 'does not match regular expression, case-sensitive';

alter operator pg_catalog.!~(text, text) owner to sail;

create operator pg_catalog.!~ (procedure = pg_catalog.bpcharregexne, leftarg = char, rightarg = text, negator = pg_catalog.~, join = pg_catalog.regexnejoinsel, restrict = pg_catalog.regexnesel);

comment on operator pg_catalog.!~(char, text) is 'does not match regular expression, case-sensitive';

alter operator pg_catalog.!~(char, text) owner to sail;

