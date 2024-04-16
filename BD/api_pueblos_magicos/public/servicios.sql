create table servicios
(
    id               bigserial
        primary key,
    id_tipo_servicio bigint not null
        constraint servicios_id_tipo_servicio_foreign
            references tipos_servicios,
    id_direccion     bigint not null
        constraint servicios_id_direccion_foreign
            references direcciones
            on delete cascade,
    id_usuario       bigint not null
        constraint servicios_id_usuario_foreign
            references usuarios,
    id_pueblo        bigint not null
        constraint servicios_id_pueblo_foreign
            references pueblos_magicos,
    created_at       timestamp(0),
    updated_at       timestamp(0),
    deleted_at       timestamp(0),
    id_estatus       bigint not null
        constraint servicios_id_estatus_foreign
            references estatus
);

alter table servicios
    owner to sail;

