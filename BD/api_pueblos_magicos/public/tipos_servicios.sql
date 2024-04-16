create table tipos_servicios
(
    id         bigserial
        primary key,
    servicio   varchar(255) not null,
    estatus    boolean      not null,
    created_at timestamp(0),
    updated_at timestamp(0),
    deleted_at timestamp(0)
);

alter table tipos_servicios
    owner to sail;

INSERT INTO public.tipos_servicios (id, servicio, estatus, created_at, updated_at, deleted_at) VALUES (1, 'Hospedaje', true, '2024-04-11 17:17:05', '2024-04-11 17:17:05', null);
INSERT INTO public.tipos_servicios (id, servicio, estatus, created_at, updated_at, deleted_at) VALUES (2, 'Gastronomia', true, '2024-04-11 17:17:05', '2024-04-11 17:17:05', null);
INSERT INTO public.tipos_servicios (id, servicio, estatus, created_at, updated_at, deleted_at) VALUES (3, 'Tours', true, '2024-04-11 17:17:05', '2024-04-11 17:17:05', null);
INSERT INTO public.tipos_servicios (id, servicio, estatus, created_at, updated_at, deleted_at) VALUES (4, 'Sitios', true, '2024-04-11 17:17:05', '2024-04-11 17:17:05', null);
INSERT INTO public.tipos_servicios (id, servicio, estatus, created_at, updated_at, deleted_at) VALUES (5, 'Festividades', true, '2024-04-11 17:17:05', '2024-04-11 17:17:05', null);
INSERT INTO public.tipos_servicios (id, servicio, estatus, created_at, updated_at, deleted_at) VALUES (6, 'Cerca de ustedes', true, '2024-04-11 17:17:05', '2024-04-11 17:17:05', null);
