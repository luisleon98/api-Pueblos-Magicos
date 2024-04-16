create table estatus
(
    id         bigserial
        primary key,
    estado     varchar(255) not null,
    created_at timestamp(0),
    updated_at timestamp(0),
    deleted_at timestamp(0)
);

alter table estatus
    owner to sail;

INSERT INTO public.estatus (id, estado, created_at, updated_at, deleted_at) VALUES (1, 'En Validación', '2024-04-11 17:17:06', '2024-04-11 17:17:06', null);
INSERT INTO public.estatus (id, estado, created_at, updated_at, deleted_at) VALUES (2, 'Aceptado', '2024-04-11 17:17:06', '2024-04-11 17:17:06', null);
INSERT INTO public.estatus (id, estado, created_at, updated_at, deleted_at) VALUES (3, 'Con Observaciones', '2024-04-11 17:17:06', '2024-04-11 17:17:06', null);
INSERT INTO public.estatus (id, estado, created_at, updated_at, deleted_at) VALUES (4, 'Inactivo', '2024-04-11 17:17:06', '2024-04-11 17:17:06', null);
INSERT INTO public.estatus (id, estado, created_at, updated_at, deleted_at) VALUES (5, 'En Revisión', '2024-04-11 17:17:06', '2024-04-11 17:17:06', null);
INSERT INTO public.estatus (id, estado, created_at, updated_at, deleted_at) VALUES (6, 'Atendidas', '2024-04-11 17:17:06', '2024-04-11 17:17:06', null);
