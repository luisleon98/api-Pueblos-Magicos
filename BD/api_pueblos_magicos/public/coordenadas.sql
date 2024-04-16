create table coordenadas
(
    id         bigserial
        primary key,
    longitud   varchar(255) not null,
    latitud    varchar(255) not null,
    created_at timestamp(0),
    updated_at timestamp(0),
    deleted_at timestamp(0)
);

alter table coordenadas
    owner to sail;

