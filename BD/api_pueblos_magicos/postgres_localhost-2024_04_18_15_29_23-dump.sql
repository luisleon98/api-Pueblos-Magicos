--
-- PostgreSQL database dump
--

-- Dumped from database version 15.6 (Debian 15.6-1.pgdg120+2)
-- Dumped by pg_dump version 16.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

CREATE SCHEMA IF NOT EXISTS api_pueblos_magicos;
DROP DATABASE IF EXISTS api_pueblos_magicos;
--
-- Name: api_pueblos_magicos; Type: DATABASE; Schema: -; Owner: sail
--

CREATE DATABASE api_pueblos_magicos WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE api_pueblos_magicos OWNER TO sail;

\connect api_pueblos_magicos

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: bitacora; Type: TABLE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE TABLE api_pueblos_magicos.bitacora (
    id bigint NOT NULL,
    movimiento character varying(255) NOT NULL,
    tabla_afectada character varying(255) NOT NULL,
    id_registro_afectado integer NOT NULL,
    id_usuario bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE api_pueblos_magicos.bitacora OWNER TO sail;

--
-- Name: bitacora_id_seq; Type: SEQUENCE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE SEQUENCE api_pueblos_magicos.bitacora_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE api_pueblos_magicos.bitacora_id_seq OWNER TO sail;

--
-- Name: bitacora_id_seq; Type: SEQUENCE OWNED BY; Schema: api_pueblos_magicos; Owner: sail
--

ALTER SEQUENCE api_pueblos_magicos.bitacora_id_seq OWNED BY api_pueblos_magicos.bitacora.id;


--
-- Name: cache; Type: TABLE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE TABLE api_pueblos_magicos.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE api_pueblos_magicos.cache OWNER TO sail;

--
-- Name: cache_locks; Type: TABLE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE TABLE api_pueblos_magicos.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE api_pueblos_magicos.cache_locks OWNER TO sail;

--
-- Name: coordenadas; Type: TABLE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE TABLE api_pueblos_magicos.coordenadas (
    id bigint NOT NULL,
    longitud character varying(255) NOT NULL,
    latitud character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE api_pueblos_magicos.coordenadas OWNER TO sail;

--
-- Name: coordenadas_id_seq; Type: SEQUENCE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE SEQUENCE api_pueblos_magicos.coordenadas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE api_pueblos_magicos.coordenadas_id_seq OWNER TO sail;

--
-- Name: coordenadas_id_seq; Type: SEQUENCE OWNED BY; Schema: api_pueblos_magicos; Owner: sail
--

ALTER SEQUENCE api_pueblos_magicos.coordenadas_id_seq OWNED BY api_pueblos_magicos.coordenadas.id;


--
-- Name: direcciones; Type: TABLE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE TABLE api_pueblos_magicos.direcciones (
    id bigint NOT NULL,
    calle character varying(255) NOT NULL,
    municipio character varying(255) NOT NULL,
    "CP" integer NOT NULL,
    "int" character varying(255) NOT NULL,
    ext character varying(255) DEFAULT 'SN'::character varying NOT NULL,
    id_estado bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    colonia character varying(255) NOT NULL
);


ALTER TABLE api_pueblos_magicos.direcciones OWNER TO sail;

--
-- Name: direcciones_id_seq; Type: SEQUENCE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE SEQUENCE api_pueblos_magicos.direcciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE api_pueblos_magicos.direcciones_id_seq OWNER TO sail;

--
-- Name: direcciones_id_seq; Type: SEQUENCE OWNED BY; Schema: api_pueblos_magicos; Owner: sail
--

ALTER SEQUENCE api_pueblos_magicos.direcciones_id_seq OWNED BY api_pueblos_magicos.direcciones.id;


--
-- Name: estados; Type: TABLE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE TABLE api_pueblos_magicos.estados (
    id bigint NOT NULL,
    nombre character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE api_pueblos_magicos.estados OWNER TO sail;

--
-- Name: estados_id_seq; Type: SEQUENCE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE SEQUENCE api_pueblos_magicos.estados_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE api_pueblos_magicos.estados_id_seq OWNER TO sail;

--
-- Name: estados_id_seq; Type: SEQUENCE OWNED BY; Schema: api_pueblos_magicos; Owner: sail
--

ALTER SEQUENCE api_pueblos_magicos.estados_id_seq OWNED BY api_pueblos_magicos.estados.id;


--
-- Name: estatus; Type: TABLE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE TABLE api_pueblos_magicos.estatus (
    id bigint NOT NULL,
    estado character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE api_pueblos_magicos.estatus OWNER TO sail;

--
-- Name: estatus_id_seq; Type: SEQUENCE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE SEQUENCE api_pueblos_magicos.estatus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE api_pueblos_magicos.estatus_id_seq OWNER TO sail;

--
-- Name: estatus_id_seq; Type: SEQUENCE OWNED BY; Schema: api_pueblos_magicos; Owner: sail
--

ALTER SEQUENCE api_pueblos_magicos.estatus_id_seq OWNED BY api_pueblos_magicos.estatus.id;


--
-- Name: failed_jobs; Type: TABLE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE TABLE api_pueblos_magicos.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE api_pueblos_magicos.failed_jobs OWNER TO sail;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE SEQUENCE api_pueblos_magicos.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE api_pueblos_magicos.failed_jobs_id_seq OWNER TO sail;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: api_pueblos_magicos; Owner: sail
--

ALTER SEQUENCE api_pueblos_magicos.failed_jobs_id_seq OWNED BY api_pueblos_magicos.failed_jobs.id;


--
-- Name: festividades; Type: TABLE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE TABLE api_pueblos_magicos.festividades (
    id bigint NOT NULL,
    id_direccion bigint NOT NULL,
    id_usuario bigint NOT NULL,
    id_pueblo bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE api_pueblos_magicos.festividades OWNER TO sail;

--
-- Name: festividades_detalles; Type: TABLE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE TABLE api_pueblos_magicos.festividades_detalles (
    id bigint NOT NULL,
    dias_servicio character varying(255) NOT NULL,
    horarios character varying(255) NOT NULL,
    precios character varying(255) NOT NULL,
    nombre character varying(255) NOT NULL,
    descripcion character varying(255) NOT NULL,
    id_coordenadas bigint NOT NULL,
    id_servicio bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE api_pueblos_magicos.festividades_detalles OWNER TO sail;

--
-- Name: festividades_detalles_id_seq; Type: SEQUENCE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE SEQUENCE api_pueblos_magicos.festividades_detalles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE api_pueblos_magicos.festividades_detalles_id_seq OWNER TO sail;

--
-- Name: festividades_detalles_id_seq; Type: SEQUENCE OWNED BY; Schema: api_pueblos_magicos; Owner: sail
--

ALTER SEQUENCE api_pueblos_magicos.festividades_detalles_id_seq OWNED BY api_pueblos_magicos.festividades_detalles.id;


--
-- Name: festividades_id_seq; Type: SEQUENCE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE SEQUENCE api_pueblos_magicos.festividades_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE api_pueblos_magicos.festividades_id_seq OWNER TO sail;

--
-- Name: festividades_id_seq; Type: SEQUENCE OWNED BY; Schema: api_pueblos_magicos; Owner: sail
--

ALTER SEQUENCE api_pueblos_magicos.festividades_id_seq OWNED BY api_pueblos_magicos.festividades.id;


--
-- Name: festividades_imagenes; Type: TABLE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE TABLE api_pueblos_magicos.festividades_imagenes (
    id bigint NOT NULL,
    id_festividad bigint NOT NULL,
    id_imagen bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE api_pueblos_magicos.festividades_imagenes OWNER TO sail;

--
-- Name: festividades_imagenes_id_seq; Type: SEQUENCE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE SEQUENCE api_pueblos_magicos.festividades_imagenes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE api_pueblos_magicos.festividades_imagenes_id_seq OWNER TO sail;

--
-- Name: festividades_imagenes_id_seq; Type: SEQUENCE OWNED BY; Schema: api_pueblos_magicos; Owner: sail
--

ALTER SEQUENCE api_pueblos_magicos.festividades_imagenes_id_seq OWNED BY api_pueblos_magicos.festividades_imagenes.id;


--
-- Name: horarios; Type: TABLE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE TABLE api_pueblos_magicos.horarios (
    id bigint NOT NULL,
    horario_inicio time(0) without time zone NOT NULL,
    horario_fin time(0) without time zone NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE api_pueblos_magicos.horarios OWNER TO sail;

--
-- Name: horarios_id_seq; Type: SEQUENCE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE SEQUENCE api_pueblos_magicos.horarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE api_pueblos_magicos.horarios_id_seq OWNER TO sail;

--
-- Name: horarios_id_seq; Type: SEQUENCE OWNED BY; Schema: api_pueblos_magicos; Owner: sail
--

ALTER SEQUENCE api_pueblos_magicos.horarios_id_seq OWNED BY api_pueblos_magicos.horarios.id;


--
-- Name: imagenes; Type: TABLE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE TABLE api_pueblos_magicos.imagenes (
    id bigint NOT NULL,
    nombre character varying(255) NOT NULL,
    id_tipo_imagen bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE api_pueblos_magicos.imagenes OWNER TO sail;

--
-- Name: imagenes_id_seq; Type: SEQUENCE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE SEQUENCE api_pueblos_magicos.imagenes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE api_pueblos_magicos.imagenes_id_seq OWNER TO sail;

--
-- Name: imagenes_id_seq; Type: SEQUENCE OWNED BY; Schema: api_pueblos_magicos; Owner: sail
--

ALTER SEQUENCE api_pueblos_magicos.imagenes_id_seq OWNED BY api_pueblos_magicos.imagenes.id;


--
-- Name: job_batches; Type: TABLE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE TABLE api_pueblos_magicos.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);


ALTER TABLE api_pueblos_magicos.job_batches OWNER TO sail;

--
-- Name: jobs; Type: TABLE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE TABLE api_pueblos_magicos.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE api_pueblos_magicos.jobs OWNER TO sail;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE SEQUENCE api_pueblos_magicos.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE api_pueblos_magicos.jobs_id_seq OWNER TO sail;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: api_pueblos_magicos; Owner: sail
--

ALTER SEQUENCE api_pueblos_magicos.jobs_id_seq OWNED BY api_pueblos_magicos.jobs.id;


--
-- Name: migrations; Type: TABLE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE TABLE api_pueblos_magicos.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE api_pueblos_magicos.migrations OWNER TO sail;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE SEQUENCE api_pueblos_magicos.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE api_pueblos_magicos.migrations_id_seq OWNER TO sail;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: api_pueblos_magicos; Owner: sail
--

ALTER SEQUENCE api_pueblos_magicos.migrations_id_seq OWNED BY api_pueblos_magicos.migrations.id;


--
-- Name: observaciones; Type: TABLE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE TABLE api_pueblos_magicos.observaciones (
    id bigint NOT NULL,
    id_servicio bigint NOT NULL,
    id_usuario bigint NOT NULL,
    id_estatus bigint NOT NULL,
    observacion text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE api_pueblos_magicos.observaciones OWNER TO sail;

--
-- Name: observaciones_id_seq; Type: SEQUENCE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE SEQUENCE api_pueblos_magicos.observaciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE api_pueblos_magicos.observaciones_id_seq OWNER TO sail;

--
-- Name: observaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: api_pueblos_magicos; Owner: sail
--

ALTER SEQUENCE api_pueblos_magicos.observaciones_id_seq OWNED BY api_pueblos_magicos.observaciones.id;


--
-- Name: password_reset_tokens; Type: TABLE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE TABLE api_pueblos_magicos.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE api_pueblos_magicos.password_reset_tokens OWNER TO sail;

--
-- Name: personal_access_tokens; Type: TABLE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE TABLE api_pueblos_magicos.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE api_pueblos_magicos.personal_access_tokens OWNER TO sail;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE SEQUENCE api_pueblos_magicos.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE api_pueblos_magicos.personal_access_tokens_id_seq OWNER TO sail;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: api_pueblos_magicos; Owner: sail
--

ALTER SEQUENCE api_pueblos_magicos.personal_access_tokens_id_seq OWNED BY api_pueblos_magicos.personal_access_tokens.id;


--
-- Name: personas; Type: TABLE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE TABLE api_pueblos_magicos.personas (
    id bigint NOT NULL,
    nombre character varying(255) NOT NULL,
    apellido_pat character varying(255) NOT NULL,
    apellido_mat character varying(255) NOT NULL,
    id_usuario bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE api_pueblos_magicos.personas OWNER TO sail;

--
-- Name: pesonas_id_seq; Type: SEQUENCE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE SEQUENCE api_pueblos_magicos.pesonas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE api_pueblos_magicos.pesonas_id_seq OWNER TO sail;

--
-- Name: pesonas_id_seq; Type: SEQUENCE OWNED BY; Schema: api_pueblos_magicos; Owner: sail
--

ALTER SEQUENCE api_pueblos_magicos.pesonas_id_seq OWNED BY api_pueblos_magicos.personas.id;


--
-- Name: pueblos_magicos; Type: TABLE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE TABLE api_pueblos_magicos.pueblos_magicos (
    id bigint NOT NULL,
    nombre character varying(255) NOT NULL,
    descripcion character varying(255) NOT NULL,
    id_direccion bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE api_pueblos_magicos.pueblos_magicos OWNER TO sail;

--
-- Name: pueblos_magicos_id_seq; Type: SEQUENCE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE SEQUENCE api_pueblos_magicos.pueblos_magicos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE api_pueblos_magicos.pueblos_magicos_id_seq OWNER TO sail;

--
-- Name: pueblos_magicos_id_seq; Type: SEQUENCE OWNED BY; Schema: api_pueblos_magicos; Owner: sail
--

ALTER SEQUENCE api_pueblos_magicos.pueblos_magicos_id_seq OWNED BY api_pueblos_magicos.pueblos_magicos.id;


--
-- Name: pueblos_magicos_imagenes; Type: TABLE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE TABLE api_pueblos_magicos.pueblos_magicos_imagenes (
    id bigint NOT NULL,
    id_pueblo_magico bigint NOT NULL,
    id_imagen bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE api_pueblos_magicos.pueblos_magicos_imagenes OWNER TO sail;

--
-- Name: pueblos_magicos_imagenes_id_seq; Type: SEQUENCE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE SEQUENCE api_pueblos_magicos.pueblos_magicos_imagenes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE api_pueblos_magicos.pueblos_magicos_imagenes_id_seq OWNER TO sail;

--
-- Name: pueblos_magicos_imagenes_id_seq; Type: SEQUENCE OWNED BY; Schema: api_pueblos_magicos; Owner: sail
--

ALTER SEQUENCE api_pueblos_magicos.pueblos_magicos_imagenes_id_seq OWNED BY api_pueblos_magicos.pueblos_magicos_imagenes.id;


--
-- Name: pueblos_solicitudes; Type: TABLE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE TABLE api_pueblos_magicos.pueblos_solicitudes (
    id bigint NOT NULL,
    id_servicio bigint NOT NULL,
    id_pueblo_magico bigint NOT NULL,
    id_tipo_servicio bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE api_pueblos_magicos.pueblos_solicitudes OWNER TO sail;

--
-- Name: pueblos_solicitudes_id_seq; Type: SEQUENCE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE SEQUENCE api_pueblos_magicos.pueblos_solicitudes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE api_pueblos_magicos.pueblos_solicitudes_id_seq OWNER TO sail;

--
-- Name: pueblos_solicitudes_id_seq; Type: SEQUENCE OWNED BY; Schema: api_pueblos_magicos; Owner: sail
--

ALTER SEQUENCE api_pueblos_magicos.pueblos_solicitudes_id_seq OWNED BY api_pueblos_magicos.pueblos_solicitudes.id;


--
-- Name: ratings; Type: TABLE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE TABLE api_pueblos_magicos.ratings (
    id bigint NOT NULL,
    rating character varying(255) NOT NULL,
    comentario character varying(255) NOT NULL,
    id_servicio bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE api_pueblos_magicos.ratings OWNER TO sail;

--
-- Name: ratings_id_seq; Type: SEQUENCE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE SEQUENCE api_pueblos_magicos.ratings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE api_pueblos_magicos.ratings_id_seq OWNER TO sail;

--
-- Name: ratings_id_seq; Type: SEQUENCE OWNED BY; Schema: api_pueblos_magicos; Owner: sail
--

ALTER SEQUENCE api_pueblos_magicos.ratings_id_seq OWNED BY api_pueblos_magicos.ratings.id;


--
-- Name: servicio_detalles; Type: TABLE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE TABLE api_pueblos_magicos.servicio_detalles (
    id bigint NOT NULL,
    dias_servicio character varying(255) NOT NULL,
    precios character varying(255) NOT NULL,
    titulo character varying(255) NOT NULL,
    descripcion text NOT NULL,
    id_coordenadas bigint NOT NULL,
    id_servicio bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    id_horarios bigint NOT NULL
);


ALTER TABLE api_pueblos_magicos.servicio_detalles OWNER TO sail;

--
-- Name: servicio_detalles_id_seq; Type: SEQUENCE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE SEQUENCE api_pueblos_magicos.servicio_detalles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE api_pueblos_magicos.servicio_detalles_id_seq OWNER TO sail;

--
-- Name: servicio_detalles_id_seq; Type: SEQUENCE OWNED BY; Schema: api_pueblos_magicos; Owner: sail
--

ALTER SEQUENCE api_pueblos_magicos.servicio_detalles_id_seq OWNED BY api_pueblos_magicos.servicio_detalles.id;


--
-- Name: servicios; Type: TABLE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE TABLE api_pueblos_magicos.servicios (
    id bigint NOT NULL,
    id_tipo_servicio bigint NOT NULL,
    id_direccion bigint NOT NULL,
    id_usuario bigint NOT NULL,
    id_pueblo bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    id_estatus bigint NOT NULL
);


ALTER TABLE api_pueblos_magicos.servicios OWNER TO sail;

--
-- Name: servicios_id_seq; Type: SEQUENCE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE SEQUENCE api_pueblos_magicos.servicios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE api_pueblos_magicos.servicios_id_seq OWNER TO sail;

--
-- Name: servicios_id_seq; Type: SEQUENCE OWNED BY; Schema: api_pueblos_magicos; Owner: sail
--

ALTER SEQUENCE api_pueblos_magicos.servicios_id_seq OWNED BY api_pueblos_magicos.servicios.id;


--
-- Name: servicios_imagenes; Type: TABLE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE TABLE api_pueblos_magicos.servicios_imagenes (
    id bigint NOT NULL,
    id_servicio bigint NOT NULL,
    id_imagen bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE api_pueblos_magicos.servicios_imagenes OWNER TO sail;

--
-- Name: servicios_imagenes_id_seq; Type: SEQUENCE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE SEQUENCE api_pueblos_magicos.servicios_imagenes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE api_pueblos_magicos.servicios_imagenes_id_seq OWNER TO sail;

--
-- Name: servicios_imagenes_id_seq; Type: SEQUENCE OWNED BY; Schema: api_pueblos_magicos; Owner: sail
--

ALTER SEQUENCE api_pueblos_magicos.servicios_imagenes_id_seq OWNED BY api_pueblos_magicos.servicios_imagenes.id;


--
-- Name: sessions; Type: TABLE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE TABLE api_pueblos_magicos.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


ALTER TABLE api_pueblos_magicos.sessions OWNER TO sail;

--
-- Name: tipos_imagenes; Type: TABLE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE TABLE api_pueblos_magicos.tipos_imagenes (
    id bigint NOT NULL,
    tipo character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE api_pueblos_magicos.tipos_imagenes OWNER TO sail;

--
-- Name: tipos_imagenes_id_seq; Type: SEQUENCE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE SEQUENCE api_pueblos_magicos.tipos_imagenes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE api_pueblos_magicos.tipos_imagenes_id_seq OWNER TO sail;

--
-- Name: tipos_imagenes_id_seq; Type: SEQUENCE OWNED BY; Schema: api_pueblos_magicos; Owner: sail
--

ALTER SEQUENCE api_pueblos_magicos.tipos_imagenes_id_seq OWNED BY api_pueblos_magicos.tipos_imagenes.id;


--
-- Name: tipos_servicios; Type: TABLE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE TABLE api_pueblos_magicos.tipos_servicios (
    id bigint NOT NULL,
    servicio character varying(255) NOT NULL,
    estatus boolean NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE api_pueblos_magicos.tipos_servicios OWNER TO sail;

--
-- Name: tipos_servicios_id_seq; Type: SEQUENCE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE SEQUENCE api_pueblos_magicos.tipos_servicios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE api_pueblos_magicos.tipos_servicios_id_seq OWNER TO sail;

--
-- Name: tipos_servicios_id_seq; Type: SEQUENCE OWNED BY; Schema: api_pueblos_magicos; Owner: sail
--

ALTER SEQUENCE api_pueblos_magicos.tipos_servicios_id_seq OWNED BY api_pueblos_magicos.tipos_servicios.id;


--
-- Name: tipos_usuarios; Type: TABLE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE TABLE api_pueblos_magicos.tipos_usuarios (
    id bigint NOT NULL,
    tipo_usuario character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE api_pueblos_magicos.tipos_usuarios OWNER TO sail;

--
-- Name: tipos_usuarios_id_seq; Type: SEQUENCE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE SEQUENCE api_pueblos_magicos.tipos_usuarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE api_pueblos_magicos.tipos_usuarios_id_seq OWNER TO sail;

--
-- Name: tipos_usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: api_pueblos_magicos; Owner: sail
--

ALTER SEQUENCE api_pueblos_magicos.tipos_usuarios_id_seq OWNED BY api_pueblos_magicos.tipos_usuarios.id;


--
-- Name: usuarios; Type: TABLE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE TABLE api_pueblos_magicos.usuarios (
    id bigint NOT NULL,
    user_name character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    id_tipo_usuario bigint NOT NULL
);


ALTER TABLE api_pueblos_magicos.usuarios OWNER TO sail;

--
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: api_pueblos_magicos; Owner: sail
--

CREATE SEQUENCE api_pueblos_magicos.usuarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE api_pueblos_magicos.usuarios_id_seq OWNER TO sail;

--
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: api_pueblos_magicos; Owner: sail
--

ALTER SEQUENCE api_pueblos_magicos.usuarios_id_seq OWNED BY api_pueblos_magicos.usuarios.id;


--
-- Name: bitacora id; Type: DEFAULT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.bitacora ALTER COLUMN id SET DEFAULT nextval('api_pueblos_magicos.bitacora_id_seq'::regclass);


--
-- Name: coordenadas id; Type: DEFAULT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.coordenadas ALTER COLUMN id SET DEFAULT nextval('api_pueblos_magicos.coordenadas_id_seq'::regclass);


--
-- Name: direcciones id; Type: DEFAULT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.direcciones ALTER COLUMN id SET DEFAULT nextval('api_pueblos_magicos.direcciones_id_seq'::regclass);


--
-- Name: estados id; Type: DEFAULT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.estados ALTER COLUMN id SET DEFAULT nextval('api_pueblos_magicos.estados_id_seq'::regclass);


--
-- Name: estatus id; Type: DEFAULT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.estatus ALTER COLUMN id SET DEFAULT nextval('api_pueblos_magicos.estatus_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.failed_jobs ALTER COLUMN id SET DEFAULT nextval('api_pueblos_magicos.failed_jobs_id_seq'::regclass);


--
-- Name: festividades id; Type: DEFAULT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.festividades ALTER COLUMN id SET DEFAULT nextval('api_pueblos_magicos.festividades_id_seq'::regclass);


--
-- Name: festividades_detalles id; Type: DEFAULT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.festividades_detalles ALTER COLUMN id SET DEFAULT nextval('api_pueblos_magicos.festividades_detalles_id_seq'::regclass);


--
-- Name: festividades_imagenes id; Type: DEFAULT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.festividades_imagenes ALTER COLUMN id SET DEFAULT nextval('api_pueblos_magicos.festividades_imagenes_id_seq'::regclass);


--
-- Name: horarios id; Type: DEFAULT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.horarios ALTER COLUMN id SET DEFAULT nextval('api_pueblos_magicos.horarios_id_seq'::regclass);


--
-- Name: imagenes id; Type: DEFAULT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.imagenes ALTER COLUMN id SET DEFAULT nextval('api_pueblos_magicos.imagenes_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.jobs ALTER COLUMN id SET DEFAULT nextval('api_pueblos_magicos.jobs_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.migrations ALTER COLUMN id SET DEFAULT nextval('api_pueblos_magicos.migrations_id_seq'::regclass);


--
-- Name: observaciones id; Type: DEFAULT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.observaciones ALTER COLUMN id SET DEFAULT nextval('api_pueblos_magicos.observaciones_id_seq'::regclass);


--
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('api_pueblos_magicos.personal_access_tokens_id_seq'::regclass);


--
-- Name: personas id; Type: DEFAULT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.personas ALTER COLUMN id SET DEFAULT nextval('api_pueblos_magicos.pesonas_id_seq'::regclass);


--
-- Name: pueblos_magicos id; Type: DEFAULT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.pueblos_magicos ALTER COLUMN id SET DEFAULT nextval('api_pueblos_magicos.pueblos_magicos_id_seq'::regclass);


--
-- Name: pueblos_magicos_imagenes id; Type: DEFAULT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.pueblos_magicos_imagenes ALTER COLUMN id SET DEFAULT nextval('api_pueblos_magicos.pueblos_magicos_imagenes_id_seq'::regclass);


--
-- Name: pueblos_solicitudes id; Type: DEFAULT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.pueblos_solicitudes ALTER COLUMN id SET DEFAULT nextval('api_pueblos_magicos.pueblos_solicitudes_id_seq'::regclass);


--
-- Name: ratings id; Type: DEFAULT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.ratings ALTER COLUMN id SET DEFAULT nextval('api_pueblos_magicos.ratings_id_seq'::regclass);


--
-- Name: servicio_detalles id; Type: DEFAULT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.servicio_detalles ALTER COLUMN id SET DEFAULT nextval('api_pueblos_magicos.servicio_detalles_id_seq'::regclass);


--
-- Name: servicios id; Type: DEFAULT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.servicios ALTER COLUMN id SET DEFAULT nextval('api_pueblos_magicos.servicios_id_seq'::regclass);


--
-- Name: servicios_imagenes id; Type: DEFAULT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.servicios_imagenes ALTER COLUMN id SET DEFAULT nextval('api_pueblos_magicos.servicios_imagenes_id_seq'::regclass);


--
-- Name: tipos_imagenes id; Type: DEFAULT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.tipos_imagenes ALTER COLUMN id SET DEFAULT nextval('api_pueblos_magicos.tipos_imagenes_id_seq'::regclass);


--
-- Name: tipos_servicios id; Type: DEFAULT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.tipos_servicios ALTER COLUMN id SET DEFAULT nextval('api_pueblos_magicos.tipos_servicios_id_seq'::regclass);


--
-- Name: tipos_usuarios id; Type: DEFAULT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.tipos_usuarios ALTER COLUMN id SET DEFAULT nextval('api_pueblos_magicos.tipos_usuarios_id_seq'::regclass);


--
-- Name: usuarios id; Type: DEFAULT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.usuarios ALTER COLUMN id SET DEFAULT nextval('api_pueblos_magicos.usuarios_id_seq'::regclass);


--
-- Data for Name: bitacora; Type: TABLE DATA; Schema: api_pueblos_magicos; Owner: sail
--

COPY api_pueblos_magicos.bitacora (id, movimiento, tabla_afectada, id_registro_afectado, id_usuario, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: cache; Type: TABLE DATA; Schema: api_pueblos_magicos; Owner: sail
--

COPY api_pueblos_magicos.cache (key, value, expiration) FROM stdin;
\.


--
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: api_pueblos_magicos; Owner: sail
--

COPY api_pueblos_magicos.cache_locks (key, owner, expiration) FROM stdin;
\.


--
-- Data for Name: coordenadas; Type: TABLE DATA; Schema: api_pueblos_magicos; Owner: sail
--

COPY api_pueblos_magicos.coordenadas (id, longitud, latitud, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: direcciones; Type: TABLE DATA; Schema: api_pueblos_magicos; Owner: sail
--

COPY api_pueblos_magicos.direcciones (id, calle, municipio, "CP", "int", ext, id_estado, created_at, updated_at, deleted_at, colonia) FROM stdin;
1	Av. 4 Ote. 1	Residencial el Refugio de San Miguel	72764	SN	SN	21	2024-04-18 21:29:00	2024-04-18 21:29:00	\N	Cholula de Rivadavia
2	Libertad 416	Centro	74200	SN	SN	21	2024-04-18 21:29:00	2024-04-18 21:29:00	\N	Atlixco
3	Calle 3 Ote. 2	Centro	73640	SN	SN	21	2024-04-18 21:29:00	2024-04-18 21:29:00	\N	Cdad. de Tetela de Ocampo
4	J. Ma. Morelos 12	Centro	73310	SN	SN	21	2024-04-18 21:29:00	2024-04-18 21:29:00	\N	Zacatlán
5	Allende 102	Col Centro	73080	SN	SN	21	2024-04-18 21:29:00	2024-04-18 21:29:00	\N	Xicotepec de Juárez
6	Av. Revolución 43	Centro	73900	SN	SN	21	2024-04-18 21:29:00	2024-04-18 21:29:00	\N	Cdad. de Tlatlauquitepec
7	Pahuatlán	Pahuatlán	73100	SN	SN	21	2024-04-18 21:29:00	2024-04-18 21:29:00	\N	Pahuatlán
8	Centro	Centro	73170	SN	SN	21	2024-04-18 21:29:00	2024-04-18 21:29:00	\N	Huauchinango
9	Chignahuapan	Chignahuapan	73300	SN	SN	21	2024-04-18 21:29:00	2024-04-18 21:29:00	\N	Chignahuapan
10	Centenario 3-9	Centro	73560	SN	SN	21	2024-04-18 21:29:00	2024-04-18 21:29:00	\N	Cdad. de Cuetzalan
\.


--
-- Data for Name: estados; Type: TABLE DATA; Schema: api_pueblos_magicos; Owner: sail
--

COPY api_pueblos_magicos.estados (id, nombre, created_at, updated_at, deleted_at) FROM stdin;
1	Aguascalientes	2024-04-18 21:29:00	2024-04-18 21:29:00	\N
2	Baja California	2024-04-18 21:29:00	2024-04-18 21:29:00	\N
3	Baja California Sur	2024-04-18 21:29:00	2024-04-18 21:29:00	\N
4	Campeche	2024-04-18 21:29:00	2024-04-18 21:29:00	\N
5	Chiapas	2024-04-18 21:29:00	2024-04-18 21:29:00	\N
6	Chihuahua	2024-04-18 21:29:00	2024-04-18 21:29:00	\N
7	Coahuila	2024-04-18 21:29:00	2024-04-18 21:29:00	\N
8	Colima	2024-04-18 21:29:00	2024-04-18 21:29:00	\N
9	Ciudad de México	2024-04-18 21:29:00	2024-04-18 21:29:00	\N
10	Durango	2024-04-18 21:29:00	2024-04-18 21:29:00	\N
11	Guanajuato	2024-04-18 21:29:00	2024-04-18 21:29:00	\N
12	Guerrero	2024-04-18 21:29:00	2024-04-18 21:29:00	\N
13	Hidalgo	2024-04-18 21:29:00	2024-04-18 21:29:00	\N
14	Jalisco	2024-04-18 21:29:00	2024-04-18 21:29:00	\N
15	Estado de México	2024-04-18 21:29:00	2024-04-18 21:29:00	\N
16	Michoacán	2024-04-18 21:29:00	2024-04-18 21:29:00	\N
17	Morelos	2024-04-18 21:29:00	2024-04-18 21:29:00	\N
18	Nayarit	2024-04-18 21:29:00	2024-04-18 21:29:00	\N
19	Nuevo León	2024-04-18 21:29:00	2024-04-18 21:29:00	\N
20	Oaxaca	2024-04-18 21:29:00	2024-04-18 21:29:00	\N
21	Puebla	2024-04-18 21:29:00	2024-04-18 21:29:00	\N
22	Querétaro	2024-04-18 21:29:00	2024-04-18 21:29:00	\N
23	Quintana Roo	2024-04-18 21:29:00	2024-04-18 21:29:00	\N
24	San Luis Potosí	2024-04-18 21:29:00	2024-04-18 21:29:00	\N
25	Sinaloa	2024-04-18 21:29:00	2024-04-18 21:29:00	\N
26	Sonora	2024-04-18 21:29:00	2024-04-18 21:29:00	\N
27	Tabasco	2024-04-18 21:29:00	2024-04-18 21:29:00	\N
28	Tamaulipas	2024-04-18 21:29:00	2024-04-18 21:29:00	\N
29	Tlaxcala	2024-04-18 21:29:00	2024-04-18 21:29:00	\N
30	Veracruz	2024-04-18 21:29:00	2024-04-18 21:29:00	\N
31	Yucatán	2024-04-18 21:29:00	2024-04-18 21:29:00	\N
32	Zacatecas	2024-04-18 21:29:00	2024-04-18 21:29:00	\N
\.


--
-- Data for Name: estatus; Type: TABLE DATA; Schema: api_pueblos_magicos; Owner: sail
--

COPY api_pueblos_magicos.estatus (id, estado, created_at, updated_at, deleted_at) FROM stdin;
1	En Validación	2024-04-18 21:29:01	2024-04-18 21:29:01	\N
2	Aceptado	2024-04-18 21:29:01	2024-04-18 21:29:01	\N
3	Con Observaciones	2024-04-18 21:29:01	2024-04-18 21:29:01	\N
4	Inactivo	2024-04-18 21:29:01	2024-04-18 21:29:01	\N
5	En Revisión	2024-04-18 21:29:01	2024-04-18 21:29:01	\N
6	Atendidas	2024-04-18 21:29:01	2024-04-18 21:29:01	\N
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: api_pueblos_magicos; Owner: sail
--

COPY api_pueblos_magicos.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: festividades; Type: TABLE DATA; Schema: api_pueblos_magicos; Owner: sail
--

COPY api_pueblos_magicos.festividades (id, id_direccion, id_usuario, id_pueblo, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: festividades_detalles; Type: TABLE DATA; Schema: api_pueblos_magicos; Owner: sail
--

COPY api_pueblos_magicos.festividades_detalles (id, dias_servicio, horarios, precios, nombre, descripcion, id_coordenadas, id_servicio, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: festividades_imagenes; Type: TABLE DATA; Schema: api_pueblos_magicos; Owner: sail
--

COPY api_pueblos_magicos.festividades_imagenes (id, id_festividad, id_imagen, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: horarios; Type: TABLE DATA; Schema: api_pueblos_magicos; Owner: sail
--

COPY api_pueblos_magicos.horarios (id, horario_inicio, horario_fin, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: imagenes; Type: TABLE DATA; Schema: api_pueblos_magicos; Owner: sail
--

COPY api_pueblos_magicos.imagenes (id, nombre, id_tipo_imagen, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: job_batches; Type: TABLE DATA; Schema: api_pueblos_magicos; Owner: sail
--

COPY api_pueblos_magicos.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: api_pueblos_magicos; Owner: sail
--

COPY api_pueblos_magicos.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: api_pueblos_magicos; Owner: sail
--

COPY api_pueblos_magicos.migrations (id, migration, batch) FROM stdin;
1	0001_01_01_000000_create_users_table	1
2	0001_01_01_000001_create_cache_table	1
3	0001_01_01_000002_create_jobs_table	1
4	2024_03_12_193304_create_states_table	1
5	2024_03_13_000859_create_personal_access_tokens_table	1
6	2024_03_19_204459_create_table_tipos_usuarios	1
7	2024_03_19_212926_add_field_tipo_user_to_users_table	1
8	2024_03_19_214834_create_pesonas_table	1
9	2024_03_19_215754_create_direcciones_table	1
10	2024_03_19_221553_create_coordenadas_table	1
11	2024_03_19_222235_create_tipos_servicios_table	1
12	2024_03_19_223217_create_pueblos_magicos_table	1
13	2024_03_19_223549_create_servicios_table	1
14	2024_03_19_224024_create_servicio_detalles_table	1
15	2024_03_19_225208_create_festividades_table	1
16	2024_03_19_225249_create_festividades_detalles_table	1
17	2024_03_19_225611_create_ratings_table	1
18	2024_03_19_225814_create_tipos_imagenes_table	1
19	2024_03_19_225934_create_imagenes_table	1
20	2024_03_19_230125_create_servicios_imagenes_table	1
21	2024_03_19_230508_create_festividades_imagenes_table	1
22	2024_03_19_230526_create_pueblos_magicos_imagenes_table	1
23	2024_03_19_230729_create_pueblos_solicitudes_table	1
24	2024_03_19_231509_create_bitacora_table	1
25	2024_03_21_172212_rename_pesonas_table_to_personas_table	1
26	2024_03_21_204938_modify_direcciones_table	1
27	2024_03_21_225555_change_descripcion_field_is_servicio_detalles	1
28	2024_03_22_182332_delete_horarios_field_table_servicio_detalles	1
29	2024_03_22_182637_create_horarios_table	1
30	2024_03_22_183709_add_field_id_horarios_to__servicio_detalles_table	1
31	2024_04_11_170549_create__status_table	1
32	2024_04_11_171753_create__observaciones_table	1
33	2024_04_11_172427_add_field_id_estatus_to_servicio	1
\.


--
-- Data for Name: observaciones; Type: TABLE DATA; Schema: api_pueblos_magicos; Owner: sail
--

COPY api_pueblos_magicos.observaciones (id, id_servicio, id_usuario, id_estatus, observacion, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: api_pueblos_magicos; Owner: sail
--

COPY api_pueblos_magicos.password_reset_tokens (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: api_pueblos_magicos; Owner: sail
--

COPY api_pueblos_magicos.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: personas; Type: TABLE DATA; Schema: api_pueblos_magicos; Owner: sail
--

COPY api_pueblos_magicos.personas (id, nombre, apellido_pat, apellido_mat, id_usuario, created_at, updated_at, deleted_at) FROM stdin;
1	Brayan Angelo	Jimenez	Amores	1	2024-04-18 21:29:01	2024-04-18 21:29:01	\N
\.


--
-- Data for Name: pueblos_magicos; Type: TABLE DATA; Schema: api_pueblos_magicos; Owner: sail
--

COPY api_pueblos_magicos.pueblos_magicos (id, nombre, descripcion, id_direccion, created_at, updated_at, deleted_at) FROM stdin;
1	Cholula		1	2024-04-18 21:29:00	2024-04-18 21:29:00	\N
2	Atlixco		2	2024-04-18 21:29:01	2024-04-18 21:29:01	\N
3	Tetela de Ocampo		3	2024-04-18 21:29:01	2024-04-18 21:29:01	\N
4	Zacatlán		4	2024-04-18 21:29:01	2024-04-18 21:29:01	\N
5	Xicotepec		5	2024-04-18 21:29:01	2024-04-18 21:29:01	\N
6	Tlatlauquitepec		6	2024-04-18 21:29:01	2024-04-18 21:29:01	\N
7	Pahuatlán		7	2024-04-18 21:29:01	2024-04-18 21:29:01	\N
8	Huachinango		8	2024-04-18 21:29:01	2024-04-18 21:29:01	\N
9	Chignahuapan		9	2024-04-18 21:29:01	2024-04-18 21:29:01	\N
10	Cuetzalan		10	2024-04-18 21:29:01	2024-04-18 21:29:01	\N
\.


--
-- Data for Name: pueblos_magicos_imagenes; Type: TABLE DATA; Schema: api_pueblos_magicos; Owner: sail
--

COPY api_pueblos_magicos.pueblos_magicos_imagenes (id, id_pueblo_magico, id_imagen, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: pueblos_solicitudes; Type: TABLE DATA; Schema: api_pueblos_magicos; Owner: sail
--

COPY api_pueblos_magicos.pueblos_solicitudes (id, id_servicio, id_pueblo_magico, id_tipo_servicio, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: ratings; Type: TABLE DATA; Schema: api_pueblos_magicos; Owner: sail
--

COPY api_pueblos_magicos.ratings (id, rating, comentario, id_servicio, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: servicio_detalles; Type: TABLE DATA; Schema: api_pueblos_magicos; Owner: sail
--

COPY api_pueblos_magicos.servicio_detalles (id, dias_servicio, precios, titulo, descripcion, id_coordenadas, id_servicio, created_at, updated_at, deleted_at, id_horarios) FROM stdin;
\.


--
-- Data for Name: servicios; Type: TABLE DATA; Schema: api_pueblos_magicos; Owner: sail
--

COPY api_pueblos_magicos.servicios (id, id_tipo_servicio, id_direccion, id_usuario, id_pueblo, created_at, updated_at, deleted_at, id_estatus) FROM stdin;
\.


--
-- Data for Name: servicios_imagenes; Type: TABLE DATA; Schema: api_pueblos_magicos; Owner: sail
--

COPY api_pueblos_magicos.servicios_imagenes (id, id_servicio, id_imagen, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: api_pueblos_magicos; Owner: sail
--

COPY api_pueblos_magicos.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
\.


--
-- Data for Name: tipos_imagenes; Type: TABLE DATA; Schema: api_pueblos_magicos; Owner: sail
--

COPY api_pueblos_magicos.tipos_imagenes (id, tipo, created_at, updated_at, deleted_at) FROM stdin;
1	back	2024-04-18 21:29:01	2024-04-18 21:29:01	\N
2	galeria	2024-04-18 21:29:01	2024-04-18 21:29:01	\N
\.


--
-- Data for Name: tipos_servicios; Type: TABLE DATA; Schema: api_pueblos_magicos; Owner: sail
--

COPY api_pueblos_magicos.tipos_servicios (id, servicio, estatus, created_at, updated_at, deleted_at) FROM stdin;
1	Hospedaje	t	2024-04-18 21:29:00	2024-04-18 21:29:00	\N
2	Gastronomia	t	2024-04-18 21:29:00	2024-04-18 21:29:00	\N
3	Tours	t	2024-04-18 21:29:00	2024-04-18 21:29:00	\N
4	Sitios	t	2024-04-18 21:29:00	2024-04-18 21:29:00	\N
5	Festividades	t	2024-04-18 21:29:00	2024-04-18 21:29:00	\N
6	Cerca de ustedes	t	2024-04-18 21:29:00	2024-04-18 21:29:00	\N
\.


--
-- Data for Name: tipos_usuarios; Type: TABLE DATA; Schema: api_pueblos_magicos; Owner: sail
--

COPY api_pueblos_magicos.tipos_usuarios (id, tipo_usuario, created_at, updated_at, deleted_at) FROM stdin;
1	Admin_Systema	2024-04-18 21:29:00	2024-04-18 21:29:00	\N
2	Director_Pueblos_Magicos	2024-04-18 21:29:00	2024-04-18 21:29:00	\N
3	Hotelero	2024-04-18 21:29:00	2024-04-18 21:29:00	\N
4	Restaurantero	2024-04-18 21:29:00	2024-04-18 21:29:00	\N
5	Pueblo_Magico	2024-04-18 21:29:00	2024-04-18 21:29:00	\N
6	Turista	2024-04-18 21:29:00	2024-04-18 21:29:00	\N
\.


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: api_pueblos_magicos; Owner: sail
--

COPY api_pueblos_magicos.usuarios (id, user_name, password, remember_token, created_at, updated_at, deleted_at, id_tipo_usuario) FROM stdin;
1	bajimeneza@ipn.mx	$2y$12$ly0bo6uQp0AJlmNaUR3Fx.tPJYEQMjg8H2966kYopHE437NgXbS6O	\N	2024-04-18 21:29:01	2024-04-18 21:29:01	\N	1
\.


--
-- Name: bitacora_id_seq; Type: SEQUENCE SET; Schema: api_pueblos_magicos; Owner: sail
--

SELECT pg_catalog.setval('api_pueblos_magicos.bitacora_id_seq', 1, false);


--
-- Name: coordenadas_id_seq; Type: SEQUENCE SET; Schema: api_pueblos_magicos; Owner: sail
--

SELECT pg_catalog.setval('api_pueblos_magicos.coordenadas_id_seq', 1, false);


--
-- Name: direcciones_id_seq; Type: SEQUENCE SET; Schema: api_pueblos_magicos; Owner: sail
--

SELECT pg_catalog.setval('api_pueblos_magicos.direcciones_id_seq', 10, true);


--
-- Name: estados_id_seq; Type: SEQUENCE SET; Schema: api_pueblos_magicos; Owner: sail
--

SELECT pg_catalog.setval('api_pueblos_magicos.estados_id_seq', 32, true);


--
-- Name: estatus_id_seq; Type: SEQUENCE SET; Schema: api_pueblos_magicos; Owner: sail
--

SELECT pg_catalog.setval('api_pueblos_magicos.estatus_id_seq', 6, true);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: api_pueblos_magicos; Owner: sail
--

SELECT pg_catalog.setval('api_pueblos_magicos.failed_jobs_id_seq', 1, false);


--
-- Name: festividades_detalles_id_seq; Type: SEQUENCE SET; Schema: api_pueblos_magicos; Owner: sail
--

SELECT pg_catalog.setval('api_pueblos_magicos.festividades_detalles_id_seq', 1, false);


--
-- Name: festividades_id_seq; Type: SEQUENCE SET; Schema: api_pueblos_magicos; Owner: sail
--

SELECT pg_catalog.setval('api_pueblos_magicos.festividades_id_seq', 1, false);


--
-- Name: festividades_imagenes_id_seq; Type: SEQUENCE SET; Schema: api_pueblos_magicos; Owner: sail
--

SELECT pg_catalog.setval('api_pueblos_magicos.festividades_imagenes_id_seq', 1, false);


--
-- Name: horarios_id_seq; Type: SEQUENCE SET; Schema: api_pueblos_magicos; Owner: sail
--

SELECT pg_catalog.setval('api_pueblos_magicos.horarios_id_seq', 1, false);


--
-- Name: imagenes_id_seq; Type: SEQUENCE SET; Schema: api_pueblos_magicos; Owner: sail
--

SELECT pg_catalog.setval('api_pueblos_magicos.imagenes_id_seq', 1, false);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: api_pueblos_magicos; Owner: sail
--

SELECT pg_catalog.setval('api_pueblos_magicos.jobs_id_seq', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: api_pueblos_magicos; Owner: sail
--

SELECT pg_catalog.setval('api_pueblos_magicos.migrations_id_seq', 33, true);


--
-- Name: observaciones_id_seq; Type: SEQUENCE SET; Schema: api_pueblos_magicos; Owner: sail
--

SELECT pg_catalog.setval('api_pueblos_magicos.observaciones_id_seq', 1, false);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: api_pueblos_magicos; Owner: sail
--

SELECT pg_catalog.setval('api_pueblos_magicos.personal_access_tokens_id_seq', 1, false);


--
-- Name: pesonas_id_seq; Type: SEQUENCE SET; Schema: api_pueblos_magicos; Owner: sail
--

SELECT pg_catalog.setval('api_pueblos_magicos.pesonas_id_seq', 1, true);


--
-- Name: pueblos_magicos_id_seq; Type: SEQUENCE SET; Schema: api_pueblos_magicos; Owner: sail
--

SELECT pg_catalog.setval('api_pueblos_magicos.pueblos_magicos_id_seq', 10, true);


--
-- Name: pueblos_magicos_imagenes_id_seq; Type: SEQUENCE SET; Schema: api_pueblos_magicos; Owner: sail
--

SELECT pg_catalog.setval('api_pueblos_magicos.pueblos_magicos_imagenes_id_seq', 1, false);


--
-- Name: pueblos_solicitudes_id_seq; Type: SEQUENCE SET; Schema: api_pueblos_magicos; Owner: sail
--

SELECT pg_catalog.setval('api_pueblos_magicos.pueblos_solicitudes_id_seq', 1, false);


--
-- Name: ratings_id_seq; Type: SEQUENCE SET; Schema: api_pueblos_magicos; Owner: sail
--

SELECT pg_catalog.setval('api_pueblos_magicos.ratings_id_seq', 1, false);


--
-- Name: servicio_detalles_id_seq; Type: SEQUENCE SET; Schema: api_pueblos_magicos; Owner: sail
--

SELECT pg_catalog.setval('api_pueblos_magicos.servicio_detalles_id_seq', 1, false);


--
-- Name: servicios_id_seq; Type: SEQUENCE SET; Schema: api_pueblos_magicos; Owner: sail
--

SELECT pg_catalog.setval('api_pueblos_magicos.servicios_id_seq', 1, false);


--
-- Name: servicios_imagenes_id_seq; Type: SEQUENCE SET; Schema: api_pueblos_magicos; Owner: sail
--

SELECT pg_catalog.setval('api_pueblos_magicos.servicios_imagenes_id_seq', 1, false);


--
-- Name: tipos_imagenes_id_seq; Type: SEQUENCE SET; Schema: api_pueblos_magicos; Owner: sail
--

SELECT pg_catalog.setval('api_pueblos_magicos.tipos_imagenes_id_seq', 2, true);


--
-- Name: tipos_servicios_id_seq; Type: SEQUENCE SET; Schema: api_pueblos_magicos; Owner: sail
--

SELECT pg_catalog.setval('api_pueblos_magicos.tipos_servicios_id_seq', 6, true);


--
-- Name: tipos_usuarios_id_seq; Type: SEQUENCE SET; Schema: api_pueblos_magicos; Owner: sail
--

SELECT pg_catalog.setval('api_pueblos_magicos.tipos_usuarios_id_seq', 6, true);


--
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: api_pueblos_magicos; Owner: sail
--

SELECT pg_catalog.setval('api_pueblos_magicos.usuarios_id_seq', 1, true);


--
-- Name: bitacora bitacora_pkey; Type: CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.bitacora
    ADD CONSTRAINT bitacora_pkey PRIMARY KEY (id);


--
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- Name: coordenadas coordenadas_pkey; Type: CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.coordenadas
    ADD CONSTRAINT coordenadas_pkey PRIMARY KEY (id);


--
-- Name: direcciones direcciones_pkey; Type: CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.direcciones
    ADD CONSTRAINT direcciones_pkey PRIMARY KEY (id);


--
-- Name: estados estados_pkey; Type: CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.estados
    ADD CONSTRAINT estados_pkey PRIMARY KEY (id);


--
-- Name: estatus estatus_pkey; Type: CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.estatus
    ADD CONSTRAINT estatus_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: festividades_detalles festividades_detalles_pkey; Type: CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.festividades_detalles
    ADD CONSTRAINT festividades_detalles_pkey PRIMARY KEY (id);


--
-- Name: festividades_imagenes festividades_imagenes_pkey; Type: CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.festividades_imagenes
    ADD CONSTRAINT festividades_imagenes_pkey PRIMARY KEY (id);


--
-- Name: festividades festividades_pkey; Type: CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.festividades
    ADD CONSTRAINT festividades_pkey PRIMARY KEY (id);


--
-- Name: horarios horarios_pkey; Type: CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.horarios
    ADD CONSTRAINT horarios_pkey PRIMARY KEY (id);


--
-- Name: imagenes imagenes_pkey; Type: CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.imagenes
    ADD CONSTRAINT imagenes_pkey PRIMARY KEY (id);


--
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: observaciones observaciones_pkey; Type: CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.observaciones
    ADD CONSTRAINT observaciones_pkey PRIMARY KEY (id);


--
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- Name: personas pesonas_pkey; Type: CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.personas
    ADD CONSTRAINT pesonas_pkey PRIMARY KEY (id);


--
-- Name: pueblos_magicos_imagenes pueblos_magicos_imagenes_pkey; Type: CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.pueblos_magicos_imagenes
    ADD CONSTRAINT pueblos_magicos_imagenes_pkey PRIMARY KEY (id);


--
-- Name: pueblos_magicos pueblos_magicos_pkey; Type: CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.pueblos_magicos
    ADD CONSTRAINT pueblos_magicos_pkey PRIMARY KEY (id);


--
-- Name: pueblos_solicitudes pueblos_solicitudes_pkey; Type: CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.pueblos_solicitudes
    ADD CONSTRAINT pueblos_solicitudes_pkey PRIMARY KEY (id);


--
-- Name: ratings ratings_pkey; Type: CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (id);


--
-- Name: servicio_detalles servicio_detalles_pkey; Type: CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.servicio_detalles
    ADD CONSTRAINT servicio_detalles_pkey PRIMARY KEY (id);


--
-- Name: servicios_imagenes servicios_imagenes_pkey; Type: CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.servicios_imagenes
    ADD CONSTRAINT servicios_imagenes_pkey PRIMARY KEY (id);


--
-- Name: servicios servicios_pkey; Type: CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.servicios
    ADD CONSTRAINT servicios_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: tipos_imagenes tipos_imagenes_pkey; Type: CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.tipos_imagenes
    ADD CONSTRAINT tipos_imagenes_pkey PRIMARY KEY (id);


--
-- Name: tipos_servicios tipos_servicios_pkey; Type: CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.tipos_servicios
    ADD CONSTRAINT tipos_servicios_pkey PRIMARY KEY (id);


--
-- Name: tipos_usuarios tipos_usuarios_pkey; Type: CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.tipos_usuarios
    ADD CONSTRAINT tipos_usuarios_pkey PRIMARY KEY (id);


--
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- Name: usuarios usuarios_user_name_unique; Type: CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.usuarios
    ADD CONSTRAINT usuarios_user_name_unique UNIQUE (user_name);


--
-- Name: jobs_queue_index; Type: INDEX; Schema: api_pueblos_magicos; Owner: sail
--

CREATE INDEX jobs_queue_index ON api_pueblos_magicos.jobs USING btree (queue);


--
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: api_pueblos_magicos; Owner: sail
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON api_pueblos_magicos.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- Name: sessions_last_activity_index; Type: INDEX; Schema: api_pueblos_magicos; Owner: sail
--

CREATE INDEX sessions_last_activity_index ON api_pueblos_magicos.sessions USING btree (last_activity);


--
-- Name: sessions_user_id_index; Type: INDEX; Schema: api_pueblos_magicos; Owner: sail
--

CREATE INDEX sessions_user_id_index ON api_pueblos_magicos.sessions USING btree (user_id);


--
-- Name: bitacora bitacora_id_usuario_foreign; Type: FK CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.bitacora
    ADD CONSTRAINT bitacora_id_usuario_foreign FOREIGN KEY (id_usuario) REFERENCES api_pueblos_magicos.usuarios(id);


--
-- Name: direcciones direcciones_id_estado_foreign; Type: FK CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.direcciones
    ADD CONSTRAINT direcciones_id_estado_foreign FOREIGN KEY (id_estado) REFERENCES api_pueblos_magicos.estados(id);


--
-- Name: festividades_detalles festividades_detalles_id_coordenadas_foreign; Type: FK CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.festividades_detalles
    ADD CONSTRAINT festividades_detalles_id_coordenadas_foreign FOREIGN KEY (id_coordenadas) REFERENCES api_pueblos_magicos.coordenadas(id) ON DELETE CASCADE;


--
-- Name: festividades_detalles festividades_detalles_id_servicio_foreign; Type: FK CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.festividades_detalles
    ADD CONSTRAINT festividades_detalles_id_servicio_foreign FOREIGN KEY (id_servicio) REFERENCES api_pueblos_magicos.servicios(id) ON DELETE CASCADE;


--
-- Name: festividades festividades_id_direccion_foreign; Type: FK CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.festividades
    ADD CONSTRAINT festividades_id_direccion_foreign FOREIGN KEY (id_direccion) REFERENCES api_pueblos_magicos.direcciones(id) ON DELETE CASCADE;


--
-- Name: festividades festividades_id_pueblo_foreign; Type: FK CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.festividades
    ADD CONSTRAINT festividades_id_pueblo_foreign FOREIGN KEY (id_pueblo) REFERENCES api_pueblos_magicos.pueblos_magicos(id);


--
-- Name: festividades festividades_id_usuario_foreign; Type: FK CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.festividades
    ADD CONSTRAINT festividades_id_usuario_foreign FOREIGN KEY (id_usuario) REFERENCES api_pueblos_magicos.usuarios(id) ON DELETE CASCADE;


--
-- Name: festividades_imagenes festividades_imagenes_id_festividad_foreign; Type: FK CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.festividades_imagenes
    ADD CONSTRAINT festividades_imagenes_id_festividad_foreign FOREIGN KEY (id_festividad) REFERENCES api_pueblos_magicos.festividades(id) ON DELETE CASCADE;


--
-- Name: festividades_imagenes festividades_imagenes_id_imagen_foreign; Type: FK CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.festividades_imagenes
    ADD CONSTRAINT festividades_imagenes_id_imagen_foreign FOREIGN KEY (id_imagen) REFERENCES api_pueblos_magicos.imagenes(id) ON DELETE CASCADE;


--
-- Name: imagenes imagenes_id_tipo_imagen_foreign; Type: FK CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.imagenes
    ADD CONSTRAINT imagenes_id_tipo_imagen_foreign FOREIGN KEY (id_tipo_imagen) REFERENCES api_pueblos_magicos.tipos_imagenes(id);


--
-- Name: personas pesonas_id_usuario_foreign; Type: FK CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.personas
    ADD CONSTRAINT pesonas_id_usuario_foreign FOREIGN KEY (id_usuario) REFERENCES api_pueblos_magicos.usuarios(id);


--
-- Name: pueblos_magicos pueblos_magicos_id_direccion_foreign; Type: FK CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.pueblos_magicos
    ADD CONSTRAINT pueblos_magicos_id_direccion_foreign FOREIGN KEY (id_direccion) REFERENCES api_pueblos_magicos.direcciones(id);


--
-- Name: pueblos_magicos_imagenes pueblos_magicos_imagenes_id_imagen_foreign; Type: FK CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.pueblos_magicos_imagenes
    ADD CONSTRAINT pueblos_magicos_imagenes_id_imagen_foreign FOREIGN KEY (id_imagen) REFERENCES api_pueblos_magicos.imagenes(id) ON DELETE CASCADE;


--
-- Name: pueblos_magicos_imagenes pueblos_magicos_imagenes_id_pueblo_magico_foreign; Type: FK CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.pueblos_magicos_imagenes
    ADD CONSTRAINT pueblos_magicos_imagenes_id_pueblo_magico_foreign FOREIGN KEY (id_pueblo_magico) REFERENCES api_pueblos_magicos.pueblos_magicos(id) ON DELETE CASCADE;


--
-- Name: pueblos_solicitudes pueblos_solicitudes_id_pueblo_magico_foreign; Type: FK CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.pueblos_solicitudes
    ADD CONSTRAINT pueblos_solicitudes_id_pueblo_magico_foreign FOREIGN KEY (id_pueblo_magico) REFERENCES api_pueblos_magicos.pueblos_magicos(id);


--
-- Name: pueblos_solicitudes pueblos_solicitudes_id_servicio_foreign; Type: FK CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.pueblos_solicitudes
    ADD CONSTRAINT pueblos_solicitudes_id_servicio_foreign FOREIGN KEY (id_servicio) REFERENCES api_pueblos_magicos.servicios(id) ON DELETE CASCADE;


--
-- Name: pueblos_solicitudes pueblos_solicitudes_id_tipo_servicio_foreign; Type: FK CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.pueblos_solicitudes
    ADD CONSTRAINT pueblos_solicitudes_id_tipo_servicio_foreign FOREIGN KEY (id_tipo_servicio) REFERENCES api_pueblos_magicos.tipos_servicios(id);


--
-- Name: ratings ratings_id_servicio_foreign; Type: FK CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.ratings
    ADD CONSTRAINT ratings_id_servicio_foreign FOREIGN KEY (id_servicio) REFERENCES api_pueblos_magicos.servicios(id) ON DELETE CASCADE;


--
-- Name: servicio_detalles servicio_detalles_id_coordenadas_foreign; Type: FK CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.servicio_detalles
    ADD CONSTRAINT servicio_detalles_id_coordenadas_foreign FOREIGN KEY (id_coordenadas) REFERENCES api_pueblos_magicos.coordenadas(id) ON DELETE CASCADE;


--
-- Name: servicio_detalles servicio_detalles_id_horarios_foreign; Type: FK CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.servicio_detalles
    ADD CONSTRAINT servicio_detalles_id_horarios_foreign FOREIGN KEY (id_horarios) REFERENCES api_pueblos_magicos.horarios(id) ON DELETE CASCADE;


--
-- Name: servicio_detalles servicio_detalles_id_servicio_foreign; Type: FK CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.servicio_detalles
    ADD CONSTRAINT servicio_detalles_id_servicio_foreign FOREIGN KEY (id_servicio) REFERENCES api_pueblos_magicos.servicios(id) ON DELETE CASCADE;


--
-- Name: servicios servicios_id_direccion_foreign; Type: FK CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.servicios
    ADD CONSTRAINT servicios_id_direccion_foreign FOREIGN KEY (id_direccion) REFERENCES api_pueblos_magicos.direcciones(id) ON DELETE CASCADE;


--
-- Name: servicios servicios_id_estatus_foreign; Type: FK CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.servicios
    ADD CONSTRAINT servicios_id_estatus_foreign FOREIGN KEY (id_estatus) REFERENCES api_pueblos_magicos.estatus(id);


--
-- Name: servicios servicios_id_pueblo_foreign; Type: FK CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.servicios
    ADD CONSTRAINT servicios_id_pueblo_foreign FOREIGN KEY (id_pueblo) REFERENCES api_pueblos_magicos.pueblos_magicos(id);


--
-- Name: servicios servicios_id_tipo_servicio_foreign; Type: FK CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.servicios
    ADD CONSTRAINT servicios_id_tipo_servicio_foreign FOREIGN KEY (id_tipo_servicio) REFERENCES api_pueblos_magicos.tipos_servicios(id);


--
-- Name: servicios servicios_id_usuario_foreign; Type: FK CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.servicios
    ADD CONSTRAINT servicios_id_usuario_foreign FOREIGN KEY (id_usuario) REFERENCES api_pueblos_magicos.usuarios(id);


--
-- Name: servicios_imagenes servicios_imagenes_id_imagen_foreign; Type: FK CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.servicios_imagenes
    ADD CONSTRAINT servicios_imagenes_id_imagen_foreign FOREIGN KEY (id_imagen) REFERENCES api_pueblos_magicos.imagenes(id) ON DELETE CASCADE;


--
-- Name: servicios_imagenes servicios_imagenes_id_servicio_foreign; Type: FK CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.servicios_imagenes
    ADD CONSTRAINT servicios_imagenes_id_servicio_foreign FOREIGN KEY (id_servicio) REFERENCES api_pueblos_magicos.servicios(id) ON DELETE CASCADE;


--
-- Name: usuarios usuarios_id_tipo_usuario_foreign; Type: FK CONSTRAINT; Schema: api_pueblos_magicos; Owner: sail
--

ALTER TABLE ONLY api_pueblos_magicos.usuarios
    ADD CONSTRAINT usuarios_id_tipo_usuario_foreign FOREIGN KEY (id_tipo_usuario) REFERENCES api_pueblos_magicos.tipos_usuarios(id);


--
-- PostgreSQL database dump complete
--

