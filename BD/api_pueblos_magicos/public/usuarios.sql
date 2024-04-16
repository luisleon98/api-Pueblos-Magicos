create table usuarios
(
    id              bigserial
        primary key,
    user_name       varchar(255) not null
        constraint usuarios_user_name_unique
            unique,
    password        varchar(255) not null,
    remember_token  varchar(100),
    created_at      timestamp(0),
    updated_at      timestamp(0),
    deleted_at      timestamp(0),
    id_tipo_usuario bigint       not null
        constraint usuarios_id_tipo_usuario_foreign
            references tipos_usuarios
);

alter table usuarios
    owner to sail;

