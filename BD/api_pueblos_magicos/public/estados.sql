create table estados
(
    id         bigserial
        primary key,
    nombre     varchar(255) not null,
    created_at timestamp(0),
    updated_at timestamp(0),
    deleted_at timestamp(0)
);

alter table estados
    owner to sail;

INSERT INTO public.estados (id, nombre, created_at, updated_at, deleted_at) VALUES (1, 'Aguascalientes', '2024-04-11 17:17:05', '2024-04-11 17:17:05', null);
INSERT INTO public.estados (id, nombre, created_at, updated_at, deleted_at) VALUES (2, 'Baja California', '2024-04-11 17:17:05', '2024-04-11 17:17:05', null);
INSERT INTO public.estados (id, nombre, created_at, updated_at, deleted_at) VALUES (3, 'Baja California Sur', '2024-04-11 17:17:05', '2024-04-11 17:17:05', null);
INSERT INTO public.estados (id, nombre, created_at, updated_at, deleted_at) VALUES (4, 'Campeche', '2024-04-11 17:17:05', '2024-04-11 17:17:05', null);
INSERT INTO public.estados (id, nombre, created_at, updated_at, deleted_at) VALUES (5, 'Chiapas', '2024-04-11 17:17:05', '2024-04-11 17:17:05', null);
INSERT INTO public.estados (id, nombre, created_at, updated_at, deleted_at) VALUES (6, 'Chihuahua', '2024-04-11 17:17:05', '2024-04-11 17:17:05', null);
INSERT INTO public.estados (id, nombre, created_at, updated_at, deleted_at) VALUES (7, 'Coahuila', '2024-04-11 17:17:05', '2024-04-11 17:17:05', null);
INSERT INTO public.estados (id, nombre, created_at, updated_at, deleted_at) VALUES (8, 'Colima', '2024-04-11 17:17:05', '2024-04-11 17:17:05', null);
INSERT INTO public.estados (id, nombre, created_at, updated_at, deleted_at) VALUES (9, 'Ciudad de México', '2024-04-11 17:17:05', '2024-04-11 17:17:05', null);
INSERT INTO public.estados (id, nombre, created_at, updated_at, deleted_at) VALUES (10, 'Durango', '2024-04-11 17:17:05', '2024-04-11 17:17:05', null);
INSERT INTO public.estados (id, nombre, created_at, updated_at, deleted_at) VALUES (11, 'Guanajuato', '2024-04-11 17:17:05', '2024-04-11 17:17:05', null);
INSERT INTO public.estados (id, nombre, created_at, updated_at, deleted_at) VALUES (12, 'Guerrero', '2024-04-11 17:17:05', '2024-04-11 17:17:05', null);
INSERT INTO public.estados (id, nombre, created_at, updated_at, deleted_at) VALUES (13, 'Hidalgo', '2024-04-11 17:17:05', '2024-04-11 17:17:05', null);
INSERT INTO public.estados (id, nombre, created_at, updated_at, deleted_at) VALUES (14, 'Jalisco', '2024-04-11 17:17:05', '2024-04-11 17:17:05', null);
INSERT INTO public.estados (id, nombre, created_at, updated_at, deleted_at) VALUES (15, 'Estado de México', '2024-04-11 17:17:05', '2024-04-11 17:17:05', null);
INSERT INTO public.estados (id, nombre, created_at, updated_at, deleted_at) VALUES (16, 'Michoacán', '2024-04-11 17:17:05', '2024-04-11 17:17:05', null);
INSERT INTO public.estados (id, nombre, created_at, updated_at, deleted_at) VALUES (17, 'Morelos', '2024-04-11 17:17:05', '2024-04-11 17:17:05', null);
INSERT INTO public.estados (id, nombre, created_at, updated_at, deleted_at) VALUES (18, 'Nayarit', '2024-04-11 17:17:05', '2024-04-11 17:17:05', null);
INSERT INTO public.estados (id, nombre, created_at, updated_at, deleted_at) VALUES (19, 'Nuevo León', '2024-04-11 17:17:05', '2024-04-11 17:17:05', null);
INSERT INTO public.estados (id, nombre, created_at, updated_at, deleted_at) VALUES (20, 'Oaxaca', '2024-04-11 17:17:05', '2024-04-11 17:17:05', null);
INSERT INTO public.estados (id, nombre, created_at, updated_at, deleted_at) VALUES (21, 'Puebla', '2024-04-11 17:17:05', '2024-04-11 17:17:05', null);
INSERT INTO public.estados (id, nombre, created_at, updated_at, deleted_at) VALUES (22, 'Querétaro', '2024-04-11 17:17:05', '2024-04-11 17:17:05', null);
INSERT INTO public.estados (id, nombre, created_at, updated_at, deleted_at) VALUES (23, 'Quintana Roo', '2024-04-11 17:17:05', '2024-04-11 17:17:05', null);
INSERT INTO public.estados (id, nombre, created_at, updated_at, deleted_at) VALUES (24, 'San Luis Potosí', '2024-04-11 17:17:05', '2024-04-11 17:17:05', null);
INSERT INTO public.estados (id, nombre, created_at, updated_at, deleted_at) VALUES (25, 'Sinaloa', '2024-04-11 17:17:05', '2024-04-11 17:17:05', null);
INSERT INTO public.estados (id, nombre, created_at, updated_at, deleted_at) VALUES (26, 'Sonora', '2024-04-11 17:17:05', '2024-04-11 17:17:05', null);
INSERT INTO public.estados (id, nombre, created_at, updated_at, deleted_at) VALUES (27, 'Tabasco', '2024-04-11 17:17:05', '2024-04-11 17:17:05', null);
INSERT INTO public.estados (id, nombre, created_at, updated_at, deleted_at) VALUES (28, 'Tamaulipas', '2024-04-11 17:17:05', '2024-04-11 17:17:05', null);
INSERT INTO public.estados (id, nombre, created_at, updated_at, deleted_at) VALUES (29, 'Tlaxcala', '2024-04-11 17:17:05', '2024-04-11 17:17:05', null);
INSERT INTO public.estados (id, nombre, created_at, updated_at, deleted_at) VALUES (30, 'Veracruz', '2024-04-11 17:17:05', '2024-04-11 17:17:05', null);
INSERT INTO public.estados (id, nombre, created_at, updated_at, deleted_at) VALUES (31, 'Yucatán', '2024-04-11 17:17:05', '2024-04-11 17:17:05', null);
INSERT INTO public.estados (id, nombre, created_at, updated_at, deleted_at) VALUES (32, 'Zacatecas', '2024-04-11 17:17:05', '2024-04-11 17:17:05', null);
