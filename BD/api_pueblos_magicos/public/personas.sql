create table personas
(
    id           bigint default nextval('pesonas_id_seq'::regclass) not null
        constraint pesonas_pkey
            primary key,
    nombre       varchar(255)                                       not null,
    apellido_pat varchar(255)                                       not null,
    apellido_mat varchar(255)                                       not null,
    id_usuario   bigint                                             not null
        constraint pesonas_id_usuario_foreign
            references usuarios,
    created_at   timestamp(0),
    updated_at   timestamp(0),
    deleted_at   timestamp(0)
);

alter table personas
    owner to sail;

