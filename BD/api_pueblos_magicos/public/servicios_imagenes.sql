create table servicios_imagenes
(
    id          bigserial
        primary key,
    id_servicio bigint not null
        constraint servicios_imagenes_id_servicio_foreign
            references servicios
            on delete cascade,
    id_imagen   bigint not null
        constraint servicios_imagenes_id_imagen_foreign
            references imagenes
            on delete cascade,
    created_at  timestamp(0),
    updated_at  timestamp(0),
    deleted_at  timestamp(0)
);

alter table servicios_imagenes
    owner to sail;

