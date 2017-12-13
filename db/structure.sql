SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: accounts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE accounts (
    id bigint NOT NULL,
    email character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer,
    password_digest character varying
);


--
-- Name: accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE accounts_id_seq OWNED BY accounts.id;


--
-- Name: addresses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE addresses (
    id bigint NOT NULL,
    street character varying,
    city character varying,
    zip_code character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE addresses_id_seq OWNED BY addresses.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: rentals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rentals (
    id bigint NOT NULL,
    user_id integer,
    treasure_id integer,
    start_date date,
    due_date date,
    return_date date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: rentals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rentals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rentals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rentals_id_seq OWNED BY rentals.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: storages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE storages (
    id bigint NOT NULL,
    name character varying,
    address_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    owner_id integer
);


--
-- Name: storages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE storages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: storages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE storages_id_seq OWNED BY storages.id;


--
-- Name: treasures; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE treasures (
    id bigint NOT NULL,
    owner_id integer,
    type_id integer,
    storage_id integer,
    trashed boolean,
    title character varying,
    description character varying,
    special_note character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: treasures_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE treasures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: treasures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE treasures_id_seq OWNED BY treasures.id;


--
-- Name: types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE types (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE types_id_seq OWNED BY types.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE users (
    id bigint NOT NULL,
    first_name character varying,
    last_name character varying,
    age integer,
    address_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: accounts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY accounts ALTER COLUMN id SET DEFAULT nextval('accounts_id_seq'::regclass);


--
-- Name: addresses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY addresses ALTER COLUMN id SET DEFAULT nextval('addresses_id_seq'::regclass);


--
-- Name: rentals id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rentals ALTER COLUMN id SET DEFAULT nextval('rentals_id_seq'::regclass);


--
-- Name: storages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY storages ALTER COLUMN id SET DEFAULT nextval('storages_id_seq'::regclass);


--
-- Name: treasures id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY treasures ALTER COLUMN id SET DEFAULT nextval('treasures_id_seq'::regclass);


--
-- Name: types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY types ALTER COLUMN id SET DEFAULT nextval('types_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: accounts accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: rentals rentals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rentals
    ADD CONSTRAINT rentals_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: storages storages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY storages
    ADD CONSTRAINT storages_pkey PRIMARY KEY (id);


--
-- Name: treasures treasures_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY treasures
    ADD CONSTRAINT treasures_pkey PRIMARY KEY (id);


--
-- Name: types types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY types
    ADD CONSTRAINT types_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_accounts_on_password_digest; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_accounts_on_password_digest ON accounts USING btree (password_digest);


--
-- Name: index_accounts_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_accounts_on_user_id ON accounts USING btree (user_id);


--
-- Name: index_rentals_on_treasure_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rentals_on_treasure_id ON rentals USING btree (treasure_id);


--
-- Name: index_rentals_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rentals_on_user_id ON rentals USING btree (user_id);


--
-- Name: index_storages_on_address_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_storages_on_address_id ON storages USING btree (address_id);


--
-- Name: index_storages_on_owner_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_storages_on_owner_id ON storages USING btree (owner_id);


--
-- Name: index_treasures_on_owner_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_treasures_on_owner_id ON treasures USING btree (owner_id);


--
-- Name: index_treasures_on_storage_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_treasures_on_storage_id ON treasures USING btree (storage_id);


--
-- Name: index_treasures_on_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_treasures_on_type_id ON treasures USING btree (type_id);


--
-- Name: index_users_on_address_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_address_id ON users USING btree (address_id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20171128102235'),
('20171128102438'),
('20171128102624'),
('20171128103736'),
('20171128104403'),
('20171128105818'),
('20171129144935'),
('20171129145123'),
('20171129145212'),
('20171129145309'),
('20171201103626'),
('20171201104505'),
('20171201104828'),
('20171201105058'),
('20171201105235'),
('20171201105406'),
('20171201105555'),
('20171201105807'),
('20171201105923'),
('20171210174435'),
('20171210225145'),
('20171211140923'),
('20171212115559'),
('20171212115744');


