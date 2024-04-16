create table ratings
(
    id          bigserial
        primary key,
    rating      varchar(255) not null,
    comentario  varchar(255) not null,
    id_servicio bigint       not null
        constraint ratings_id_servicio_foreign
            references servicios
            on delete cascade,
    created_at  timestamp(0),
    updated_at  timestamp(0),
    deleted_at  timestamp(0)
);

alter table ratings
    owner to sail;

