create table tipos_imagenes
(
    id         bigserial
        primary key,
    tipo       varchar(255) not null,
    created_at timestamp(0),
    updated_at timestamp(0),
    deleted_at timestamp(0)
);

alter table tipos_imagenes
    owner to sail;

INSERT INTO public.tipos_imagenes (id, tipo, created_at, updated_at, deleted_at) VALUES (1, 'back', '2024-04-11 17:17:06', '2024-04-11 17:17:06', null);
INSERT INTO public.tipos_imagenes (id, tipo, created_at, updated_at, deleted_at) VALUES (2, 'galeria', '2024-04-11 17:17:06', '2024-04-11 17:17:06', null);
