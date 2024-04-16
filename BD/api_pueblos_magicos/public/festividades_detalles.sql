create table festividades_detalles
(
    id             bigserial
        primary key,
    dias_servicio  varchar(255) not null,
    horarios       varchar(255) not null,
    precios        varchar(255) not null,
    nombre         varchar(255) not null,
    descripcion    varchar(255) not null,
    id_coordenadas bigint       not null
        constraint festividades_detalles_id_coordenadas_foreign
            references coordenadas
            on delete cascade,
    id_servicio    bigint       not null
        constraint festividades_detalles_id_servicio_foreign
            references servicios
            on delete cascade,
    created_at     timestamp(0),
    updated_at     timestamp(0),
    deleted_at     timestamp(0)
);

alter table festividades_detalles
    owner to sail;

