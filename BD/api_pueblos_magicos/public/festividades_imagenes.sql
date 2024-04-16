create table festividades_imagenes
(
    id            bigserial
        primary key,
    id_festividad bigint not null
        constraint festividades_imagenes_id_festividad_foreign
            references festividades
            on delete cascade,
    id_imagen     bigint not null
        constraint festividades_imagenes_id_imagen_foreign
            references imagenes
            on delete cascade,
    created_at    timestamp(0),
    updated_at    timestamp(0),
    deleted_at    timestamp(0)
);

alter table festividades_imagenes
    owner to sail;

