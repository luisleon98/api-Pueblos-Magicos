create table horarios
(
    id             bigserial
        primary key,
    horario_inicio time(0) not null,
    horario_fin    time(0) not null,
    created_at     timestamp(0),
    updated_at     timestamp(0),
    deleted_at     timestamp(0)
);

alter table horarios
    owner to sail;

