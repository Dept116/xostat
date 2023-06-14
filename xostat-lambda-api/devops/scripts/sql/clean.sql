--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3 (Debian 15.3-1.pgdg110+1)
-- Dumped by pg_dump version 15.3 (Debian 15.3-1.pgdg110+1)

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

DROP DATABASE xodat;
--
-- Name: xodat; Type: DATABASE; Schema: -; Owner: dev
--

CREATE DATABASE xodat WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE xodat OWNER TO dev;

\connect xodat

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
-- Name: build_parts; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE public.build_parts (
    build_id uuid NOT NULL,
    part_id integer NOT NULL
);


ALTER TABLE public.build_parts OWNER TO dev;

--
-- Name: TABLE build_parts; Type: COMMENT; Schema: public; Owner: dev
--

COMMENT ON TABLE public.build_parts IS 'Parts for a build';


--
-- Name: builds; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE public.builds (
    id uuid NOT NULL,
    build_hash character varying NOT NULL,
    power_score smallint NOT NULL
);


ALTER TABLE public.builds OWNER TO dev;

--
-- Name: match_player_resources; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE public.match_player_resources (
    match_player_id uuid NOT NULL,
    resource_id smallint NOT NULL,
    amount integer NOT NULL
);


ALTER TABLE public.match_player_resources OWNER TO dev;

--
-- Name: TABLE match_player_resources; Type: COMMENT; Schema: public; Owner: dev
--

COMMENT ON TABLE public.match_player_resources IS 'Resources for user in match.';


--
-- Name: match_players; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE public.match_players (
    id uuid NOT NULL,
    match_id bigint NOT NULL,
    user_id integer NOT NULL,
    bot boolean NOT NULL,
    nickname character varying NOT NULL,
    team smallint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.match_players OWNER TO dev;

--
-- Name: matches; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE public.matches (
    id bigint NOT NULL,
    type character varying NOT NULL,
    classification smallint NOT NULL,
    start_at timestamp without time zone NOT NULL,
    end_at timestamp without time zone NOT NULL,
    map_name character varying NOT NULL,
    winning_team smallint NOT NULL,
    win_condition smallint NOT NULL,
    client_version character varying NOT NULL,
    co_driver_version character varying NOT NULL,
    host_name character varying NOT NULL
);


ALTER TABLE public.matches OWNER TO dev;

--
-- Name: TABLE matches; Type: COMMENT; Schema: public; Owner: dev
--

COMMENT ON TABLE public.matches IS 'match attributes';


--
-- Name: COLUMN matches.id; Type: COMMENT; Schema: public; Owner: dev
--

COMMENT ON COLUMN public.matches.id IS 'match id';


--
-- Name: medals; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE public.medals (
    id integer NOT NULL,
    medal character varying NOT NULL
);


ALTER TABLE public.medals OWNER TO dev;

--
-- Name: medal_types_id_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE public.medal_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.medal_types_id_seq OWNER TO dev;

--
-- Name: medal_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE public.medal_types_id_seq OWNED BY public.medals.id;


--
-- Name: parts; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE public.parts (
    id integer NOT NULL,
    part character varying NOT NULL
);


ALTER TABLE public.parts OWNER TO dev;

--
-- Name: parts_id_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE public.parts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.parts_id_seq OWNER TO dev;

--
-- Name: parts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE public.parts_id_seq OWNED BY public.parts.id;


--
-- Name: resource_prices; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE public.resource_prices (
    id timestamp without time zone NOT NULL,
    resource_id integer NOT NULL,
    price double precision NOT NULL
);


ALTER TABLE public.resource_prices OWNER TO dev;

--
-- Name: TABLE resource_prices; Type: COMMENT; Schema: public; Owner: dev
--

COMMENT ON TABLE public.resource_prices IS 'price per single unit of the resource';


--
-- Name: resources; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE public.resources (
    id integer NOT NULL,
    resource character varying NOT NULL
);


ALTER TABLE public.resources OWNER TO dev;

--
-- Name: resources_id_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE public.resources_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resources_id_seq OWNER TO dev;

--
-- Name: resources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE public.resources_id_seq OWNED BY public.resources.id;


--
-- Name: round_player_damages; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE public.round_player_damages (
    round_player_id uuid NOT NULL,
    weapon_id integer NOT NULL,
    damage numeric NOT NULL
);


ALTER TABLE public.round_player_damages OWNER TO dev;

--
-- Name: round_player_medals; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE public.round_player_medals (
    round_player_id uuid NOT NULL,
    medal_id integer NOT NULL,
    amount integer NOT NULL
);


ALTER TABLE public.round_player_medals OWNER TO dev;

--
-- Name: TABLE round_player_medals; Type: COMMENT; Schema: public; Owner: dev
--

COMMENT ON TABLE public.round_player_medals IS 'Medals earned for a player within a round.';


--
-- Name: round_player_scores; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE public.round_player_scores (
    round_player_id uuid NOT NULL,
    score_type_id integer NOT NULL,
    score integer NOT NULL
);


ALTER TABLE public.round_player_scores OWNER TO dev;

--
-- Name: TABLE round_player_scores; Type: COMMENT; Schema: public; Owner: dev
--

COMMENT ON TABLE public.round_player_scores IS 'score breakdown for a round within a match for a player.';


--
-- Name: round_players; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE public.round_players (
    id uuid NOT NULL,
    match_id bigint NOT NULL,
    round_id uuid NOT NULL,
    user_id integer NOT NULL,
    build_hash character varying NOT NULL,
    power_score smallint NOT NULL,
    kills smallint NOT NULL,
    assists smallint NOT NULL,
    drone_kills smallint NOT NULL,
    deaths smallint NOT NULL,
    score integer NOT NULL,
    damage numeric NOT NULL,
    damage_received numeric NOT NULL
);


ALTER TABLE public.round_players OWNER TO dev;

--
-- Name: TABLE round_players; Type: COMMENT; Schema: public; Owner: dev
--

COMMENT ON TABLE public.round_players IS 'Player records within a round.';


--
-- Name: rounds; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE public.rounds (
    id uuid NOT NULL,
    match_id bigint NOT NULL,
    round_number integer NOT NULL,
    start_at timestamp without time zone NOT NULL,
    end_at timestamp without time zone NOT NULL,
    winning_team smallint NOT NULL
);


ALTER TABLE public.rounds OWNER TO dev;

--
-- Name: TABLE rounds; Type: COMMENT; Schema: public; Owner: dev
--

COMMENT ON TABLE public.rounds IS 'round attributes';


--
-- Name: scores; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE public.scores (
    id integer NOT NULL,
    score_type character varying NOT NULL
);


ALTER TABLE public.scores OWNER TO dev;

--
-- Name: score_types_id_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE public.score_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.score_types_id_seq OWNER TO dev;

--
-- Name: score_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE public.score_types_id_seq OWNED BY public.scores.id;


--
-- Name: uploads; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE public.uploads (
    id bigint NOT NULL,
    match_id bigint NOT NULL,
    uploaded_at timestamp without time zone NOT NULL,
    uploader_user_id integer NOT NULL
);


ALTER TABLE public.uploads OWNER TO dev;

--
-- Name: TABLE uploads; Type: COMMENT; Schema: public; Owner: dev
--

COMMENT ON TABLE public.uploads IS 'track uploads to xostat.gg';


--
-- Name: COLUMN uploads.id; Type: COMMENT; Schema: public; Owner: dev
--

COMMENT ON COLUMN public.uploads.id IS 'upload record id';


--
-- Name: uploads_id_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

ALTER TABLE public.uploads ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.uploads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: weapons; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE public.weapons (
    id integer NOT NULL,
    weapon character varying NOT NULL
);


ALTER TABLE public.weapons OWNER TO dev;

--
-- Name: weapons_id_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE public.weapons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.weapons_id_seq OWNER TO dev;

--
-- Name: weapons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE public.weapons_id_seq OWNED BY public.weapons.id;


--
-- Name: medals id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.medals ALTER COLUMN id SET DEFAULT nextval('public.medal_types_id_seq'::regclass);


--
-- Name: parts id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.parts ALTER COLUMN id SET DEFAULT nextval('public.parts_id_seq'::regclass);


--
-- Name: resources id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.resources ALTER COLUMN id SET DEFAULT nextval('public.resources_id_seq'::regclass);


--
-- Name: scores id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.scores ALTER COLUMN id SET DEFAULT nextval('public.score_types_id_seq'::regclass);


--
-- Name: weapons id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.weapons ALTER COLUMN id SET DEFAULT nextval('public.weapons_id_seq'::regclass);


--
-- Name: build_parts build_parts_un; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.build_parts
    ADD CONSTRAINT build_parts_un UNIQUE (build_id, part_id);


--
-- Name: builds builds_pk; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.builds
    ADD CONSTRAINT builds_pk PRIMARY KEY (id);


--
-- Name: builds builds_un; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.builds
    ADD CONSTRAINT builds_un UNIQUE (build_hash, power_score);


--
-- Name: match_players match_player_pk; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.match_players
    ADD CONSTRAINT match_player_pk PRIMARY KEY (id);


--
-- Name: match_player_resources match_player_resources_un; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.match_player_resources
    ADD CONSTRAINT match_player_resources_un UNIQUE (match_player_id, resource_id);


--
-- Name: match_players match_player_un; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.match_players
    ADD CONSTRAINT match_player_un UNIQUE (match_id, user_id);


--
-- Name: matches matches_pk; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT matches_pk PRIMARY KEY (id);


--
-- Name: medals medal_types_pk; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.medals
    ADD CONSTRAINT medal_types_pk PRIMARY KEY (id);


--
-- Name: medals medal_types_un; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.medals
    ADD CONSTRAINT medal_types_un UNIQUE (medal);


--
-- Name: parts parts_pk; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.parts
    ADD CONSTRAINT parts_pk PRIMARY KEY (id);


--
-- Name: parts parts_un; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.parts
    ADD CONSTRAINT parts_un UNIQUE (part);


--
-- Name: round_player_damages player_round_damages_un; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.round_player_damages
    ADD CONSTRAINT player_round_damages_un UNIQUE (round_player_id, weapon_id);


--
-- Name: round_player_medals player_round_medals_un; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.round_player_medals
    ADD CONSTRAINT player_round_medals_un UNIQUE (round_player_id, medal_id);


--
-- Name: round_player_scores player_round_scores_un; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.round_player_scores
    ADD CONSTRAINT player_round_scores_un UNIQUE (round_player_id, score_type_id);


--
-- Name: round_players player_rounds_pk; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.round_players
    ADD CONSTRAINT player_rounds_pk PRIMARY KEY (id);


--
-- Name: round_players player_rounds_un; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.round_players
    ADD CONSTRAINT player_rounds_un UNIQUE (match_id, round_id, user_id);


--
-- Name: round_players player_rounds_un_round; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.round_players
    ADD CONSTRAINT player_rounds_un_round UNIQUE (round_id, user_id);


--
-- Name: resource_prices resource_prices_pkey; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.resource_prices
    ADD CONSTRAINT resource_prices_pkey PRIMARY KEY (id, resource_id);


--
-- Name: resources resources_pk; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.resources
    ADD CONSTRAINT resources_pk PRIMARY KEY (id);


--
-- Name: resources resources_un; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.resources
    ADD CONSTRAINT resources_un UNIQUE (resource);


--
-- Name: rounds rounds_pk; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.rounds
    ADD CONSTRAINT rounds_pk PRIMARY KEY (id);


--
-- Name: rounds rounds_un; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.rounds
    ADD CONSTRAINT rounds_un UNIQUE (match_id, round_number);


--
-- Name: scores score_types_pk; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT score_types_pk PRIMARY KEY (id);


--
-- Name: scores score_types_un; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT score_types_un UNIQUE (score_type);


--
-- Name: uploads uploads_pk; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.uploads
    ADD CONSTRAINT uploads_pk PRIMARY KEY (id);


--
-- Name: uploads uploads_un; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.uploads
    ADD CONSTRAINT uploads_un UNIQUE (match_id, uploader_user_id);


--
-- Name: weapons weapons_pk; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.weapons
    ADD CONSTRAINT weapons_pk PRIMARY KEY (id);


--
-- Name: weapons weapons_un; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.weapons
    ADD CONSTRAINT weapons_un UNIQUE (weapon);


--
-- Name: match_player_resources_match_player_id_idx; Type: INDEX; Schema: public; Owner: dev
--

CREATE INDEX match_player_resources_match_player_id_idx ON public.match_player_resources USING btree (match_player_id);


--
-- Name: player_round_damages_player_round_id_idx; Type: INDEX; Schema: public; Owner: dev
--

CREATE INDEX player_round_damages_player_round_id_idx ON public.round_player_damages USING btree (round_player_id);


--
-- Name: player_round_scores_player_round_id_idx; Type: INDEX; Schema: public; Owner: dev
--

CREATE INDEX player_round_scores_player_round_id_idx ON public.round_player_scores USING btree (round_player_id);


--
-- Name: resource_prices_id_resource_id_uindex; Type: INDEX; Schema: public; Owner: dev
--

CREATE UNIQUE INDEX resource_prices_id_resource_id_uindex ON public.resource_prices USING btree (id DESC, resource_id);


--
-- Name: uploads_uploader_user_id_idx; Type: INDEX; Schema: public; Owner: dev
--

CREATE INDEX uploads_uploader_user_id_idx ON public.uploads USING btree (uploader_user_id);


--
-- Name: build_parts build_parts_fk; Type: FK CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.build_parts
    ADD CONSTRAINT build_parts_fk FOREIGN KEY (build_id) REFERENCES public.builds(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: match_players match_player_fk; Type: FK CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.match_players
    ADD CONSTRAINT match_player_fk FOREIGN KEY (match_id) REFERENCES public.matches(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: match_player_resources match_player_resources_fk; Type: FK CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.match_player_resources
    ADD CONSTRAINT match_player_resources_fk FOREIGN KEY (match_player_id) REFERENCES public.match_players(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: round_player_damages player_round_damages_fk; Type: FK CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.round_player_damages
    ADD CONSTRAINT player_round_damages_fk FOREIGN KEY (round_player_id) REFERENCES public.round_players(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: round_player_medals player_round_medals_fk; Type: FK CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.round_player_medals
    ADD CONSTRAINT player_round_medals_fk FOREIGN KEY (round_player_id) REFERENCES public.round_players(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: round_player_scores player_round_scores_fk; Type: FK CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.round_player_scores
    ADD CONSTRAINT player_round_scores_fk FOREIGN KEY (round_player_id) REFERENCES public.round_players(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: round_players player_rounds_fk; Type: FK CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.round_players
    ADD CONSTRAINT player_rounds_fk FOREIGN KEY (round_id) REFERENCES public.rounds(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: rounds rounds_fk; Type: FK CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.rounds
    ADD CONSTRAINT rounds_fk FOREIGN KEY (match_id) REFERENCES public.matches(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

