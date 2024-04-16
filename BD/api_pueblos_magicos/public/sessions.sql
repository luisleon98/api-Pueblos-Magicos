create table sessions
(
    id            varchar(255) not null
        primary key,
    user_id       bigint,
    ip_address    varchar(45),
    user_agent    text,
    payload       text         not null,
    last_activity integer      not null
);

alter table sessions
    owner to sail;

create index sessions_user_id_index
    on sessions (user_id);

create index sessions_last_activity_index
    on sessions (last_activity);

