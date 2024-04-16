create table bitacora
(
    id                   bigserial
        primary key,
    movimiento           varchar(255) not null,
    tabla_afectada       varchar(255) not null,
    id_registro_afectado integer      not null,
    id_usuario           bigint       not null
        constraint bitacora_id_usuario_foreign
            references usuarios,
    created_at           timestamp(0),
    updated_at           timestamp(0),
    deleted_at           timestamp(0)
);

alter table bitacora
    owner to sail;

