create sequence pesonas_id_seq;

alter sequence pesonas_id_seq owner to sail;

create table migrations
(
    id        serial,
    migration varchar(255) not null,
    batch     integer      not null
);

alter table migrations
    owner to sail;

alter table migrations
    add primary key (id);

create table usuarios
(
    id              bigserial,
    user_name       varchar(255) not null,
    password        varchar(255) not null,
    remember_token  varchar(100),
    created_at      timestamp(0),
    updated_at      timestamp(0),
    deleted_at      timestamp(0),
    id_tipo_usuario bigint       not null
);

alter table usuarios
    owner to sail;

alter table usuarios
    add primary key (id);

alter table usuarios
    add constraint usuarios_user_name_unique
        unique (user_name);

create table password_reset_tokens
(
    email      varchar(255) not null,
    token      varchar(255) not null,
    created_at timestamp(0)
);

alter table password_reset_tokens
    owner to sail;

alter table password_reset_tokens
    add primary key (email);

create table sessions
(
    id            varchar(255) not null,
    user_id       bigint,
    ip_address    varchar(45),
    user_agent    text,
    payload       text         not null,
    last_activity integer      not null
);

alter table sessions
    owner to sail;

create index sessions_user_id_index
    on sessions (user_id);

create index sessions_last_activity_index
    on sessions (last_activity);

alter table sessions
    add primary key (id);

create table cache
(
    key        varchar(255) not null,
    value      text         not null,
    expiration integer      not null
);

alter table cache
    owner to sail;

alter table cache
    add primary key (key);

create table cache_locks
(
    key        varchar(255) not null,
    owner      varchar(255) not null,
    expiration integer      not null
);

alter table cache_locks
    owner to sail;

alter table cache_locks
    add primary key (key);

create table jobs
(
    id           bigserial,
    queue        varchar(255) not null,
    payload      text         not null,
    attempts     smallint     not null,
    reserved_at  integer,
    available_at integer      not null,
    created_at   integer      not null
);

alter table jobs
    owner to sail;

create index jobs_queue_index
    on jobs (queue);

alter table jobs
    add primary key (id);

create table job_batches
(
    id             varchar(255) not null,
    name           varchar(255) not null,
    total_jobs     integer      not null,
    pending_jobs   integer      not null,
    failed_jobs    integer      not null,
    failed_job_ids text         not null,
    options        text,
    cancelled_at   integer,
    created_at     integer      not null,
    finished_at    integer
);

alter table job_batches
    owner to sail;

alter table job_batches
    add primary key (id);

create table failed_jobs
(
    id         bigserial,
    uuid       varchar(255)                           not null,
    connection text                                   not null,
    queue      text                                   not null,
    payload    text                                   not null,
    exception  text                                   not null,
    failed_at  timestamp(0) default CURRENT_TIMESTAMP not null
);

alter table failed_jobs
    owner to sail;

alter table failed_jobs
    add primary key (id);

alter table failed_jobs
    add constraint failed_jobs_uuid_unique
        unique (uuid);

create table estados
(
    id         bigserial,
    nombre     varchar(255) not null,
    created_at timestamp(0),
    updated_at timestamp(0),
    deleted_at timestamp(0)
);

alter table estados
    owner to sail;

alter table estados
    add primary key (id);

create table personal_access_tokens
(
    id             bigserial,
    tokenable_type varchar(255) not null,
    tokenable_id   bigint       not null,
    name           varchar(255) not null,
    token          varchar(64)  not null,
    abilities      text,
    last_used_at   timestamp(0),
    expires_at     timestamp(0),
    created_at     timestamp(0),
    updated_at     timestamp(0)
);

alter table personal_access_tokens
    owner to sail;

create index personal_access_tokens_tokenable_type_tokenable_id_index
    on personal_access_tokens (tokenable_type, tokenable_id);

alter table personal_access_tokens
    add primary key (id);

alter table personal_access_tokens
    add constraint personal_access_tokens_token_unique
        unique (token);

create table tipos_usuarios
(
    id           bigserial,
    tipo_usuario varchar(255) not null,
    created_at   timestamp(0),
    updated_at   timestamp(0),
    deleted_at   timestamp(0)
);

alter table tipos_usuarios
    owner to sail;

alter table tipos_usuarios
    add primary key (id);

alter table usuarios
    add constraint usuarios_id_tipo_usuario_foreign
        foreign key (id_tipo_usuario) references tipos_usuarios;

create table personas
(
    id           bigint default nextval('pesonas_id_seq'::regclass) not null,
    nombre       varchar(255)                                       not null,
    apellido_pat varchar(255)                                       not null,
    apellido_mat varchar(255)                                       not null,
    id_usuario   bigint                                             not null,
    created_at   timestamp(0),
    updated_at   timestamp(0),
    deleted_at   timestamp(0)
);

alter table personas
    owner to sail;

alter sequence pesonas_id_seq owned by personas.id;

alter table personas
    add constraint pesonas_pkey
        primary key (id);

alter table personas
    add constraint pesonas_id_usuario_foreign
        foreign key (id_usuario) references usuarios;

create table direcciones
(
    id         bigserial,
    calle      varchar(255)                                 not null,
    municipio  varchar(255)                                 not null,
    "CP"       integer                                      not null,
    int        varchar(255)                                 not null,
    ext        varchar(255) default 'SN'::character varying not null,
    id_estado  bigint                                       not null,
    created_at timestamp(0),
    updated_at timestamp(0),
    deleted_at timestamp(0),
    colonia    varchar(255)                                 not null
);

alter table direcciones
    owner to sail;

alter table direcciones
    add primary key (id);

alter table direcciones
    add constraint direcciones_id_estado_foreign
        foreign key (id_estado) references estados;

create table coordenadas
(
    id         bigserial,
    longitud   varchar(255) not null,
    latitud    varchar(255) not null,
    created_at timestamp(0),
    updated_at timestamp(0),
    deleted_at timestamp(0)
);

alter table coordenadas
    owner to sail;

alter table coordenadas
    add primary key (id);

create table tipos_servicios
(
    id         bigserial,
    servicio   varchar(255) not null,
    estatus    boolean      not null,
    created_at timestamp(0),
    updated_at timestamp(0),
    deleted_at timestamp(0)
);

alter table tipos_servicios
    owner to sail;

alter table tipos_servicios
    add primary key (id);

create table pueblos_magicos
(
    id           bigserial,
    nombre       varchar(255) not null,
    descripcion  varchar(255) not null,
    id_direccion bigint       not null,
    created_at   timestamp(0),
    updated_at   timestamp(0),
    deleted_at   timestamp(0)
);

alter table pueblos_magicos
    owner to sail;

alter table pueblos_magicos
    add primary key (id);

alter table pueblos_magicos
    add constraint pueblos_magicos_id_direccion_foreign
        foreign key (id_direccion) references direcciones;

create table servicios
(
    id               bigserial,
    id_tipo_servicio bigint not null,
    id_direccion     bigint not null,
    id_usuario       bigint not null,
    id_pueblo        bigint not null,
    created_at       timestamp(0),
    updated_at       timestamp(0),
    deleted_at       timestamp(0),
    id_estatus       bigint not null
);

alter table servicios
    owner to sail;

alter table servicios
    add primary key (id);

alter table servicios
    add constraint servicios_id_tipo_servicio_foreign
        foreign key (id_tipo_servicio) references tipos_servicios;

alter table servicios
    add constraint servicios_id_direccion_foreign
        foreign key (id_direccion) references direcciones
            on delete cascade;

alter table servicios
    add constraint servicios_id_usuario_foreign
        foreign key (id_usuario) references usuarios;

alter table servicios
    add constraint servicios_id_pueblo_foreign
        foreign key (id_pueblo) references pueblos_magicos;

create table servicio_detalles
(
    id             bigserial,
    dias_servicio  varchar(255) not null,
    precios        varchar(255) not null,
    titulo         varchar(255) not null,
    descripcion    text         not null,
    id_coordenadas bigint       not null,
    id_servicio    bigint       not null,
    created_at     timestamp(0),
    updated_at     timestamp(0),
    deleted_at     timestamp(0),
    id_horarios    bigint       not null
);

alter table servicio_detalles
    owner to sail;

alter table servicio_detalles
    add primary key (id);

alter table servicio_detalles
    add constraint servicio_detalles_id_coordenadas_foreign
        foreign key (id_coordenadas) references coordenadas
            on delete cascade;

alter table servicio_detalles
    add constraint servicio_detalles_id_servicio_foreign
        foreign key (id_servicio) references servicios
            on delete cascade;

create table festividades
(
    id           bigserial,
    id_direccion bigint not null,
    id_usuario   bigint not null,
    id_pueblo    bigint not null,
    created_at   timestamp(0),
    updated_at   timestamp(0),
    deleted_at   timestamp(0)
);

alter table festividades
    owner to sail;

alter table festividades
    add primary key (id);

alter table festividades
    add constraint festividades_id_direccion_foreign
        foreign key (id_direccion) references direcciones
            on delete cascade;

alter table festividades
    add constraint festividades_id_usuario_foreign
        foreign key (id_usuario) references usuarios
            on delete cascade;

alter table festividades
    add constraint festividades_id_pueblo_foreign
        foreign key (id_pueblo) references pueblos_magicos;

create table festividades_detalles
(
    id             bigserial,
    dias_servicio  varchar(255) not null,
    horarios       varchar(255) not null,
    precios        varchar(255) not null,
    nombre         varchar(255) not null,
    descripcion    varchar(255) not null,
    id_coordenadas bigint       not null,
    id_servicio    bigint       not null,
    created_at     timestamp(0),
    updated_at     timestamp(0),
    deleted_at     timestamp(0)
);

alter table festividades_detalles
    owner to sail;

alter table festividades_detalles
    add primary key (id);

alter table festividades_detalles
    add constraint festividades_detalles_id_coordenadas_foreign
        foreign key (id_coordenadas) references coordenadas
            on delete cascade;

alter table festividades_detalles
    add constraint festividades_detalles_id_servicio_foreign
        foreign key (id_servicio) references servicios
            on delete cascade;

create table ratings
(
    id          bigserial,
    rating      varchar(255) not null,
    comentario  varchar(255) not null,
    id_servicio bigint       not null,
    created_at  timestamp(0),
    updated_at  timestamp(0),
    deleted_at  timestamp(0)
);

alter table ratings
    owner to sail;

alter table ratings
    add primary key (id);

alter table ratings
    add constraint ratings_id_servicio_foreign
        foreign key (id_servicio) references servicios
            on delete cascade;

create table tipos_imagenes
(
    id         bigserial,
    tipo       varchar(255) not null,
    created_at timestamp(0),
    updated_at timestamp(0),
    deleted_at timestamp(0)
);

alter table tipos_imagenes
    owner to sail;

alter table tipos_imagenes
    add primary key (id);

create table imagenes
(
    id             bigserial,
    nombre         varchar(255) not null,
    id_tipo_imagen bigint       not null,
    created_at     timestamp(0),
    updated_at     timestamp(0),
    deleted_at     timestamp(0)
);

alter table imagenes
    owner to sail;

alter table imagenes
    add primary key (id);

alter table imagenes
    add constraint imagenes_id_tipo_imagen_foreign
        foreign key (id_tipo_imagen) references tipos_imagenes;

create table servicios_imagenes
(
    id          bigserial,
    id_servicio bigint not null,
    id_imagen   bigint not null,
    created_at  timestamp(0),
    updated_at  timestamp(0),
    deleted_at  timestamp(0)
);

alter table servicios_imagenes
    owner to sail;

alter table servicios_imagenes
    add primary key (id);

alter table servicios_imagenes
    add constraint servicios_imagenes_id_servicio_foreign
        foreign key (id_servicio) references servicios
            on delete cascade;

alter table servicios_imagenes
    add constraint servicios_imagenes_id_imagen_foreign
        foreign key (id_imagen) references imagenes
            on delete cascade;

create table festividades_imagenes
(
    id            bigserial,
    id_festividad bigint not null,
    id_imagen     bigint not null,
    created_at    timestamp(0),
    updated_at    timestamp(0),
    deleted_at    timestamp(0)
);

alter table festividades_imagenes
    owner to sail;

alter table festividades_imagenes
    add primary key (id);

alter table festividades_imagenes
    add constraint festividades_imagenes_id_festividad_foreign
        foreign key (id_festividad) references festividades
            on delete cascade;

alter table festividades_imagenes
    add constraint festividades_imagenes_id_imagen_foreign
        foreign key (id_imagen) references imagenes
            on delete cascade;

create table pueblos_magicos_imagenes
(
    id               bigserial,
    id_pueblo_magico bigint not null,
    id_imagen        bigint not null,
    created_at       timestamp(0),
    updated_at       timestamp(0),
    deleted_at       timestamp(0)
);

alter table pueblos_magicos_imagenes
    owner to sail;

alter table pueblos_magicos_imagenes
    add primary key (id);

alter table pueblos_magicos_imagenes
    add constraint pueblos_magicos_imagenes_id_pueblo_magico_foreign
        foreign key (id_pueblo_magico) references pueblos_magicos
            on delete cascade;

alter table pueblos_magicos_imagenes
    add constraint pueblos_magicos_imagenes_id_imagen_foreign
        foreign key (id_imagen) references imagenes
            on delete cascade;

create table pueblos_solicitudes
(
    id               bigserial,
    id_servicio      bigint not null,
    id_pueblo_magico bigint not null,
    id_tipo_servicio bigint not null,
    created_at       timestamp(0),
    updated_at       timestamp(0),
    deleted_at       timestamp(0)
);

alter table pueblos_solicitudes
    owner to sail;

alter table pueblos_solicitudes
    add primary key (id);

alter table pueblos_solicitudes
    add constraint pueblos_solicitudes_id_servicio_foreign
        foreign key (id_servicio) references servicios
            on delete cascade;

alter table pueblos_solicitudes
    add constraint pueblos_solicitudes_id_pueblo_magico_foreign
        foreign key (id_pueblo_magico) references pueblos_magicos;

alter table pueblos_solicitudes
    add constraint pueblos_solicitudes_id_tipo_servicio_foreign
        foreign key (id_tipo_servicio) references tipos_servicios;

create table bitacora
(
    id                   bigserial,
    movimiento           varchar(255) not null,
    tabla_afectada       varchar(255) not null,
    id_registro_afectado integer      not null,
    id_usuario           bigint       not null,
    created_at           timestamp(0),
    updated_at           timestamp(0),
    deleted_at           timestamp(0)
);

alter table bitacora
    owner to sail;

alter table bitacora
    add primary key (id);

alter table bitacora
    add constraint bitacora_id_usuario_foreign
        foreign key (id_usuario) references usuarios;

create table horarios
(
    id             bigserial,
    horario_inicio time(0) not null,
    horario_fin    time(0) not null,
    created_at     timestamp(0),
    updated_at     timestamp(0),
    deleted_at     timestamp(0)
);

alter table horarios
    owner to sail;

alter table horarios
    add primary key (id);

alter table servicio_detalles
    add constraint servicio_detalles_id_horarios_foreign
        foreign key (id_horarios) references horarios
            on delete cascade;

create table estatus
(
    id         bigserial,
    estado     varchar(255) not null,
    created_at timestamp(0),
    updated_at timestamp(0),
    deleted_at timestamp(0)
);

alter table estatus
    owner to sail;

alter table estatus
    add primary key (id);

alter table servicios
    add constraint servicios_id_estatus_foreign
        foreign key (id_estatus) references estatus;

create table observaciones
(
    id          bigserial,
    id_servicio bigint not null,
    id_usuario  bigint not null,
    id_estatus  bigint not null,
    observacion text   not null,
    created_at  timestamp(0),
    updated_at  timestamp(0)
);

alter table observaciones
    owner to sail;

alter table observaciones
    add primary key (id);


