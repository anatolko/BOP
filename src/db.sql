--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.0
-- Dumped by pg_dump version 9.5.0

-- Started on 2016-04-05 15:57:53

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE "RULIPBOP";
--
-- TOC entry 2207 (class 1262 OID 16394)
-- Name: RULIPBOP; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "RULIPBOP" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';


ALTER DATABASE "RULIPBOP" OWNER TO postgres;

\connect "RULIPBOP"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 2208 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 199 (class 3079 OID 12355)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2210 (class 0 OID 0)
-- Dependencies: 199
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 189 (class 1259 OID 16413)
-- Name: cards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cards (
    id integer NOT NULL,
    card_date timestamp(6) without time zone NOT NULL,
    obs_date timestamp(6) without time zone NOT NULL,
    ad_account character varying(255) NOT NULL,
    user_department character varying(255) NOT NULL,
    obs_department_id integer NOT NULL,
    plant_id integer NOT NULL,
    selected_fields json,
    comment character varying(1024),
    user_group_id integer NOT NULL,
    selected_categories json
);


ALTER TABLE cards OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 16395)
-- Name: cards_sec; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cards_sec
    START WITH 5
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cards_sec OWNER TO postgres;

--
-- TOC entry 2211 (class 0 OID 0)
-- Dependencies: 180
-- Name: cards_sec; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cards_sec OWNED BY cards.id;


--
-- TOC entry 181 (class 1259 OID 16397)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hibernate_sequence
    START WITH 75
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hibernate_sequence OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 16420)
-- Name: obs_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE obs_categories (
    id integer NOT NULL,
    name json NOT NULL,
    plant_id integer NOT NULL
);


ALTER TABLE obs_categories OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 16399)
-- Name: obs_cat_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE obs_cat_id
    START WITH 5
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE obs_cat_id OWNER TO postgres;

--
-- TOC entry 2212 (class 0 OID 0)
-- Dependencies: 182
-- Name: obs_cat_id; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE obs_cat_id OWNED BY obs_categories.id;


--
-- TOC entry 191 (class 1259 OID 16427)
-- Name: obs_departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE obs_departments (
    id integer NOT NULL,
    name json,
    plant_id integer
);


ALTER TABLE obs_departments OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 16401)
-- Name: obs_dep_sec; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE obs_dep_sec
    START WITH 5
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE obs_dep_sec OWNER TO postgres;

--
-- TOC entry 2213 (class 0 OID 0)
-- Dependencies: 183
-- Name: obs_dep_sec; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE obs_dep_sec OWNED BY obs_departments.id;


--
-- TOC entry 192 (class 1259 OID 16434)
-- Name: obs_fields; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE obs_fields (
    id integer NOT NULL,
    cat_id integer NOT NULL,
    name json NOT NULL,
    description json
);


ALTER TABLE obs_fields OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 16403)
-- Name: obs_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE obs_fields_id_seq
    START WITH 39
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE obs_fields_id_seq OWNER TO postgres;

--
-- TOC entry 2214 (class 0 OID 0)
-- Dependencies: 184
-- Name: obs_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE obs_fields_id_seq OWNED BY obs_fields.id;


--
-- TOC entry 193 (class 1259 OID 16441)
-- Name: plants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE plants (
    id integer NOT NULL,
    plant_code character varying(255) NOT NULL,
    description character varying(255),
    parent_plant_id integer
);


ALTER TABLE plants OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 16405)
-- Name: plants_sec; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE plants_sec
    START WITH 5
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE plants_sec OWNER TO postgres;

--
-- TOC entry 2215 (class 0 OID 0)
-- Dependencies: 185
-- Name: plants_sec; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE plants_sec OWNED BY plants.id;


--
-- TOC entry 194 (class 1259 OID 16448)
-- Name: user_departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE user_departments (
    id integer NOT NULL,
    name json NOT NULL,
    plant_id integer NOT NULL
);


ALTER TABLE user_departments OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 16407)
-- Name: user_departments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_departments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_departments_id_seq OWNER TO postgres;

--
-- TOC entry 2216 (class 0 OID 0)
-- Dependencies: 186
-- Name: user_departments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_departments_id_seq OWNED BY user_departments.id;


--
-- TOC entry 195 (class 1259 OID 16455)
-- Name: user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE user_groups (
    id integer NOT NULL,
    name character varying(35) NOT NULL,
    cards_count integer DEFAULT 0 NOT NULL,
    plant_id integer NOT NULL
);


ALTER TABLE user_groups OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 16409)
-- Name: user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_groups_id_seq
    START WITH 10
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_groups_id_seq OWNER TO postgres;

--
-- TOC entry 2217 (class 0 OID 0)
-- Dependencies: 187
-- Name: user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_groups_id_seq OWNED BY user_groups.id;


--
-- TOC entry 198 (class 1259 OID 16689)
-- Name: user_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE user_roles (
    id integer NOT NULL,
    name character varying(128) NOT NULL
);


ALTER TABLE user_roles OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 16687)
-- Name: user_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_roles_id_seq OWNER TO postgres;

--
-- TOC entry 2218 (class 0 OID 0)
-- Dependencies: 197
-- Name: user_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_roles_id_seq OWNED BY user_roles.id;


--
-- TOC entry 196 (class 1259 OID 16460)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users (
    id integer NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255),
    ad_account character varying(255) NOT NULL,
    user_department_id integer NOT NULL,
    user_group_id integer NOT NULL,
    plant_id integer NOT NULL,
    email character varying(255) NOT NULL,
    role_id integer DEFAULT 3 NOT NULL,
    passhash text NOT NULL
);


ALTER TABLE users OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 16411)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO postgres;

--
-- TOC entry 2219 (class 0 OID 0)
-- Dependencies: 188
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- TOC entry 2038 (class 2604 OID 16416)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cards ALTER COLUMN id SET DEFAULT nextval('cards_sec'::regclass);


--
-- TOC entry 2039 (class 2604 OID 16423)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY obs_categories ALTER COLUMN id SET DEFAULT nextval('obs_cat_id'::regclass);


--
-- TOC entry 2040 (class 2604 OID 16430)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY obs_departments ALTER COLUMN id SET DEFAULT nextval('obs_dep_sec'::regclass);


--
-- TOC entry 2041 (class 2604 OID 16437)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY obs_fields ALTER COLUMN id SET DEFAULT nextval('obs_fields_id_seq'::regclass);


--
-- TOC entry 2042 (class 2604 OID 16444)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY plants ALTER COLUMN id SET DEFAULT nextval('plants_sec'::regclass);


--
-- TOC entry 2043 (class 2604 OID 16451)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_departments ALTER COLUMN id SET DEFAULT nextval('user_departments_id_seq'::regclass);


--
-- TOC entry 2044 (class 2604 OID 16458)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_groups ALTER COLUMN id SET DEFAULT nextval('user_groups_id_seq'::regclass);


--
-- TOC entry 2048 (class 2604 OID 16692)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_roles ALTER COLUMN id SET DEFAULT nextval('user_roles_id_seq'::regclass);


--
-- TOC entry 2046 (class 2604 OID 16463)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- TOC entry 2050 (class 2606 OID 16470)
-- Name: cards_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cards
    ADD CONSTRAINT cards_id_key UNIQUE (id);


--
-- TOC entry 2052 (class 2606 OID 16472)
-- Name: cards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cards
    ADD CONSTRAINT cards_pkey PRIMARY KEY (id);


--
-- TOC entry 2054 (class 2606 OID 16474)
-- Name: obs_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY obs_categories
    ADD CONSTRAINT obs_categories_pkey PRIMARY KEY (id);


--
-- TOC entry 2056 (class 2606 OID 16476)
-- Name: obs_departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY obs_departments
    ADD CONSTRAINT obs_departments_pkey PRIMARY KEY (id);


--
-- TOC entry 2058 (class 2606 OID 16478)
-- Name: obs_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY obs_fields
    ADD CONSTRAINT obs_fields_pkey PRIMARY KEY (id);


--
-- TOC entry 2060 (class 2606 OID 16480)
-- Name: plants_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY plants
    ADD CONSTRAINT plants_id_key UNIQUE (id);


--
-- TOC entry 2062 (class 2606 OID 16482)
-- Name: plants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY plants
    ADD CONSTRAINT plants_pkey PRIMARY KEY (id);


--
-- TOC entry 2064 (class 2606 OID 16484)
-- Name: user_departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_departments
    ADD CONSTRAINT user_departments_pkey PRIMARY KEY (id);


--
-- TOC entry 2068 (class 2606 OID 16686)
-- Name: user_email; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT user_email UNIQUE (email);


--
-- TOC entry 2066 (class 2606 OID 16486)
-- Name: user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_groups
    ADD CONSTRAINT user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2072 (class 2606 OID 16694)
-- Name: user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (id);


--
-- TOC entry 2070 (class 2606 OID 16488)
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2075 (class 2606 OID 16504)
-- Name: cards_obs_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cards
    ADD CONSTRAINT cards_obs_department_id_fkey FOREIGN KEY (obs_department_id) REFERENCES obs_departments(id);


--
-- TOC entry 2074 (class 2606 OID 16499)
-- Name: cards_plant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cards
    ADD CONSTRAINT cards_plant_id_fkey FOREIGN KEY (plant_id) REFERENCES plants(id);


--
-- TOC entry 2073 (class 2606 OID 16489)
-- Name: cards_user_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cards
    ADD CONSTRAINT cards_user_group_id_fkey FOREIGN KEY (user_group_id) REFERENCES user_groups(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2082 (class 2606 OID 16645)
-- Name: fk8xv38p2bjm3f8yl8dmtqj9yac; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY plants
    ADD CONSTRAINT fk8xv38p2bjm3f8yl8dmtqj9yac FOREIGN KEY (parent_plant_id) REFERENCES plants(id);


--
-- TOC entry 2076 (class 2606 OID 16519)
-- Name: obs_categories_plant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY obs_categories
    ADD CONSTRAINT obs_categories_plant_id_fkey FOREIGN KEY (plant_id) REFERENCES plants(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2077 (class 2606 OID 16529)
-- Name: obs_departments_plant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY obs_departments
    ADD CONSTRAINT obs_departments_plant_id_fkey FOREIGN KEY (plant_id) REFERENCES plants(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2078 (class 2606 OID 16539)
-- Name: obs_fields_cat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY obs_fields
    ADD CONSTRAINT obs_fields_cat_id_fkey FOREIGN KEY (cat_id) REFERENCES obs_categories(id);


--
-- TOC entry 2081 (class 2606 OID 16559)
-- Name: plants_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY plants
    ADD CONSTRAINT plants_id_fkey FOREIGN KEY (id) REFERENCES plants(id);


--
-- TOC entry 2079 (class 2606 OID 16549)
-- Name: plants_parent_plant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY plants
    ADD CONSTRAINT plants_parent_plant_id_fkey FOREIGN KEY (parent_plant_id) REFERENCES plants(id);


--
-- TOC entry 2080 (class 2606 OID 16554)
-- Name: plants_parent_plant_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY plants
    ADD CONSTRAINT plants_parent_plant_id_fkey1 FOREIGN KEY (parent_plant_id) REFERENCES plants(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2083 (class 2606 OID 16564)
-- Name: user_departments_plant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_departments
    ADD CONSTRAINT user_departments_plant_id_fkey FOREIGN KEY (plant_id) REFERENCES plants(id);


--
-- TOC entry 2084 (class 2606 OID 16574)
-- Name: user_groups_plant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_groups
    ADD CONSTRAINT user_groups_plant_id_fkey FOREIGN KEY (plant_id) REFERENCES plants(id);


--
-- TOC entry 2088 (class 2606 OID 16704)
-- Name: user_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT user_role_id_fkey FOREIGN KEY (role_id) REFERENCES user_roles(id);


--
-- TOC entry 2085 (class 2606 OID 16584)
-- Name: users_plant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_plant_id_fkey FOREIGN KEY (plant_id) REFERENCES plants(id);


--
-- TOC entry 2087 (class 2606 OID 16599)
-- Name: users_user_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_user_department_id_fkey FOREIGN KEY (user_department_id) REFERENCES user_departments(id);


--
-- TOC entry 2086 (class 2606 OID 16594)
-- Name: users_user_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_user_group_id_fkey FOREIGN KEY (user_group_id) REFERENCES user_groups(id);


--
-- TOC entry 2209 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-04-05 15:57:53

--
-- PostgreSQL database dump complete
--

