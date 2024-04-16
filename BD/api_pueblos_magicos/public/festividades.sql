create table festividades
(
    id           bigserial
        primary key,
    id_direccion bigint not null
        constraint festividades_id_direccion_foreign
            references direcciones
            on delete cascade,
    id_usuario   bigint not null
        constraint festividades_id_usuario_foreign
            references usuarios
            on delete cascade,
    id_pueblo    bigint not null
        constraint festividades_id_pueblo_foreign
            references pueblos_magicos,
    created_at   timestamp(0),
    updated_at   timestamp(0),
    deleted_at   timestamp(0)
);

alter table festividades
    owner to sail;

