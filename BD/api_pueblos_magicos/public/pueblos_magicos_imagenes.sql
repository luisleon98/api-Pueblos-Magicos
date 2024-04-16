create table pueblos_magicos_imagenes
(
    id               bigserial
        primary key,
    id_pueblo_magico bigint not null
        constraint pueblos_magicos_imagenes_id_pueblo_magico_foreign
            references pueblos_magicos
            on delete cascade,
    id_imagen        bigint not null
        constraint pueblos_magicos_imagenes_id_imagen_foreign
            references imagenes
            on delete cascade,
    created_at       timestamp(0),
    updated_at       timestamp(0),
    deleted_at       timestamp(0)
);

alter table pueblos_magicos_imagenes
    owner to sail;

