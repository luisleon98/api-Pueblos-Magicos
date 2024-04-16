create table tipos_usuarios
(
    id           bigserial
        primary key,
    tipo_usuario varchar(255) not null,
    created_at   timestamp(0),
    updated_at   timestamp(0),
    deleted_at   timestamp(0)
);

alter table tipos_usuarios
    owner to sail;

INSERT INTO public.tipos_usuarios (id, tipo_usuario, created_at, updated_at, deleted_at) VALUES (1, 'Admin_Systema', '2024-04-11 17:17:05', '2024-04-11 17:17:05', null);
INSERT INTO public.tipos_usuarios (id, tipo_usuario, created_at, updated_at, deleted_at) VALUES (2, 'Director_Pueblos_Magicos', '2024-04-11 17:17:05', '2024-04-11 17:17:05', null);
INSERT INTO public.tipos_usuarios (id, tipo_usuario, created_at, updated_at, deleted_at) VALUES (3, 'Hotelero', '2024-04-11 17:17:05', '2024-04-11 17:17:05', null);
INSERT INTO public.tipos_usuarios (id, tipo_usuario, created_at, updated_at, deleted_at) VALUES (4, 'Restaurantero', '2024-04-11 17:17:05', '2024-04-11 17:17:05', null);
INSERT INTO public.tipos_usuarios (id, tipo_usuario, created_at, updated_at, deleted_at) VALUES (5, 'Pueblo_Magico', '2024-04-11 17:17:05', '2024-04-11 17:17:05', null);
INSERT INTO public.tipos_usuarios (id, tipo_usuario, created_at, updated_at, deleted_at) VALUES (6, 'Turista', '2024-04-11 17:17:05', '2024-04-11 17:17:05', null);
