create table direcciones
(
    id         bigserial
        primary key,
    calle      varchar(255)                                 not null,
    municipio  varchar(255)                                 not null,
    "CP"       integer                                      not null,
    int        varchar(255)                                 not null,
    ext        varchar(255) default 'SN'::character varying not null,
    id_estado  bigint                                       not null
        constraint direcciones_id_estado_foreign
            references estados,
    created_at timestamp(0),
    updated_at timestamp(0),
    deleted_at timestamp(0),
    colonia    varchar(255)                                 not null
);

alter table direcciones
    owner to sail;

INSERT INTO public.direcciones (id, calle, municipio, "CP", int, ext, id_estado, created_at, updated_at, deleted_at, colonia) VALUES (1, 'Av. 4 Ote. 1', 'Residencial el Refugio de San Miguel', 72764, 'SN', 'SN', 21, '2024-04-11 17:17:05', '2024-04-11 17:17:05', null, 'Cholula de Rivadavia');
INSERT INTO public.direcciones (id, calle, municipio, "CP", int, ext, id_estado, created_at, updated_at, deleted_at, colonia) VALUES (2, 'Libertad 416', 'Centro', 74200, 'SN', 'SN', 21, '2024-04-11 17:17:05', '2024-04-11 17:17:05', null, 'Atlixco');
INSERT INTO public.direcciones (id, calle, municipio, "CP", int, ext, id_estado, created_at, updated_at, deleted_at, colonia) VALUES (3, 'Calle 3 Ote. 2', 'Centro', 73640, 'SN', 'SN', 21, '2024-04-11 17:17:05', '2024-04-11 17:17:05', null, 'Cdad. de Tetela de Ocampo');
INSERT INTO public.direcciones (id, calle, municipio, "CP", int, ext, id_estado, created_at, updated_at, deleted_at, colonia) VALUES (4, 'J. Ma. Morelos 12', 'Centro', 73310, 'SN', 'SN', 21, '2024-04-11 17:17:05', '2024-04-11 17:17:05', null, 'Zacatlán');
INSERT INTO public.direcciones (id, calle, municipio, "CP", int, ext, id_estado, created_at, updated_at, deleted_at, colonia) VALUES (5, 'Allende 102', 'Col Centro', 73080, 'SN', 'SN', 21, '2024-04-11 17:17:05', '2024-04-11 17:17:05', null, 'Xicotepec de Juárez');
INSERT INTO public.direcciones (id, calle, municipio, "CP", int, ext, id_estado, created_at, updated_at, deleted_at, colonia) VALUES (6, 'Av. Revolución 43', 'Centro', 73900, 'SN', 'SN', 21, '2024-04-11 17:17:05', '2024-04-11 17:17:05', null, 'Cdad. de Tlatlauquitepec');
INSERT INTO public.direcciones (id, calle, municipio, "CP", int, ext, id_estado, created_at, updated_at, deleted_at, colonia) VALUES (7, 'Pahuatlán', 'Pahuatlán', 73100, 'SN', 'SN', 21, '2024-04-11 17:17:05', '2024-04-11 17:17:05', null, 'Pahuatlán');
INSERT INTO public.direcciones (id, calle, municipio, "CP", int, ext, id_estado, created_at, updated_at, deleted_at, colonia) VALUES (8, 'Centro', 'Centro', 73170, 'SN', 'SN', 21, '2024-04-11 17:17:06', '2024-04-11 17:17:06', null, 'Huauchinango');
INSERT INTO public.direcciones (id, calle, municipio, "CP", int, ext, id_estado, created_at, updated_at, deleted_at, colonia) VALUES (9, 'Chignahuapan', 'Chignahuapan', 73300, 'SN', 'SN', 21, '2024-04-11 17:17:06', '2024-04-11 17:17:06', null, 'Chignahuapan');
INSERT INTO public.direcciones (id, calle, municipio, "CP", int, ext, id_estado, created_at, updated_at, deleted_at, colonia) VALUES (10, 'Centenario 3-9', 'Centro', 73560, 'SN', 'SN', 21, '2024-04-11 17:17:06', '2024-04-11 17:17:06', null, 'Cdad. de Cuetzalan');
INSERT INTO public.direcciones (id, calle, municipio, "CP", int, ext, id_estado, created_at, updated_at, deleted_at, colonia) VALUES (11, 'av Ticoman', 'GAM', 7330, '1133', '401', 21, '2024-04-11 18:04:18', '2024-04-11 18:04:18', null, 'Santa Maria Ticoman');
INSERT INTO public.direcciones (id, calle, municipio, "CP", int, ext, id_estado, created_at, updated_at, deleted_at, colonia) VALUES (12, 'av Ticoman', 'GAM', 7330, '1133', '401', 21, '2024-04-11 18:04:23', '2024-04-11 18:04:23', null, 'Santa Maria Ticoman');
INSERT INTO public.direcciones (id, calle, municipio, "CP", int, ext, id_estado, created_at, updated_at, deleted_at, colonia) VALUES (13, 'av Ticoman', 'GAM', 7330, '1133', '401', 21, '2024-04-11 18:04:27', '2024-04-11 18:04:27', null, 'Santa Maria Ticoman');
INSERT INTO public.direcciones (id, calle, municipio, "CP", int, ext, id_estado, created_at, updated_at, deleted_at, colonia) VALUES (14, 'av Ticoman', 'GAM', 7330, '1133', '401', 21, '2024-04-11 18:04:30', '2024-04-11 18:04:30', null, 'Santa Maria Ticoman');
INSERT INTO public.direcciones (id, calle, municipio, "CP", int, ext, id_estado, created_at, updated_at, deleted_at, colonia) VALUES (15, 'av Ticoman', 'GAM', 7330, '1133', '401', 21, '2024-04-11 18:04:33', '2024-04-11 18:04:33', null, 'Santa Maria Ticoman');
INSERT INTO public.direcciones (id, calle, municipio, "CP", int, ext, id_estado, created_at, updated_at, deleted_at, colonia) VALUES (16, 'av Ticoman', 'GAM', 7330, '1133', '401', 21, '2024-04-11 18:04:37', '2024-04-11 18:04:37', null, 'Santa Maria Ticoman');
