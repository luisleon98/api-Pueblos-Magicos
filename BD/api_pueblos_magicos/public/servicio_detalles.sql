create table servicio_detalles
(
    id             bigserial
        primary key,
    dias_servicio  varchar(255) not null,
    precios        varchar(255) not null,
    titulo         varchar(255) not null,
    descripcion    text         not null,
    id_coordenadas bigint       not null
        constraint servicio_detalles_id_coordenadas_foreign
            references coordenadas
            on delete cascade,
    id_servicio    bigint       not null
        constraint servicio_detalles_id_servicio_foreign
            references servicios
            on delete cascade,
    created_at     timestamp(0),
    updated_at     timestamp(0),
    deleted_at     timestamp(0),
    id_horarios    bigint       not null
        constraint servicio_detalles_id_horarios_foreign
            references horarios
            on delete cascade
);

alter table servicio_detalles
    owner to sail;

