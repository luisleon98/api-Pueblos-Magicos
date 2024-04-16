create table pueblos_solicitudes
(
    id               bigserial
        primary key,
    id_servicio      bigint not null
        constraint pueblos_solicitudes_id_servicio_foreign
            references servicios
            on delete cascade,
    id_pueblo_magico bigint not null
        constraint pueblos_solicitudes_id_pueblo_magico_foreign
            references pueblos_magicos,
    id_tipo_servicio bigint not null
        constraint pueblos_solicitudes_id_tipo_servicio_foreign
            references tipos_servicios,
    created_at       timestamp(0),
    updated_at       timestamp(0),
    deleted_at       timestamp(0)
);

alter table pueblos_solicitudes
    owner to sail;

