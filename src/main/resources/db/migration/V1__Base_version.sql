--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.0
-- Dumped by pg_dump version 9.5.0

-- Started on 2016-05-05 11:32:55

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 16953)
-- Name: cards; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cards (
    id integer NOT NULL,
    card_date timestamp(6) without time zone NOT NULL,
    obs_date timestamp(6) without time zone NOT NULL,
    obs_department_id integer NOT NULL,
    plant_id integer NOT NULL,
    selected_fields json,
    comment character varying(1024),
    user_group_id integer NOT NULL,
    selected_categories json,
    user_department_id integer NOT NULL,
    user_id integer NOT NULL
);


--
-- TOC entry 181 (class 1259 OID 16959)
-- Name: cards_sec; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cards_sec
    START WITH 5
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2206 (class 0 OID 0)
-- Dependencies: 181
-- Name: cards_sec; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cards_sec OWNED BY cards.id;


--
-- TOC entry 183 (class 1259 OID 16963)
-- Name: obs_categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE obs_categories (
    id integer NOT NULL,
    name json NOT NULL,
    plant_id integer NOT NULL
);


--
-- TOC entry 184 (class 1259 OID 16969)
-- Name: obs_cat_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE obs_cat_id
    START WITH 5
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2207 (class 0 OID 0)
-- Dependencies: 184
-- Name: obs_cat_id; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE obs_cat_id OWNED BY obs_categories.id;


--
-- TOC entry 185 (class 1259 OID 16971)
-- Name: obs_departments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE obs_departments (
    id integer NOT NULL,
    name json,
    plant_id integer
);


--
-- TOC entry 186 (class 1259 OID 16977)
-- Name: obs_dep_sec; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE obs_dep_sec
    START WITH 5
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2208 (class 0 OID 0)
-- Dependencies: 186
-- Name: obs_dep_sec; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE obs_dep_sec OWNED BY obs_departments.id;


--
-- TOC entry 187 (class 1259 OID 16979)
-- Name: obs_fields; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE obs_fields (
    id integer NOT NULL,
    cat_id integer NOT NULL,
    name json NOT NULL,
    description json
);


--
-- TOC entry 188 (class 1259 OID 16985)
-- Name: obs_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE obs_fields_id_seq
    START WITH 39
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2209 (class 0 OID 0)
-- Dependencies: 188
-- Name: obs_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE obs_fields_id_seq OWNED BY obs_fields.id;


--
-- TOC entry 189 (class 1259 OID 16987)
-- Name: plants; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE plants (
    id integer NOT NULL,
    plant_code character varying(255) NOT NULL,
    description character varying(255),
    parent_plant_id integer
);


--
-- TOC entry 190 (class 1259 OID 16993)
-- Name: plants_sec; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE plants_sec
    START WITH 5
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2210 (class 0 OID 0)
-- Dependencies: 190
-- Name: plants_sec; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE plants_sec OWNED BY plants.id;


--
-- TOC entry 191 (class 1259 OID 16995)
-- Name: user_departments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE user_departments (
    id integer NOT NULL,
    name json NOT NULL,
    plant_id integer NOT NULL
);


--
-- TOC entry 192 (class 1259 OID 17001)
-- Name: user_departments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE user_departments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2211 (class 0 OID 0)
-- Dependencies: 192
-- Name: user_departments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE user_departments_id_seq OWNED BY user_departments.id;


--
-- TOC entry 193 (class 1259 OID 17003)
-- Name: user_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE user_groups (
    id integer NOT NULL,
    name character varying(35) NOT NULL,
    cards_count integer DEFAULT 0 NOT NULL,
    plant_id integer NOT NULL
);


--
-- TOC entry 194 (class 1259 OID 17007)
-- Name: user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE user_groups_id_seq
    START WITH 10
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2212 (class 0 OID 0)
-- Dependencies: 194
-- Name: user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE user_groups_id_seq OWNED BY user_groups.id;


--
-- TOC entry 195 (class 1259 OID 17009)
-- Name: user_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE user_roles (
    id integer NOT NULL,
    name character varying(128) NOT NULL
);


--
-- TOC entry 196 (class 1259 OID 17012)
-- Name: user_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE user_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2213 (class 0 OID 0)
-- Dependencies: 196
-- Name: user_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE user_roles_id_seq OWNED BY user_roles.id;


--
-- TOC entry 197 (class 1259 OID 17014)
-- Name: users; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 198 (class 1259 OID 17021)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2214 (class 0 OID 0)
-- Dependencies: 198
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- TOC entry 2033 (class 2604 OID 17023)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cards ALTER COLUMN id SET DEFAULT nextval('cards_sec'::regclass);


--
-- TOC entry 2034 (class 2604 OID 17024)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY obs_categories ALTER COLUMN id SET DEFAULT nextval('obs_cat_id'::regclass);


--
-- TOC entry 2035 (class 2604 OID 17025)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY obs_departments ALTER COLUMN id SET DEFAULT nextval('obs_dep_sec'::regclass);


--
-- TOC entry 2036 (class 2604 OID 17026)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY obs_fields ALTER COLUMN id SET DEFAULT nextval('obs_fields_id_seq'::regclass);


--
-- TOC entry 2037 (class 2604 OID 17027)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY plants ALTER COLUMN id SET DEFAULT nextval('plants_sec'::regclass);


--
-- TOC entry 2038 (class 2604 OID 17028)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_departments ALTER COLUMN id SET DEFAULT nextval('user_departments_id_seq'::regclass);


--
-- TOC entry 2040 (class 2604 OID 17029)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_groups ALTER COLUMN id SET DEFAULT nextval('user_groups_id_seq'::regclass);


--
-- TOC entry 2041 (class 2604 OID 17030)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_roles ALTER COLUMN id SET DEFAULT nextval('user_roles_id_seq'::regclass);


--
-- TOC entry 2043 (class 2604 OID 17031)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- TOC entry 2045 (class 2606 OID 17033)
-- Name: cards_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cards
    ADD CONSTRAINT cards_id_key UNIQUE (id);


--
-- TOC entry 2047 (class 2606 OID 17035)
-- Name: cards_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cards
    ADD CONSTRAINT cards_pkey PRIMARY KEY (id);


--
-- TOC entry 2051 (class 2606 OID 17037)
-- Name: obs_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY obs_categories
    ADD CONSTRAINT obs_categories_pkey PRIMARY KEY (id);


--
-- TOC entry 2053 (class 2606 OID 17039)
-- Name: obs_departments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY obs_departments
    ADD CONSTRAINT obs_departments_pkey PRIMARY KEY (id);


--
-- TOC entry 2055 (class 2606 OID 17041)
-- Name: obs_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY obs_fields
    ADD CONSTRAINT obs_fields_pkey PRIMARY KEY (id);


--
-- TOC entry 2057 (class 2606 OID 17043)
-- Name: plants_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY plants
    ADD CONSTRAINT plants_id_key UNIQUE (id);


--
-- TOC entry 2059 (class 2606 OID 17045)
-- Name: plants_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY plants
    ADD CONSTRAINT plants_pkey PRIMARY KEY (id);


--
-- TOC entry 2061 (class 2606 OID 17047)
-- Name: user_departments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_departments
    ADD CONSTRAINT user_departments_pkey PRIMARY KEY (id);


--
-- TOC entry 2067 (class 2606 OID 17049)
-- Name: user_email; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT user_email UNIQUE (email);


--
-- TOC entry 2063 (class 2606 OID 17051)
-- Name: user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_groups
    ADD CONSTRAINT user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2065 (class 2606 OID 17053)
-- Name: user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (id);


--
-- TOC entry 2069 (class 2606 OID 17055)
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2048 (class 1259 OID 17142)
-- Name: fki_user_department_id_fkey; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fki_user_department_id_fkey ON cards USING btree (user_department_id);


--
-- TOC entry 2049 (class 1259 OID 17148)
-- Name: fki_user_id_fkey; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fki_user_id_fkey ON cards USING btree (user_id);


--
-- TOC entry 2070 (class 2606 OID 17056)
-- Name: cards_obs_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cards
    ADD CONSTRAINT cards_obs_department_id_fkey FOREIGN KEY (obs_department_id) REFERENCES obs_departments(id);


--
-- TOC entry 2071 (class 2606 OID 17061)
-- Name: cards_plant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cards
    ADD CONSTRAINT cards_plant_id_fkey FOREIGN KEY (plant_id) REFERENCES plants(id);


--
-- TOC entry 2072 (class 2606 OID 17066)
-- Name: cards_user_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cards
    ADD CONSTRAINT cards_user_group_id_fkey FOREIGN KEY (user_group_id) REFERENCES user_groups(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2078 (class 2606 OID 17071)
-- Name: fk8xv38p2bjm3f8yl8dmtqj9yac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY plants
    ADD CONSTRAINT fk8xv38p2bjm3f8yl8dmtqj9yac FOREIGN KEY (parent_plant_id) REFERENCES plants(id);


--
-- TOC entry 2075 (class 2606 OID 17076)
-- Name: obs_categories_plant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY obs_categories
    ADD CONSTRAINT obs_categories_plant_id_fkey FOREIGN KEY (plant_id) REFERENCES plants(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2076 (class 2606 OID 17081)
-- Name: obs_departments_plant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY obs_departments
    ADD CONSTRAINT obs_departments_plant_id_fkey FOREIGN KEY (plant_id) REFERENCES plants(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2077 (class 2606 OID 17086)
-- Name: obs_fields_cat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY obs_fields
    ADD CONSTRAINT obs_fields_cat_id_fkey FOREIGN KEY (cat_id) REFERENCES obs_categories(id);


--
-- TOC entry 2079 (class 2606 OID 17091)
-- Name: plants_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY plants
    ADD CONSTRAINT plants_id_fkey FOREIGN KEY (id) REFERENCES plants(id);


--
-- TOC entry 2080 (class 2606 OID 17096)
-- Name: plants_parent_plant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY plants
    ADD CONSTRAINT plants_parent_plant_id_fkey FOREIGN KEY (parent_plant_id) REFERENCES plants(id);


--
-- TOC entry 2081 (class 2606 OID 17101)
-- Name: plants_parent_plant_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY plants
    ADD CONSTRAINT plants_parent_plant_id_fkey1 FOREIGN KEY (parent_plant_id) REFERENCES plants(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2073 (class 2606 OID 17137)
-- Name: user_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cards
    ADD CONSTRAINT user_department_id_fkey FOREIGN KEY (user_department_id) REFERENCES user_departments(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2082 (class 2606 OID 17106)
-- Name: user_departments_plant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_departments
    ADD CONSTRAINT user_departments_plant_id_fkey FOREIGN KEY (plant_id) REFERENCES plants(id);


--
-- TOC entry 2083 (class 2606 OID 17111)
-- Name: user_groups_plant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_groups
    ADD CONSTRAINT user_groups_plant_id_fkey FOREIGN KEY (plant_id) REFERENCES plants(id);


--
-- TOC entry 2074 (class 2606 OID 17143)
-- Name: user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cards
    ADD CONSTRAINT user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2084 (class 2606 OID 17116)
-- Name: user_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT user_role_id_fkey FOREIGN KEY (role_id) REFERENCES user_roles(id);


--
-- TOC entry 2085 (class 2606 OID 17121)
-- Name: users_plant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_plant_id_fkey FOREIGN KEY (plant_id) REFERENCES plants(id);


--
-- TOC entry 2086 (class 2606 OID 17126)
-- Name: users_user_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_user_department_id_fkey FOREIGN KEY (user_department_id) REFERENCES user_departments(id);


--
-- TOC entry 2087 (class 2606 OID 17131)
-- Name: users_user_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_user_group_id_fkey FOREIGN KEY (user_group_id) REFERENCES user_groups(id);



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

-- Completed on 2016-05-05 11:32:55

--
-- PostgreSQL database dump complete
--

