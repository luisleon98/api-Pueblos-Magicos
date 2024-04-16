create table observaciones
(
    id          bigserial
        primary key,
    id_servicio bigint not null,
    id_usuario  bigint not null,
    id_estatus  bigint not null,
    observacion text   not null,
    created_at  timestamp(0),
    updated_at  timestamp(0)
);

alter table observaciones
    owner to sail;

