create table pueblos_magicos
(
    id           bigserial
        primary key,
    nombre       varchar(255) not null,
    descripcion  varchar(255) not null,
    id_direccion bigint       not null
        constraint pueblos_magicos_id_direccion_foreign
            references direcciones,
    created_at   timestamp(0),
    updated_at   timestamp(0),
    deleted_at   timestamp(0)
);

alter table pueblos_magicos
    owner to sail;

INSERT INTO public.pueblos_magicos (id, nombre, descripcion, id_direccion, created_at, updated_at, deleted_at) VALUES (1, 'Cholula', '', 1, '2024-04-11 17:17:06', '2024-04-11 17:17:06', null);
INSERT INTO public.pueblos_magicos (id, nombre, descripcion, id_direccion, created_at, updated_at, deleted_at) VALUES (2, 'Atlixco', '', 2, '2024-04-11 17:17:06', '2024-04-11 17:17:06', null);
INSERT INTO public.pueblos_magicos (id, nombre, descripcion, id_direccion, created_at, updated_at, deleted_at) VALUES (3, 'Tetela de Ocampo', '', 3, '2024-04-11 17:17:06', '2024-04-11 17:17:06', null);
INSERT INTO public.pueblos_magicos (id, nombre, descripcion, id_direccion, created_at, updated_at, deleted_at) VALUES (4, 'Zacatlán', '', 4, '2024-04-11 17:17:06', '2024-04-11 17:17:06', null);
INSERT INTO public.pueblos_magicos (id, nombre, descripcion, id_direccion, created_at, updated_at, deleted_at) VALUES (5, 'Xicotepec', '', 5, '2024-04-11 17:17:06', '2024-04-11 17:17:06', null);
INSERT INTO public.pueblos_magicos (id, nombre, descripcion, id_direccion, created_at, updated_at, deleted_at) VALUES (6, 'Tlatlauquitepec', '', 6, '2024-04-11 17:17:06', '2024-04-11 17:17:06', null);
INSERT INTO public.pueblos_magicos (id, nombre, descripcion, id_direccion, created_at, updated_at, deleted_at) VALUES (7, 'Pahuatlán', '', 7, '2024-04-11 17:17:06', '2024-04-11 17:17:06', null);
INSERT INTO public.pueblos_magicos (id, nombre, descripcion, id_direccion, created_at, updated_at, deleted_at) VALUES (8, 'Huachinango', '', 8, '2024-04-11 17:17:06', '2024-04-11 17:17:06', null);
INSERT INTO public.pueblos_magicos (id, nombre, descripcion, id_direccion, created_at, updated_at, deleted_at) VALUES (9, 'Chignahuapan', '', 9, '2024-04-11 17:17:06', '2024-04-11 17:17:06', null);
INSERT INTO public.pueblos_magicos (id, nombre, descripcion, id_direccion, created_at, updated_at, deleted_at) VALUES (10, 'Cuetzalan', '', 10, '2024-04-11 17:17:06', '2024-04-11 17:17:06', null);
