create table imagenes
(
    id             bigserial
        primary key,
    nombre         varchar(255) not null,
    id_tipo_imagen bigint       not null
        constraint imagenes_id_tipo_imagen_foreign
            references tipos_imagenes,
    created_at     timestamp(0),
    updated_at     timestamp(0),
    deleted_at     timestamp(0)
);

alter table imagenes
    owner to sail;

