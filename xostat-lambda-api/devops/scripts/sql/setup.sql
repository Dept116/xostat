--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2 (Debian 15.2-1.pgdg110+1)
-- Dumped by pg_dump version 15.2 (Debian 15.2-1.pgdg110+1)

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
    build_id integer NOT NULL,
    part_id integer NOT NULL
);


ALTER TABLE public.build_parts OWNER TO dev;

--
-- Name: TABLE build_parts; Type: COMMENT; Schema: public; Owner: dev
--

COMMENT ON TABLE public.build_parts IS 'Parts for a build';


--
-- Name: build_parts_build_id_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE public.build_parts_build_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.build_parts_build_id_seq OWNER TO dev;

--
-- Name: build_parts_build_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE public.build_parts_build_id_seq OWNED BY public.build_parts.build_id;


--
-- Name: builds; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE public.builds (
    id integer NOT NULL,
    build_hash character varying NOT NULL,
    power_score smallint NOT NULL
);


ALTER TABLE public.builds OWNER TO dev;

--
-- Name: builds_id_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE public.builds_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.builds_id_seq OWNER TO dev;

--
-- Name: builds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE public.builds_id_seq OWNED BY public.builds.id;


--
-- Name: match_players; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE public.match_players (
    id integer NOT NULL,
    match_id bigint NOT NULL,
    user_id integer NOT NULL,
    bot boolean NOT NULL,
    nickname character varying NOT NULL,
    team smallint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.match_players OWNER TO dev;

--
-- Name: match_player_id_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE public.match_player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.match_player_id_seq OWNER TO dev;

--
-- Name: match_player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE public.match_player_id_seq OWNED BY public.match_players.id;


--
-- Name: match_player_resources; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE public.match_player_resources (
    match_player_id integer NOT NULL,
    resource_id smallint NOT NULL,
    amount integer NOT NULL
);


ALTER TABLE public.match_player_resources OWNER TO dev;

--
-- Name: TABLE match_player_resources; Type: COMMENT; Schema: public; Owner: dev
--

COMMENT ON TABLE public.match_player_resources IS 'Resources for user in match.';


--
-- Name: matches; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE public.matches (
    id bigint NOT NULL,
    type character varying NOT NULL,
    classification smallint NOT NULL,
    start_at date NOT NULL,
    end_at date NOT NULL,
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
-- Name: round_players; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE public.round_players (
    match_id bigint NOT NULL,
    round_id integer NOT NULL,
    user_id integer NOT NULL,
    build_hash character varying NOT NULL,
    power_score smallint NOT NULL,
    kills smallint NOT NULL,
    assists smallint NOT NULL,
    drone_kills smallint NOT NULL,
    deaths smallint NOT NULL,
    score integer NOT NULL,
    damage numeric NOT NULL,
    damage_received numeric NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.round_players OWNER TO dev;

--
-- Name: TABLE round_players; Type: COMMENT; Schema: public; Owner: dev
--

COMMENT ON TABLE public.round_players IS 'Player records within a round.';


--
-- Name: player_rounds_id_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE public.player_rounds_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.player_rounds_id_seq OWNER TO dev;

--
-- Name: player_rounds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE public.player_rounds_id_seq OWNED BY public.round_players.id;


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
    round_player_id integer NOT NULL,
    weapon_id integer NOT NULL,
    damage numeric NOT NULL
);


ALTER TABLE public.round_player_damages OWNER TO dev;

--
-- Name: round_player_medals; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE public.round_player_medals (
    round_player_id integer NOT NULL,
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
    round_player_id integer NOT NULL,
    score_type_id integer NOT NULL,
    score integer NOT NULL
);


ALTER TABLE public.round_player_scores OWNER TO dev;

--
-- Name: TABLE round_player_scores; Type: COMMENT; Schema: public; Owner: dev
--

COMMENT ON TABLE public.round_player_scores IS 'score breakdown for a round within a match for a player.';


--
-- Name: rounds; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE public.rounds (
    match_id bigint NOT NULL,
    round_number integer NOT NULL,
    start_at date NOT NULL,
    end_at date NOT NULL,
    winning_team smallint NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.rounds OWNER TO dev;

--
-- Name: TABLE rounds; Type: COMMENT; Schema: public; Owner: dev
--

COMMENT ON TABLE public.rounds IS 'round attributes';


--
-- Name: rounds_id_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE public.rounds_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rounds_id_seq OWNER TO dev;

--
-- Name: rounds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE public.rounds_id_seq OWNED BY public.rounds.id;


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
    id integer NOT NULL,
    match_id bigint NOT NULL,
    uploaded_at date NOT NULL,
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
-- Name: build_parts build_id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.build_parts ALTER COLUMN build_id SET DEFAULT nextval('public.build_parts_build_id_seq'::regclass);


--
-- Name: builds id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.builds ALTER COLUMN id SET DEFAULT nextval('public.builds_id_seq'::regclass);


--
-- Name: match_players id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.match_players ALTER COLUMN id SET DEFAULT nextval('public.match_player_id_seq'::regclass);


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
-- Name: round_players id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.round_players ALTER COLUMN id SET DEFAULT nextval('public.player_rounds_id_seq'::regclass);


--
-- Name: rounds id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.rounds ALTER COLUMN id SET DEFAULT nextval('public.rounds_id_seq'::regclass);


--
-- Name: scores id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.scores ALTER COLUMN id SET DEFAULT nextval('public.score_types_id_seq'::regclass);


--
-- Name: weapons id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.weapons ALTER COLUMN id SET DEFAULT nextval('public.weapons_id_seq'::regclass);


--
-- Data for Name: build_parts; Type: TABLE DATA; Schema: public; Owner: dev
--

INSERT INTO public.build_parts VALUES (22182, 10420);
INSERT INTO public.build_parts VALUES (22182, 10421);
INSERT INTO public.build_parts VALUES (22182, 10422);
INSERT INTO public.build_parts VALUES (22183, 10423);
INSERT INTO public.build_parts VALUES (22183, 10424);
INSERT INTO public.build_parts VALUES (22183, 10425);
INSERT INTO public.build_parts VALUES (22183, 10421);
INSERT INTO public.build_parts VALUES (22184, 10426);
INSERT INTO public.build_parts VALUES (22184, 10427);
INSERT INTO public.build_parts VALUES (22184, 10428);
INSERT INTO public.build_parts VALUES (22184, 10429);
INSERT INTO public.build_parts VALUES (22184, 10430);
INSERT INTO public.build_parts VALUES (22184, 10431);
INSERT INTO public.build_parts VALUES (22185, 10432);
INSERT INTO public.build_parts VALUES (22185, 10433);
INSERT INTO public.build_parts VALUES (22185, 10434);
INSERT INTO public.build_parts VALUES (22185, 10435);
INSERT INTO public.build_parts VALUES (22185, 10436);
INSERT INTO public.build_parts VALUES (22185, 10437);
INSERT INTO public.build_parts VALUES (22185, 10431);
INSERT INTO public.build_parts VALUES (22185, 10438);
INSERT INTO public.build_parts VALUES (22185, 10439);
INSERT INTO public.build_parts VALUES (22185, 10440);
INSERT INTO public.build_parts VALUES (22186, 10441);
INSERT INTO public.build_parts VALUES (22186, 10442);
INSERT INTO public.build_parts VALUES (22186, 10443);
INSERT INTO public.build_parts VALUES (22186, 10444);
INSERT INTO public.build_parts VALUES (22186, 10445);
INSERT INTO public.build_parts VALUES (22186, 10446);
INSERT INTO public.build_parts VALUES (22186, 10447);
INSERT INTO public.build_parts VALUES (22186, 10448);
INSERT INTO public.build_parts VALUES (22186, 10449);
INSERT INTO public.build_parts VALUES (22186, 10450);
INSERT INTO public.build_parts VALUES (22186, 10451);
INSERT INTO public.build_parts VALUES (22186, 10452);
INSERT INTO public.build_parts VALUES (22186, 10453);
INSERT INTO public.build_parts VALUES (22186, 10454);
INSERT INTO public.build_parts VALUES (22187, 10455);
INSERT INTO public.build_parts VALUES (22187, 10456);
INSERT INTO public.build_parts VALUES (22187, 10457);
INSERT INTO public.build_parts VALUES (22187, 10444);
INSERT INTO public.build_parts VALUES (22187, 10458);
INSERT INTO public.build_parts VALUES (22187, 10431);
INSERT INTO public.build_parts VALUES (22188, 10459);
INSERT INTO public.build_parts VALUES (22188, 10460);
INSERT INTO public.build_parts VALUES (22188, 10461);
INSERT INTO public.build_parts VALUES (22188, 10462);
INSERT INTO public.build_parts VALUES (22188, 10463);
INSERT INTO public.build_parts VALUES (22188, 10464);
INSERT INTO public.build_parts VALUES (22188, 10465);
INSERT INTO public.build_parts VALUES (22188, 10466);
INSERT INTO public.build_parts VALUES (22188, 10431);
INSERT INTO public.build_parts VALUES (22189, 10460);
INSERT INTO public.build_parts VALUES (22189, 10459);
INSERT INTO public.build_parts VALUES (22189, 10467);
INSERT INTO public.build_parts VALUES (22189, 10444);
INSERT INTO public.build_parts VALUES (22190, 10468);
INSERT INTO public.build_parts VALUES (22191, 10432);
INSERT INTO public.build_parts VALUES (22191, 10469);
INSERT INTO public.build_parts VALUES (22191, 10470);
INSERT INTO public.build_parts VALUES (22192, 10420);
INSERT INTO public.build_parts VALUES (22192, 10471);
INSERT INTO public.build_parts VALUES (22192, 10472);
INSERT INTO public.build_parts VALUES (22193, 10473);
INSERT INTO public.build_parts VALUES (22193, 10474);
INSERT INTO public.build_parts VALUES (22193, 10475);
INSERT INTO public.build_parts VALUES (22193, 10435);
INSERT INTO public.build_parts VALUES (22193, 10476);
INSERT INTO public.build_parts VALUES (22194, 10477);
INSERT INTO public.build_parts VALUES (22195, 10475);
INSERT INTO public.build_parts VALUES (22195, 10478);
INSERT INTO public.build_parts VALUES (22195, 10479);
INSERT INTO public.build_parts VALUES (22195, 10480);
INSERT INTO public.build_parts VALUES (22195, 10435);
INSERT INTO public.build_parts VALUES (22196, 10481);
INSERT INTO public.build_parts VALUES (22196, 10482);
INSERT INTO public.build_parts VALUES (22196, 10431);
INSERT INTO public.build_parts VALUES (22197, 10483);
INSERT INTO public.build_parts VALUES (22197, 10480);
INSERT INTO public.build_parts VALUES (22197, 10431);
INSERT INTO public.build_parts VALUES (22198, 10456);
INSERT INTO public.build_parts VALUES (22199, 10484);
INSERT INTO public.build_parts VALUES (22199, 10459);
INSERT INTO public.build_parts VALUES (22199, 10485);
INSERT INTO public.build_parts VALUES (22199, 10473);
INSERT INTO public.build_parts VALUES (22199, 10486);
INSERT INTO public.build_parts VALUES (22200, 10487);
INSERT INTO public.build_parts VALUES (22200, 10488);
INSERT INTO public.build_parts VALUES (22200, 10489);
INSERT INTO public.build_parts VALUES (22200, 10490);
INSERT INTO public.build_parts VALUES (22200, 10491);
INSERT INTO public.build_parts VALUES (22201, 10492);
INSERT INTO public.build_parts VALUES (22201, 10435);
INSERT INTO public.build_parts VALUES (22201, 10489);
INSERT INTO public.build_parts VALUES (22201, 10490);
INSERT INTO public.build_parts VALUES (22201, 10493);
INSERT INTO public.build_parts VALUES (22202, 10494);
INSERT INTO public.build_parts VALUES (22202, 10481);
INSERT INTO public.build_parts VALUES (22202, 10495);
INSERT INTO public.build_parts VALUES (22202, 10444);
INSERT INTO public.build_parts VALUES (22203, 10488);
INSERT INTO public.build_parts VALUES (22203, 10496);
INSERT INTO public.build_parts VALUES (22203, 10497);
INSERT INTO public.build_parts VALUES (22204, 10426);
INSERT INTO public.build_parts VALUES (22204, 10498);
INSERT INTO public.build_parts VALUES (22205, 10499);
INSERT INTO public.build_parts VALUES (22205, 10479);
INSERT INTO public.build_parts VALUES (22206, 10500);
INSERT INTO public.build_parts VALUES (22206, 10468);
INSERT INTO public.build_parts VALUES (22207, 10481);
INSERT INTO public.build_parts VALUES (22207, 10499);
INSERT INTO public.build_parts VALUES (22207, 10501);
INSERT INTO public.build_parts VALUES (22208, 10502);
INSERT INTO public.build_parts VALUES (22208, 10431);
INSERT INTO public.build_parts VALUES (22209, 10503);
INSERT INTO public.build_parts VALUES (22209, 10421);
INSERT INTO public.build_parts VALUES (22209, 10504);
INSERT INTO public.build_parts VALUES (22209, 10449);
INSERT INTO public.build_parts VALUES (22209, 10464);
INSERT INTO public.build_parts VALUES (22209, 10505);
INSERT INTO public.build_parts VALUES (22209, 10451);
INSERT INTO public.build_parts VALUES (22209, 10506);
INSERT INTO public.build_parts VALUES (22209, 10507);
INSERT INTO public.build_parts VALUES (22209, 10508);
INSERT INTO public.build_parts VALUES (22209, 10509);
INSERT INTO public.build_parts VALUES (22209, 10510);
INSERT INTO public.build_parts VALUES (22210, 10511);
INSERT INTO public.build_parts VALUES (22210, 10512);
INSERT INTO public.build_parts VALUES (22210, 10421);
INSERT INTO public.build_parts VALUES (22210, 10513);
INSERT INTO public.build_parts VALUES (22210, 10514);
INSERT INTO public.build_parts VALUES (22210, 10515);
INSERT INTO public.build_parts VALUES (22210, 10495);
INSERT INTO public.build_parts VALUES (22210, 10516);
INSERT INTO public.build_parts VALUES (22211, 10420);
INSERT INTO public.build_parts VALUES (22211, 10517);
INSERT INTO public.build_parts VALUES (22211, 10518);
INSERT INTO public.build_parts VALUES (22212, 10519);
INSERT INTO public.build_parts VALUES (22212, 10473);
INSERT INTO public.build_parts VALUES (22212, 10467);
INSERT INTO public.build_parts VALUES (22212, 10499);
INSERT INTO public.build_parts VALUES (22212, 10520);
INSERT INTO public.build_parts VALUES (22212, 10521);
INSERT INTO public.build_parts VALUES (22213, 10522);
INSERT INTO public.build_parts VALUES (22213, 10523);
INSERT INTO public.build_parts VALUES (22213, 10476);
INSERT INTO public.build_parts VALUES (22213, 10427);
INSERT INTO public.build_parts VALUES (22213, 10435);
INSERT INTO public.build_parts VALUES (22213, 10524);
INSERT INTO public.build_parts VALUES (22213, 10525);
INSERT INTO public.build_parts VALUES (22213, 10526);
INSERT INTO public.build_parts VALUES (22214, 10527);
INSERT INTO public.build_parts VALUES (22214, 10489);
INSERT INTO public.build_parts VALUES (22214, 10528);
INSERT INTO public.build_parts VALUES (22214, 10459);
INSERT INTO public.build_parts VALUES (22214, 10529);
INSERT INTO public.build_parts VALUES (22214, 10473);
INSERT INTO public.build_parts VALUES (22214, 10499);
INSERT INTO public.build_parts VALUES (22215, 10530);
INSERT INTO public.build_parts VALUES (22215, 10531);
INSERT INTO public.build_parts VALUES (22216, 10492);
INSERT INTO public.build_parts VALUES (22216, 10493);
INSERT INTO public.build_parts VALUES (22216, 10532);
INSERT INTO public.build_parts VALUES (22216, 10431);
INSERT INTO public.build_parts VALUES (22216, 10473);
INSERT INTO public.build_parts VALUES (22217, 10420);
INSERT INTO public.build_parts VALUES (22217, 10471);
INSERT INTO public.build_parts VALUES (22217, 10424);
INSERT INTO public.build_parts VALUES (22217, 10431);
INSERT INTO public.build_parts VALUES (22217, 10533);
INSERT INTO public.build_parts VALUES (22217, 10493);
INSERT INTO public.build_parts VALUES (22217, 10534);
INSERT INTO public.build_parts VALUES (22217, 10428);
INSERT INTO public.build_parts VALUES (22218, 10494);
INSERT INTO public.build_parts VALUES (22218, 10499);
INSERT INTO public.build_parts VALUES (22218, 10464);
INSERT INTO public.build_parts VALUES (22218, 10493);
INSERT INTO public.build_parts VALUES (22218, 10431);
INSERT INTO public.build_parts VALUES (22218, 10535);
INSERT INTO public.build_parts VALUES (22219, 10528);
INSERT INTO public.build_parts VALUES (22219, 10536);
INSERT INTO public.build_parts VALUES (22219, 10537);
INSERT INTO public.build_parts VALUES (22219, 10538);
INSERT INTO public.build_parts VALUES (22219, 10476);
INSERT INTO public.build_parts VALUES (22219, 10431);
INSERT INTO public.build_parts VALUES (22219, 10501);
INSERT INTO public.build_parts VALUES (22220, 10539);
INSERT INTO public.build_parts VALUES (22220, 10540);
INSERT INTO public.build_parts VALUES (22220, 10541);
INSERT INTO public.build_parts VALUES (22220, 10523);
INSERT INTO public.build_parts VALUES (22220, 10429);
INSERT INTO public.build_parts VALUES (22220, 10542);
INSERT INTO public.build_parts VALUES (22220, 10520);
INSERT INTO public.build_parts VALUES (22220, 10543);
INSERT INTO public.build_parts VALUES (22220, 10544);
INSERT INTO public.build_parts VALUES (22220, 10510);
INSERT INTO public.build_parts VALUES (22220, 10545);
INSERT INTO public.build_parts VALUES (22220, 10546);
INSERT INTO public.build_parts VALUES (22221, 10547);
INSERT INTO public.build_parts VALUES (22221, 10548);
INSERT INTO public.build_parts VALUES (22221, 10549);
INSERT INTO public.build_parts VALUES (22221, 10550);
INSERT INTO public.build_parts VALUES (22221, 10431);
INSERT INTO public.build_parts VALUES (22221, 10447);
INSERT INTO public.build_parts VALUES (22222, 10468);
INSERT INTO public.build_parts VALUES (22222, 10551);
INSERT INTO public.build_parts VALUES (22222, 10427);
INSERT INTO public.build_parts VALUES (22223, 10552);
INSERT INTO public.build_parts VALUES (22223, 10459);
INSERT INTO public.build_parts VALUES (22223, 10460);
INSERT INTO public.build_parts VALUES (22223, 10435);
INSERT INTO public.build_parts VALUES (22223, 10553);
INSERT INTO public.build_parts VALUES (22223, 10554);
INSERT INTO public.build_parts VALUES (22223, 10555);
INSERT INTO public.build_parts VALUES (22224, 10459);
INSERT INTO public.build_parts VALUES (22224, 10556);
INSERT INTO public.build_parts VALUES (22224, 10471);
INSERT INTO public.build_parts VALUES (22224, 10557);
INSERT INTO public.build_parts VALUES (22224, 10558);
INSERT INTO public.build_parts VALUES (22224, 10434);
INSERT INTO public.build_parts VALUES (22225, 10555);
INSERT INTO public.build_parts VALUES (22225, 10559);
INSERT INTO public.build_parts VALUES (22225, 10560);
INSERT INTO public.build_parts VALUES (22225, 10450);
INSERT INTO public.build_parts VALUES (22225, 10459);
INSERT INTO public.build_parts VALUES (22225, 10525);
INSERT INTO public.build_parts VALUES (22225, 10552);
INSERT INTO public.build_parts VALUES (22226, 10561);
INSERT INTO public.build_parts VALUES (22226, 10562);
INSERT INTO public.build_parts VALUES (22226, 10534);
INSERT INTO public.build_parts VALUES (22226, 10533);
INSERT INTO public.build_parts VALUES (22226, 10520);
INSERT INTO public.build_parts VALUES (22226, 10431);
INSERT INTO public.build_parts VALUES (22226, 10563);
INSERT INTO public.build_parts VALUES (22227, 10564);
INSERT INTO public.build_parts VALUES (22227, 10565);
INSERT INTO public.build_parts VALUES (22227, 10536);
INSERT INTO public.build_parts VALUES (22228, 10468);
INSERT INTO public.build_parts VALUES (22228, 10566);
INSERT INTO public.build_parts VALUES (22228, 10567);
INSERT INTO public.build_parts VALUES (22228, 10433);
INSERT INTO public.build_parts VALUES (22228, 10568);
INSERT INTO public.build_parts VALUES (22229, 10442);
INSERT INTO public.build_parts VALUES (22229, 10569);
INSERT INTO public.build_parts VALUES (22229, 10570);
INSERT INTO public.build_parts VALUES (22229, 10571);
INSERT INTO public.build_parts VALUES (22229, 10532);
INSERT INTO public.build_parts VALUES (22230, 10484);
INSERT INTO public.build_parts VALUES (22230, 10501);
INSERT INTO public.build_parts VALUES (22230, 10572);
INSERT INTO public.build_parts VALUES (22230, 10573);
INSERT INTO public.build_parts VALUES (22231, 10574);
INSERT INTO public.build_parts VALUES (22231, 10483);
INSERT INTO public.build_parts VALUES (22231, 10575);
INSERT INTO public.build_parts VALUES (22231, 10540);
INSERT INTO public.build_parts VALUES (22231, 10576);
INSERT INTO public.build_parts VALUES (22231, 10429);
INSERT INTO public.build_parts VALUES (22231, 10577);
INSERT INTO public.build_parts VALUES (22231, 10546);
INSERT INTO public.build_parts VALUES (22231, 10578);
INSERT INTO public.build_parts VALUES (22231, 10523);
INSERT INTO public.build_parts VALUES (22231, 10454);
INSERT INTO public.build_parts VALUES (22231, 10464);
INSERT INTO public.build_parts VALUES (22231, 10579);
INSERT INTO public.build_parts VALUES (22231, 10580);
INSERT INTO public.build_parts VALUES (22231, 10581);
INSERT INTO public.build_parts VALUES (22232, 10582);
INSERT INTO public.build_parts VALUES (22232, 10583);
INSERT INTO public.build_parts VALUES (22232, 10558);
INSERT INTO public.build_parts VALUES (22232, 10451);
INSERT INTO public.build_parts VALUES (22232, 10584);
INSERT INTO public.build_parts VALUES (22233, 10483);
INSERT INTO public.build_parts VALUES (22233, 10585);
INSERT INTO public.build_parts VALUES (22233, 10586);
INSERT INTO public.build_parts VALUES (22233, 10435);
INSERT INTO public.build_parts VALUES (22233, 10587);
INSERT INTO public.build_parts VALUES (22233, 10489);
INSERT INTO public.build_parts VALUES (22233, 10467);
INSERT INTO public.build_parts VALUES (22233, 10588);
INSERT INTO public.build_parts VALUES (22233, 10493);
INSERT INTO public.build_parts VALUES (22233, 10589);
INSERT INTO public.build_parts VALUES (22233, 10590);
INSERT INTO public.build_parts VALUES (22234, 10475);
INSERT INTO public.build_parts VALUES (22234, 10571);
INSERT INTO public.build_parts VALUES (22234, 10461);
INSERT INTO public.build_parts VALUES (22234, 10591);
INSERT INTO public.build_parts VALUES (22234, 10520);
INSERT INTO public.build_parts VALUES (22234, 10540);
INSERT INTO public.build_parts VALUES (22235, 10592);
INSERT INTO public.build_parts VALUES (22235, 10499);
INSERT INTO public.build_parts VALUES (22235, 10593);
INSERT INTO public.build_parts VALUES (22235, 10526);
INSERT INTO public.build_parts VALUES (22235, 10594);
INSERT INTO public.build_parts VALUES (22235, 10595);
INSERT INTO public.build_parts VALUES (22235, 10532);
INSERT INTO public.build_parts VALUES (22235, 10473);
INSERT INTO public.build_parts VALUES (22236, 10530);
INSERT INTO public.build_parts VALUES (22236, 10596);
INSERT INTO public.build_parts VALUES (22236, 10435);
INSERT INTO public.build_parts VALUES (22237, 10494);
INSERT INTO public.build_parts VALUES (22237, 10489);
INSERT INTO public.build_parts VALUES (22237, 10595);
INSERT INTO public.build_parts VALUES (22237, 10540);
INSERT INTO public.build_parts VALUES (22237, 10476);
INSERT INTO public.build_parts VALUES (22238, 10597);
INSERT INTO public.build_parts VALUES (22238, 10598);
INSERT INTO public.build_parts VALUES (22239, 10432);
INSERT INTO public.build_parts VALUES (22239, 10599);
INSERT INTO public.build_parts VALUES (22239, 10431);
INSERT INTO public.build_parts VALUES (22239, 10444);
INSERT INTO public.build_parts VALUES (22239, 10600);
INSERT INTO public.build_parts VALUES (22239, 10434);
INSERT INTO public.build_parts VALUES (22240, 10432);
INSERT INTO public.build_parts VALUES (22240, 10427);
INSERT INTO public.build_parts VALUES (22240, 10453);
INSERT INTO public.build_parts VALUES (22240, 10431);
INSERT INTO public.build_parts VALUES (22240, 10601);
INSERT INTO public.build_parts VALUES (22241, 10602);
INSERT INTO public.build_parts VALUES (22241, 10603);
INSERT INTO public.build_parts VALUES (22241, 10431);
INSERT INTO public.build_parts VALUES (22241, 10445);
INSERT INTO public.build_parts VALUES (22241, 10534);
INSERT INTO public.build_parts VALUES (22241, 10444);
INSERT INTO public.build_parts VALUES (22241, 10434);
INSERT INTO public.build_parts VALUES (22242, 10456);
INSERT INTO public.build_parts VALUES (22242, 10604);
INSERT INTO public.build_parts VALUES (22242, 10450);
INSERT INTO public.build_parts VALUES (22242, 10435);
INSERT INTO public.build_parts VALUES (22242, 10605);
INSERT INTO public.build_parts VALUES (22243, 10471);
INSERT INTO public.build_parts VALUES (22243, 10420);
INSERT INTO public.build_parts VALUES (22243, 10606);
INSERT INTO public.build_parts VALUES (22243, 10569);
INSERT INTO public.build_parts VALUES (22243, 10431);
INSERT INTO public.build_parts VALUES (22243, 10489);
INSERT INTO public.build_parts VALUES (22243, 10607);
INSERT INTO public.build_parts VALUES (22244, 10602);
INSERT INTO public.build_parts VALUES (22244, 10475);
INSERT INTO public.build_parts VALUES (22244, 10518);
INSERT INTO public.build_parts VALUES (22245, 10420);
INSERT INTO public.build_parts VALUES (22245, 10574);
INSERT INTO public.build_parts VALUES (22245, 10608);
INSERT INTO public.build_parts VALUES (22245, 10525);
INSERT INTO public.build_parts VALUES (22245, 10427);
INSERT INTO public.build_parts VALUES (22245, 10546);
INSERT INTO public.build_parts VALUES (22246, 10608);
INSERT INTO public.build_parts VALUES (22246, 10547);
INSERT INTO public.build_parts VALUES (22246, 10609);
INSERT INTO public.build_parts VALUES (22246, 10484);
INSERT INTO public.build_parts VALUES (22246, 10610);
INSERT INTO public.build_parts VALUES (22246, 10572);
INSERT INTO public.build_parts VALUES (22246, 10611);
INSERT INTO public.build_parts VALUES (22246, 10612);
INSERT INTO public.build_parts VALUES (22247, 10613);
INSERT INTO public.build_parts VALUES (22247, 10562);
INSERT INTO public.build_parts VALUES (22247, 10499);
INSERT INTO public.build_parts VALUES (22247, 10614);
INSERT INTO public.build_parts VALUES (22247, 10615);
INSERT INTO public.build_parts VALUES (22247, 10462);
INSERT INTO public.build_parts VALUES (22247, 10616);
INSERT INTO public.build_parts VALUES (22248, 10489);
INSERT INTO public.build_parts VALUES (22248, 10534);
INSERT INTO public.build_parts VALUES (22248, 10617);
INSERT INTO public.build_parts VALUES (22248, 10499);
INSERT INTO public.build_parts VALUES (22248, 10524);
INSERT INTO public.build_parts VALUES (22248, 10618);
INSERT INTO public.build_parts VALUES (22249, 10619);
INSERT INTO public.build_parts VALUES (22249, 10583);
INSERT INTO public.build_parts VALUES (22249, 10620);
INSERT INTO public.build_parts VALUES (22249, 10621);
INSERT INTO public.build_parts VALUES (22249, 10622);
INSERT INTO public.build_parts VALUES (22249, 10558);
INSERT INTO public.build_parts VALUES (22249, 10517);
INSERT INTO public.build_parts VALUES (22249, 10435);
INSERT INTO public.build_parts VALUES (22249, 10623);
INSERT INTO public.build_parts VALUES (22249, 10624);
INSERT INTO public.build_parts VALUES (22249, 10625);
INSERT INTO public.build_parts VALUES (22249, 10499);
INSERT INTO public.build_parts VALUES (22249, 10467);
INSERT INTO public.build_parts VALUES (22249, 10626);
INSERT INTO public.build_parts VALUES (22250, 10460);
INSERT INTO public.build_parts VALUES (22250, 10429);
INSERT INTO public.build_parts VALUES (22250, 10459);
INSERT INTO public.build_parts VALUES (22250, 10538);
INSERT INTO public.build_parts VALUES (22251, 10471);
INSERT INTO public.build_parts VALUES (22252, 10424);
INSERT INTO public.build_parts VALUES (22252, 10423);
INSERT INTO public.build_parts VALUES (22252, 10604);
INSERT INTO public.build_parts VALUES (22252, 10509);
INSERT INTO public.build_parts VALUES (22253, 10627);
INSERT INTO public.build_parts VALUES (22254, 10435);
INSERT INTO public.build_parts VALUES (22254, 10494);
INSERT INTO public.build_parts VALUES (22254, 10473);
INSERT INTO public.build_parts VALUES (22255, 10484);
INSERT INTO public.build_parts VALUES (22255, 10478);
INSERT INTO public.build_parts VALUES (22255, 10628);
INSERT INTO public.build_parts VALUES (22256, 10530);
INSERT INTO public.build_parts VALUES (22257, 10629);
INSERT INTO public.build_parts VALUES (22257, 10425);
INSERT INTO public.build_parts VALUES (22257, 10454);
INSERT INTO public.build_parts VALUES (22257, 10537);
INSERT INTO public.build_parts VALUES (22258, 10630);
INSERT INTO public.build_parts VALUES (22258, 10631);
INSERT INTO public.build_parts VALUES (22258, 10593);
INSERT INTO public.build_parts VALUES (22258, 10510);
INSERT INTO public.build_parts VALUES (22258, 10588);
INSERT INTO public.build_parts VALUES (22258, 10632);
INSERT INTO public.build_parts VALUES (22258, 10633);
INSERT INTO public.build_parts VALUES (22258, 10622);
INSERT INTO public.build_parts VALUES (22258, 10607);
INSERT INTO public.build_parts VALUES (22258, 10634);
INSERT INTO public.build_parts VALUES (22259, 10479);
INSERT INTO public.build_parts VALUES (22259, 10635);
INSERT INTO public.build_parts VALUES (22259, 10636);
INSERT INTO public.build_parts VALUES (22259, 10493);
INSERT INTO public.build_parts VALUES (22259, 10489);
INSERT INTO public.build_parts VALUES (22259, 10499);
INSERT INTO public.build_parts VALUES (22259, 10451);
INSERT INTO public.build_parts VALUES (22259, 10453);
INSERT INTO public.build_parts VALUES (22259, 10454);
INSERT INTO public.build_parts VALUES (22259, 10637);
INSERT INTO public.build_parts VALUES (22259, 10452);
INSERT INTO public.build_parts VALUES (22259, 10638);
INSERT INTO public.build_parts VALUES (22260, 10574);
INSERT INTO public.build_parts VALUES (22260, 10450);
INSERT INTO public.build_parts VALUES (22260, 10570);
INSERT INTO public.build_parts VALUES (22260, 10479);
INSERT INTO public.build_parts VALUES (22260, 10435);
INSERT INTO public.build_parts VALUES (22260, 10444);
INSERT INTO public.build_parts VALUES (22260, 10491);
INSERT INTO public.build_parts VALUES (22261, 10484);
INSERT INTO public.build_parts VALUES (22261, 10459);
INSERT INTO public.build_parts VALUES (22261, 10431);
INSERT INTO public.build_parts VALUES (22262, 10459);
INSERT INTO public.build_parts VALUES (22262, 10452);
INSERT INTO public.build_parts VALUES (22262, 10639);
INSERT INTO public.build_parts VALUES (22262, 10431);
INSERT INTO public.build_parts VALUES (22263, 10585);
INSERT INTO public.build_parts VALUES (22263, 10640);
INSERT INTO public.build_parts VALUES (22263, 10504);
INSERT INTO public.build_parts VALUES (22263, 10499);
INSERT INTO public.build_parts VALUES (22263, 10435);
INSERT INTO public.build_parts VALUES (22263, 10536);
INSERT INTO public.build_parts VALUES (22263, 10493);
INSERT INTO public.build_parts VALUES (22264, 10564);
INSERT INTO public.build_parts VALUES (22264, 10641);
INSERT INTO public.build_parts VALUES (22264, 10457);
INSERT INTO public.build_parts VALUES (22265, 10483);
INSERT INTO public.build_parts VALUES (22265, 10502);
INSERT INTO public.build_parts VALUES (22265, 10431);
INSERT INTO public.build_parts VALUES (22265, 10622);
INSERT INTO public.build_parts VALUES (22265, 10434);
INSERT INTO public.build_parts VALUES (22266, 10432);
INSERT INTO public.build_parts VALUES (22266, 10493);
INSERT INTO public.build_parts VALUES (22267, 10519);
INSERT INTO public.build_parts VALUES (22267, 10499);
INSERT INTO public.build_parts VALUES (22267, 10642);
INSERT INTO public.build_parts VALUES (22267, 10473);
INSERT INTO public.build_parts VALUES (22267, 10532);
INSERT INTO public.build_parts VALUES (22268, 10564);
INSERT INTO public.build_parts VALUES (22268, 10435);
INSERT INTO public.build_parts VALUES (22268, 10539);
INSERT INTO public.build_parts VALUES (22268, 10493);
INSERT INTO public.build_parts VALUES (22268, 10429);
INSERT INTO public.build_parts VALUES (22268, 10541);
INSERT INTO public.build_parts VALUES (22268, 10643);
INSERT INTO public.build_parts VALUES (22268, 10644);
INSERT INTO public.build_parts VALUES (22269, 10562);
INSERT INTO public.build_parts VALUES (22269, 10457);
INSERT INTO public.build_parts VALUES (22270, 10460);
INSERT INTO public.build_parts VALUES (22270, 10470);
INSERT INTO public.build_parts VALUES (22270, 10499);
INSERT INTO public.build_parts VALUES (22271, 10492);
INSERT INTO public.build_parts VALUES (22271, 10540);
INSERT INTO public.build_parts VALUES (22271, 10645);
INSERT INTO public.build_parts VALUES (22271, 10637);
INSERT INTO public.build_parts VALUES (22271, 10646);
INSERT INTO public.build_parts VALUES (22271, 10422);
INSERT INTO public.build_parts VALUES (22271, 10647);
INSERT INTO public.build_parts VALUES (22272, 10648);
INSERT INTO public.build_parts VALUES (22272, 10457);
INSERT INTO public.build_parts VALUES (22272, 10524);
INSERT INTO public.build_parts VALUES (22272, 10529);
INSERT INTO public.build_parts VALUES (22273, 10468);
INSERT INTO public.build_parts VALUES (22274, 10649);
INSERT INTO public.build_parts VALUES (22274, 10457);
INSERT INTO public.build_parts VALUES (22275, 10494);
INSERT INTO public.build_parts VALUES (22275, 10445);
INSERT INTO public.build_parts VALUES (22275, 10444);
INSERT INTO public.build_parts VALUES (22275, 10499);
INSERT INTO public.build_parts VALUES (22276, 10530);
INSERT INTO public.build_parts VALUES (22276, 10450);
INSERT INTO public.build_parts VALUES (22276, 10566);
INSERT INTO public.build_parts VALUES (22277, 10547);
INSERT INTO public.build_parts VALUES (22277, 10564);
INSERT INTO public.build_parts VALUES (22277, 10499);
INSERT INTO public.build_parts VALUES (22277, 10435);
INSERT INTO public.build_parts VALUES (22278, 10539);
INSERT INTO public.build_parts VALUES (22278, 10489);
INSERT INTO public.build_parts VALUES (22279, 10613);
INSERT INTO public.build_parts VALUES (22279, 10480);
INSERT INTO public.build_parts VALUES (22279, 10650);
INSERT INTO public.build_parts VALUES (22279, 10651);
INSERT INTO public.build_parts VALUES (22279, 10525);
INSERT INTO public.build_parts VALUES (22279, 10434);
INSERT INTO public.build_parts VALUES (22279, 10514);
INSERT INTO public.build_parts VALUES (22279, 10515);
INSERT INTO public.build_parts VALUES (22280, 10652);
INSERT INTO public.build_parts VALUES (22280, 10498);
INSERT INTO public.build_parts VALUES (22280, 10420);
INSERT INTO public.build_parts VALUES (22280, 10491);
INSERT INTO public.build_parts VALUES (22281, 10653);
INSERT INTO public.build_parts VALUES (22281, 10435);
INSERT INTO public.build_parts VALUES (22281, 10429);
INSERT INTO public.build_parts VALUES (22281, 10431);
INSERT INTO public.build_parts VALUES (22281, 10643);
INSERT INTO public.build_parts VALUES (22282, 10456);
INSERT INTO public.build_parts VALUES (22282, 10605);
INSERT INTO public.build_parts VALUES (22282, 10435);
INSERT INTO public.build_parts VALUES (22282, 10429);
INSERT INTO public.build_parts VALUES (22282, 10625);
INSERT INTO public.build_parts VALUES (22283, 10456);
INSERT INTO public.build_parts VALUES (22283, 10429);
INSERT INTO public.build_parts VALUES (22283, 10538);
INSERT INTO public.build_parts VALUES (22284, 10471);
INSERT INTO public.build_parts VALUES (22284, 10654);
INSERT INTO public.build_parts VALUES (22284, 10523);
INSERT INTO public.build_parts VALUES (22284, 10466);
INSERT INTO public.build_parts VALUES (22284, 10555);
INSERT INTO public.build_parts VALUES (22284, 10429);
INSERT INTO public.build_parts VALUES (22285, 10477);
INSERT INTO public.build_parts VALUES (22285, 10423);
INSERT INTO public.build_parts VALUES (22285, 10471);
INSERT INTO public.build_parts VALUES (22285, 10655);
INSERT INTO public.build_parts VALUES (22285, 10535);
INSERT INTO public.build_parts VALUES (22286, 10656);
INSERT INTO public.build_parts VALUES (22286, 10489);
INSERT INTO public.build_parts VALUES (22286, 10500);
INSERT INTO public.build_parts VALUES (22286, 10605);
INSERT INTO public.build_parts VALUES (22286, 10577);
INSERT INTO public.build_parts VALUES (22286, 10657);
INSERT INTO public.build_parts VALUES (22286, 10493);
INSERT INTO public.build_parts VALUES (22286, 10587);
INSERT INTO public.build_parts VALUES (22286, 10658);
INSERT INTO public.build_parts VALUES (22287, 10459);
INSERT INTO public.build_parts VALUES (22287, 10619);
INSERT INTO public.build_parts VALUES (22287, 10499);
INSERT INTO public.build_parts VALUES (22288, 10492);
INSERT INTO public.build_parts VALUES (22288, 10566);
INSERT INTO public.build_parts VALUES (22288, 10659);
INSERT INTO public.build_parts VALUES (22288, 10660);
INSERT INTO public.build_parts VALUES (22288, 10661);
INSERT INTO public.build_parts VALUES (22289, 10662);
INSERT INTO public.build_parts VALUES (22290, 10468);
INSERT INTO public.build_parts VALUES (22290, 10596);
INSERT INTO public.build_parts VALUES (22291, 10547);
INSERT INTO public.build_parts VALUES (22291, 10619);
INSERT INTO public.build_parts VALUES (22291, 10561);
INSERT INTO public.build_parts VALUES (22291, 10655);
INSERT INTO public.build_parts VALUES (22291, 10429);
INSERT INTO public.build_parts VALUES (22292, 10663);
INSERT INTO public.build_parts VALUES (22292, 10475);
INSERT INTO public.build_parts VALUES (22292, 10489);
INSERT INTO public.build_parts VALUES (22292, 10535);
INSERT INTO public.build_parts VALUES (22293, 10432);
INSERT INTO public.build_parts VALUES (22293, 10457);
INSERT INTO public.build_parts VALUES (22294, 10663);
INSERT INTO public.build_parts VALUES (22294, 10461);
INSERT INTO public.build_parts VALUES (22295, 10459);
INSERT INTO public.build_parts VALUES (22295, 10547);
INSERT INTO public.build_parts VALUES (22295, 10608);
INSERT INTO public.build_parts VALUES (22295, 10664);
INSERT INTO public.build_parts VALUES (22295, 10493);
INSERT INTO public.build_parts VALUES (22295, 10655);
INSERT INTO public.build_parts VALUES (22295, 10665);
INSERT INTO public.build_parts VALUES (22295, 10566);
INSERT INTO public.build_parts VALUES (22295, 10666);
INSERT INTO public.build_parts VALUES (22296, 10527);
INSERT INTO public.build_parts VALUES (22296, 10420);
INSERT INTO public.build_parts VALUES (22296, 10499);
INSERT INTO public.build_parts VALUES (22296, 10435);
INSERT INTO public.build_parts VALUES (22296, 10566);
INSERT INTO public.build_parts VALUES (22296, 10667);
INSERT INTO public.build_parts VALUES (22296, 10668);
INSERT INTO public.build_parts VALUES (22296, 10431);
INSERT INTO public.build_parts VALUES (22297, 10609);
INSERT INTO public.build_parts VALUES (22297, 10550);
INSERT INTO public.build_parts VALUES (22297, 10669);
INSERT INTO public.build_parts VALUES (22297, 10670);
INSERT INTO public.build_parts VALUES (22297, 10637);
INSERT INTO public.build_parts VALUES (22297, 10434);
INSERT INTO public.build_parts VALUES (22297, 10500);
INSERT INTO public.build_parts VALUES (22297, 10600);
INSERT INTO public.build_parts VALUES (22297, 10593);
INSERT INTO public.build_parts VALUES (22298, 10639);
INSERT INTO public.build_parts VALUES (22298, 10476);
INSERT INTO public.build_parts VALUES (22298, 10488);
INSERT INTO public.build_parts VALUES (22298, 10480);
INSERT INTO public.build_parts VALUES (22299, 10432);
INSERT INTO public.build_parts VALUES (22299, 10517);
INSERT INTO public.build_parts VALUES (22300, 10671);
INSERT INTO public.build_parts VALUES (22300, 10435);
INSERT INTO public.build_parts VALUES (22300, 10641);
INSERT INTO public.build_parts VALUES (22300, 10633);
INSERT INTO public.build_parts VALUES (22300, 10573);
INSERT INTO public.build_parts VALUES (22301, 10548);
INSERT INTO public.build_parts VALUES (22301, 10672);
INSERT INTO public.build_parts VALUES (22301, 10429);
INSERT INTO public.build_parts VALUES (22301, 10493);
INSERT INTO public.build_parts VALUES (22302, 10424);
INSERT INTO public.build_parts VALUES (22302, 10628);
INSERT INTO public.build_parts VALUES (22303, 10429);
INSERT INTO public.build_parts VALUES (22303, 10673);
INSERT INTO public.build_parts VALUES (22303, 10653);
INSERT INTO public.build_parts VALUES (22304, 10492);
INSERT INTO public.build_parts VALUES (22304, 10488);
INSERT INTO public.build_parts VALUES (22305, 10653);
INSERT INTO public.build_parts VALUES (22305, 10660);
INSERT INTO public.build_parts VALUES (22305, 10590);
INSERT INTO public.build_parts VALUES (22306, 10559);
INSERT INTO public.build_parts VALUES (22306, 10429);
INSERT INTO public.build_parts VALUES (22306, 10588);
INSERT INTO public.build_parts VALUES (22306, 10637);
INSERT INTO public.build_parts VALUES (22307, 10475);
INSERT INTO public.build_parts VALUES (22307, 10570);
INSERT INTO public.build_parts VALUES (22308, 10432);
INSERT INTO public.build_parts VALUES (22308, 10655);
INSERT INTO public.build_parts VALUES (22308, 10429);
INSERT INTO public.build_parts VALUES (22308, 10515);
INSERT INTO public.build_parts VALUES (22309, 10487);
INSERT INTO public.build_parts VALUES (22309, 10674);
INSERT INTO public.build_parts VALUES (22309, 10675);
INSERT INTO public.build_parts VALUES (22310, 10456);
INSERT INTO public.build_parts VALUES (22311, 10653);
INSERT INTO public.build_parts VALUES (22311, 10431);
INSERT INTO public.build_parts VALUES (22311, 10676);
INSERT INTO public.build_parts VALUES (22312, 10426);
INSERT INTO public.build_parts VALUES (22313, 10492);
INSERT INTO public.build_parts VALUES (22313, 10435);
INSERT INTO public.build_parts VALUES (22313, 10473);
INSERT INTO public.build_parts VALUES (22313, 10532);
INSERT INTO public.build_parts VALUES (22314, 10494);
INSERT INTO public.build_parts VALUES (22314, 10435);
INSERT INTO public.build_parts VALUES (22314, 10677);
INSERT INTO public.build_parts VALUES (22315, 10641);
INSERT INTO public.build_parts VALUES (22315, 10467);
INSERT INTO public.build_parts VALUES (22315, 10674);
INSERT INTO public.build_parts VALUES (22316, 10548);
INSERT INTO public.build_parts VALUES (22316, 10428);
INSERT INTO public.build_parts VALUES (22316, 10427);
INSERT INTO public.build_parts VALUES (22316, 10499);
INSERT INTO public.build_parts VALUES (22317, 10559);
INSERT INTO public.build_parts VALUES (22317, 10678);
INSERT INTO public.build_parts VALUES (22318, 10498);
INSERT INTO public.build_parts VALUES (22318, 10638);
INSERT INTO public.build_parts VALUES (22318, 10429);
INSERT INTO public.build_parts VALUES (22318, 10434);
INSERT INTO public.build_parts VALUES (22319, 10663);
INSERT INTO public.build_parts VALUES (22320, 10582);
INSERT INTO public.build_parts VALUES (22321, 10641);
INSERT INTO public.build_parts VALUES (22321, 10429);
INSERT INTO public.build_parts VALUES (22321, 10488);
INSERT INTO public.build_parts VALUES (22321, 10679);
INSERT INTO public.build_parts VALUES (22321, 10524);
INSERT INTO public.build_parts VALUES (22322, 10680);
INSERT INTO public.build_parts VALUES (22322, 10604);
INSERT INTO public.build_parts VALUES (22323, 10609);
INSERT INTO public.build_parts VALUES (22323, 10435);
INSERT INTO public.build_parts VALUES (22323, 10555);
INSERT INTO public.build_parts VALUES (22323, 10600);
INSERT INTO public.build_parts VALUES (22324, 10681);
INSERT INTO public.build_parts VALUES (22324, 10682);
INSERT INTO public.build_parts VALUES (22324, 10554);
INSERT INTO public.build_parts VALUES (22324, 10558);
INSERT INTO public.build_parts VALUES (22324, 10518);
INSERT INTO public.build_parts VALUES (22324, 10467);
INSERT INTO public.build_parts VALUES (22325, 10468);
INSERT INTO public.build_parts VALUES (22325, 10431);
INSERT INTO public.build_parts VALUES (22325, 10489);
INSERT INTO public.build_parts VALUES (22325, 10604);
INSERT INTO public.build_parts VALUES (22325, 10524);
INSERT INTO public.build_parts VALUES (22326, 10468);
INSERT INTO public.build_parts VALUES (22326, 10683);
INSERT INTO public.build_parts VALUES (22326, 10499);
INSERT INTO public.build_parts VALUES (22326, 10429);
INSERT INTO public.build_parts VALUES (22327, 10473);
INSERT INTO public.build_parts VALUES (22327, 10492);
INSERT INTO public.build_parts VALUES (22327, 10584);
INSERT INTO public.build_parts VALUES (22327, 10566);
INSERT INTO public.build_parts VALUES (22328, 10641);
INSERT INTO public.build_parts VALUES (22328, 10638);
INSERT INTO public.build_parts VALUES (22328, 10429);
INSERT INTO public.build_parts VALUES (22328, 10524);
INSERT INTO public.build_parts VALUES (22328, 10654);
INSERT INTO public.build_parts VALUES (22328, 10684);
INSERT INTO public.build_parts VALUES (22328, 10685);
INSERT INTO public.build_parts VALUES (22329, 10481);
INSERT INTO public.build_parts VALUES (22329, 10686);
INSERT INTO public.build_parts VALUES (22329, 10687);
INSERT INTO public.build_parts VALUES (22329, 10540);
INSERT INTO public.build_parts VALUES (22329, 10510);
INSERT INTO public.build_parts VALUES (22329, 10473);
INSERT INTO public.build_parts VALUES (22330, 10688);
INSERT INTO public.build_parts VALUES (22330, 10537);
INSERT INTO public.build_parts VALUES (22330, 10459);
INSERT INTO public.build_parts VALUES (22330, 10522);
INSERT INTO public.build_parts VALUES (22331, 10639);
INSERT INTO public.build_parts VALUES (22331, 10493);
INSERT INTO public.build_parts VALUES (22331, 10429);
INSERT INTO public.build_parts VALUES (22331, 10689);
INSERT INTO public.build_parts VALUES (22331, 10435);
INSERT INTO public.build_parts VALUES (22331, 10568);
INSERT INTO public.build_parts VALUES (22331, 10690);
INSERT INTO public.build_parts VALUES (22331, 10691);
INSERT INTO public.build_parts VALUES (22332, 10692);
INSERT INTO public.build_parts VALUES (22332, 10435);
INSERT INTO public.build_parts VALUES (22332, 10624);
INSERT INTO public.build_parts VALUES (22333, 10693);
INSERT INTO public.build_parts VALUES (22333, 10499);
INSERT INTO public.build_parts VALUES (22333, 10694);
INSERT INTO public.build_parts VALUES (22333, 10478);
INSERT INTO public.build_parts VALUES (22333, 10474);
INSERT INTO public.build_parts VALUES (22333, 10427);
INSERT INTO public.build_parts VALUES (22334, 10693);
INSERT INTO public.build_parts VALUES (22334, 10435);
INSERT INTO public.build_parts VALUES (22334, 10445);
INSERT INTO public.build_parts VALUES (22334, 10515);
INSERT INTO public.build_parts VALUES (22334, 10593);
INSERT INTO public.build_parts VALUES (22334, 10514);
INSERT INTO public.build_parts VALUES (22335, 10695);
INSERT INTO public.build_parts VALUES (22335, 10421);
INSERT INTO public.build_parts VALUES (22335, 10431);
INSERT INTO public.build_parts VALUES (22336, 10639);
INSERT INTO public.build_parts VALUES (22336, 10646);
INSERT INTO public.build_parts VALUES (22336, 10637);
INSERT INTO public.build_parts VALUES (22337, 10492);
INSERT INTO public.build_parts VALUES (22337, 10425);
INSERT INTO public.build_parts VALUES (22337, 10696);
INSERT INTO public.build_parts VALUES (22337, 10475);
INSERT INTO public.build_parts VALUES (22337, 10435);
INSERT INTO public.build_parts VALUES (22338, 10456);
INSERT INTO public.build_parts VALUES (22338, 10697);
INSERT INTO public.build_parts VALUES (22338, 10682);
INSERT INTO public.build_parts VALUES (22339, 10527);
INSERT INTO public.build_parts VALUES (22339, 10493);
INSERT INTO public.build_parts VALUES (22339, 10431);
INSERT INTO public.build_parts VALUES (22339, 10698);
INSERT INTO public.build_parts VALUES (22339, 10526);
INSERT INTO public.build_parts VALUES (22339, 10699);
INSERT INTO public.build_parts VALUES (22339, 10551);
INSERT INTO public.build_parts VALUES (22339, 10593);
INSERT INTO public.build_parts VALUES (22339, 10434);
INSERT INTO public.build_parts VALUES (22340, 10564);
INSERT INTO public.build_parts VALUES (22340, 10435);
INSERT INTO public.build_parts VALUES (22340, 10654);
INSERT INTO public.build_parts VALUES (22340, 10427);
INSERT INTO public.build_parts VALUES (22341, 10700);
INSERT INTO public.build_parts VALUES (22341, 10427);
INSERT INTO public.build_parts VALUES (22341, 10462);
INSERT INTO public.build_parts VALUES (22342, 10483);
INSERT INTO public.build_parts VALUES (22342, 10585);
INSERT INTO public.build_parts VALUES (22342, 10574);
INSERT INTO public.build_parts VALUES (22343, 10474);
INSERT INTO public.build_parts VALUES (22343, 10494);
INSERT INTO public.build_parts VALUES (22343, 10444);
INSERT INTO public.build_parts VALUES (22344, 10613);
INSERT INTO public.build_parts VALUES (22344, 10527);
INSERT INTO public.build_parts VALUES (22344, 10499);
INSERT INTO public.build_parts VALUES (22344, 10435);
INSERT INTO public.build_parts VALUES (22344, 10523);
INSERT INTO public.build_parts VALUES (22345, 10479);
INSERT INTO public.build_parts VALUES (22345, 10438);
INSERT INTO public.build_parts VALUES (22345, 10555);
INSERT INTO public.build_parts VALUES (22345, 10466);
INSERT INTO public.build_parts VALUES (22345, 10429);
INSERT INTO public.build_parts VALUES (22346, 10609);
INSERT INTO public.build_parts VALUES (22346, 10701);
INSERT INTO public.build_parts VALUES (22347, 10469);
INSERT INTO public.build_parts VALUES (22347, 10604);
INSERT INTO public.build_parts VALUES (22348, 10559);
INSERT INTO public.build_parts VALUES (22349, 10472);
INSERT INTO public.build_parts VALUES (22349, 10433);
INSERT INTO public.build_parts VALUES (22349, 10702);
INSERT INTO public.build_parts VALUES (22350, 10599);
INSERT INTO public.build_parts VALUES (22350, 10435);
INSERT INTO public.build_parts VALUES (22350, 10451);
INSERT INTO public.build_parts VALUES (22350, 10637);
INSERT INTO public.build_parts VALUES (22350, 10480);
INSERT INTO public.build_parts VALUES (22351, 10559);
INSERT INTO public.build_parts VALUES (22351, 10669);
INSERT INTO public.build_parts VALUES (22351, 10604);
INSERT INTO public.build_parts VALUES (22352, 10641);
INSERT INTO public.build_parts VALUES (22352, 10427);
INSERT INTO public.build_parts VALUES (22352, 10488);
INSERT INTO public.build_parts VALUES (22353, 10703);
INSERT INTO public.build_parts VALUES (22353, 10435);
INSERT INTO public.build_parts VALUES (22353, 10532);
INSERT INTO public.build_parts VALUES (22353, 10473);
INSERT INTO public.build_parts VALUES (22353, 10673);
INSERT INTO public.build_parts VALUES (22353, 10681);
INSERT INTO public.build_parts VALUES (22353, 10704);
INSERT INTO public.build_parts VALUES (22354, 10559);
INSERT INTO public.build_parts VALUES (22354, 10669);
INSERT INTO public.build_parts VALUES (22354, 10427);
INSERT INTO public.build_parts VALUES (22355, 10498);
INSERT INTO public.build_parts VALUES (22356, 10502);
INSERT INTO public.build_parts VALUES (22357, 10471);
INSERT INTO public.build_parts VALUES (22358, 10627);
INSERT INTO public.build_parts VALUES (22359, 10481);
INSERT INTO public.build_parts VALUES (22359, 10427);
INSERT INTO public.build_parts VALUES (22360, 10695);
INSERT INTO public.build_parts VALUES (22360, 10429);
INSERT INTO public.build_parts VALUES (22361, 10586);
INSERT INTO public.build_parts VALUES (22362, 10692);
INSERT INTO public.build_parts VALUES (22362, 10434);
INSERT INTO public.build_parts VALUES (22362, 10433);
INSERT INTO public.build_parts VALUES (22363, 10631);
INSERT INTO public.build_parts VALUES (22363, 10444);
INSERT INTO public.build_parts VALUES (22363, 10464);
INSERT INTO public.build_parts VALUES (22363, 10622);
INSERT INTO public.build_parts VALUES (22364, 10613);
INSERT INTO public.build_parts VALUES (22364, 10508);
INSERT INTO public.build_parts VALUES (22364, 10705);
INSERT INTO public.build_parts VALUES (22365, 10519);
INSERT INTO public.build_parts VALUES (22365, 10706);
INSERT INTO public.build_parts VALUES (22365, 10489);
INSERT INTO public.build_parts VALUES (22365, 10707);
INSERT INTO public.build_parts VALUES (22365, 10687);
INSERT INTO public.build_parts VALUES (22365, 10499);
INSERT INTO public.build_parts VALUES (22365, 10508);
INSERT INTO public.build_parts VALUES (22365, 10506);
INSERT INTO public.build_parts VALUES (22365, 10435);
INSERT INTO public.build_parts VALUES (22365, 10524);
INSERT INTO public.build_parts VALUES (22365, 10464);
INSERT INTO public.build_parts VALUES (22366, 10548);
INSERT INTO public.build_parts VALUES (22366, 10477);
INSERT INTO public.build_parts VALUES (22366, 10708);
INSERT INTO public.build_parts VALUES (22366, 10709);
INSERT INTO public.build_parts VALUES (22366, 10710);
INSERT INTO public.build_parts VALUES (22366, 10540);
INSERT INTO public.build_parts VALUES (22366, 10711);
INSERT INTO public.build_parts VALUES (22366, 10521);
INSERT INTO public.build_parts VALUES (22367, 10559);
INSERT INTO public.build_parts VALUES (22367, 10712);
INSERT INTO public.build_parts VALUES (22368, 10680);
INSERT INTO public.build_parts VALUES (22368, 10603);
INSERT INTO public.build_parts VALUES (22368, 10588);
INSERT INTO public.build_parts VALUES (22368, 10713);
INSERT INTO public.build_parts VALUES (22369, 10456);
INSERT INTO public.build_parts VALUES (22369, 10593);
INSERT INTO public.build_parts VALUES (22370, 10608);
INSERT INTO public.build_parts VALUES (22370, 10641);
INSERT INTO public.build_parts VALUES (22370, 10457);
INSERT INTO public.build_parts VALUES (22370, 10493);
INSERT INTO public.build_parts VALUES (22371, 10519);
INSERT INTO public.build_parts VALUES (22371, 10476);
INSERT INTO public.build_parts VALUES (22371, 10467);
INSERT INTO public.build_parts VALUES (22371, 10714);
INSERT INTO public.build_parts VALUES (22371, 10445);
INSERT INTO public.build_parts VALUES (22371, 10715);
INSERT INTO public.build_parts VALUES (22371, 10451);
INSERT INTO public.build_parts VALUES (22371, 10690);
INSERT INTO public.build_parts VALUES (22371, 10633);
INSERT INTO public.build_parts VALUES (22371, 10464);
INSERT INTO public.build_parts VALUES (22371, 10705);
INSERT INTO public.build_parts VALUES (22371, 10605);
INSERT INTO public.build_parts VALUES (22372, 10609);
INSERT INTO public.build_parts VALUES (22372, 10572);
INSERT INTO public.build_parts VALUES (22372, 10444);
INSERT INTO public.build_parts VALUES (22372, 10716);
INSERT INTO public.build_parts VALUES (22373, 10468);
INSERT INTO public.build_parts VALUES (22374, 10547);
INSERT INTO public.build_parts VALUES (22374, 10489);
INSERT INTO public.build_parts VALUES (22374, 10469);
INSERT INTO public.build_parts VALUES (22374, 10427);
INSERT INTO public.build_parts VALUES (22374, 10499);
INSERT INTO public.build_parts VALUES (22374, 10521);
INSERT INTO public.build_parts VALUES (22374, 10493);
INSERT INTO public.build_parts VALUES (22375, 10613);
INSERT INTO public.build_parts VALUES (22375, 10562);
INSERT INTO public.build_parts VALUES (22375, 10493);
INSERT INTO public.build_parts VALUES (22375, 10717);
INSERT INTO public.build_parts VALUES (22375, 10429);
INSERT INTO public.build_parts VALUES (22375, 10718);
INSERT INTO public.build_parts VALUES (22375, 10719);
INSERT INTO public.build_parts VALUES (22376, 10492);
INSERT INTO public.build_parts VALUES (22376, 10489);
INSERT INTO public.build_parts VALUES (22376, 10490);
INSERT INTO public.build_parts VALUES (22376, 10444);
INSERT INTO public.build_parts VALUES (22377, 10492);
INSERT INTO public.build_parts VALUES (22377, 10501);
INSERT INTO public.build_parts VALUES (22377, 10555);
INSERT INTO public.build_parts VALUES (22378, 10426);
INSERT INTO public.build_parts VALUES (22378, 10459);
INSERT INTO public.build_parts VALUES (22378, 10561);


--
-- Data for Name: builds; Type: TABLE DATA; Schema: public; Owner: dev
--

INSERT INTO public.builds VALUES (22182, '44ef9ec3', 8210);
INSERT INTO public.builds VALUES (22183, '7a16c0f3', 7635);
INSERT INTO public.builds VALUES (22184, 'ec228def', 7459);
INSERT INTO public.builds VALUES (22185, 'd830b467', 7963);
INSERT INTO public.builds VALUES (22186, 'a7ceb306', 8300);
INSERT INTO public.builds VALUES (22187, '504eb912', 8146);
INSERT INTO public.builds VALUES (22188, 'e9e083e7', 7824);
INSERT INTO public.builds VALUES (22189, 'f45e31a9', 7824);
INSERT INTO public.builds VALUES (22190, '68a8f584', 8291);
INSERT INTO public.builds VALUES (22191, '856e3d09', 7834);
INSERT INTO public.builds VALUES (22192, '1cbd18ed', 7886);
INSERT INTO public.builds VALUES (22193, '67ea6de1', 7611);
INSERT INTO public.builds VALUES (22194, '10f7f1c2', 7448);
INSERT INTO public.builds VALUES (22195, '5219cebf', 8392);
INSERT INTO public.builds VALUES (22196, '4c2e577f', 7126);
INSERT INTO public.builds VALUES (22197, 'bc5da0d3', 7781);
INSERT INTO public.builds VALUES (22198, 'd1eeb25e', 7864);
INSERT INTO public.builds VALUES (22199, '7a14d97a', 7661);
INSERT INTO public.builds VALUES (22200, 'e126a1d2', 7369);
INSERT INTO public.builds VALUES (22201, 'd77836df', 7396);
INSERT INTO public.builds VALUES (22202, 'b5b5dac9', 7992);
INSERT INTO public.builds VALUES (22203, 'a30026dd', 8264);
INSERT INTO public.builds VALUES (22204, '24aea66f', 7838);
INSERT INTO public.builds VALUES (22205, '25034404', 7693);
INSERT INTO public.builds VALUES (22206, '74911c1b', 7670);
INSERT INTO public.builds VALUES (22207, '941f5bbb', 7609);
INSERT INTO public.builds VALUES (22208, '5cca95b8', 7921);
INSERT INTO public.builds VALUES (22209, 'e14609d3', 8217);
INSERT INTO public.builds VALUES (22210, '9d0273fd', 7747);
INSERT INTO public.builds VALUES (22211, 'dc7795d9', 7996);
INSERT INTO public.builds VALUES (22212, '8715e396', 7703);
INSERT INTO public.builds VALUES (22213, '5ea47118', 7476);
INSERT INTO public.builds VALUES (22214, '26e62f50', 8248);
INSERT INTO public.builds VALUES (22215, '24016f7a', 8299);
INSERT INTO public.builds VALUES (22216, 'c549ec65', 7509);
INSERT INTO public.builds VALUES (22217, '4b6127d1', 7286);
INSERT INTO public.builds VALUES (22218, '3da1a765', 8021);
INSERT INTO public.builds VALUES (22219, '948493ab', 8402);
INSERT INTO public.builds VALUES (22220, '4cf7c1d3', 8406);
INSERT INTO public.builds VALUES (22221, '746c89cb', 7544);
INSERT INTO public.builds VALUES (22222, '554510f3', 8303);
INSERT INTO public.builds VALUES (22223, 'a77203f2', 7503);
INSERT INTO public.builds VALUES (22224, '7f5ea6b3', 7960);
INSERT INTO public.builds VALUES (22225, '21fe86fb', 8298);
INSERT INTO public.builds VALUES (22226, 'd737a6d9', 7595);
INSERT INTO public.builds VALUES (22227, 'eeaeccea', 7881);
INSERT INTO public.builds VALUES (22228, '33c16dbe', 8352);
INSERT INTO public.builds VALUES (22229, '7282f4af', 7441);
INSERT INTO public.builds VALUES (22230, '8e4bcb8c', 8074);
INSERT INTO public.builds VALUES (22231, '651745b4', 8429);
INSERT INTO public.builds VALUES (22232, '4442c4c6', 7751);
INSERT INTO public.builds VALUES (22233, 'decfe131', 8551);
INSERT INTO public.builds VALUES (22234, '13c651a6', 8623);
INSERT INTO public.builds VALUES (22235, '613b494d', 8894);
INSERT INTO public.builds VALUES (22236, '2556447f', 8299);
INSERT INTO public.builds VALUES (22237, '663b52b2', 8862);
INSERT INTO public.builds VALUES (22238, 'ab46c769', 8256);
INSERT INTO public.builds VALUES (22239, '3a59a567', 9008);
INSERT INTO public.builds VALUES (22240, 'c860bd9b', 8955);
INSERT INTO public.builds VALUES (22241, 'c3404dfd', 8870);
INSERT INTO public.builds VALUES (22242, '1157a497', 8002);
INSERT INTO public.builds VALUES (22243, 'b03e1123', 8257);
INSERT INTO public.builds VALUES (22244, '7fc3bc92', 8457);
INSERT INTO public.builds VALUES (22245, '17130b70', 7554);
INSERT INTO public.builds VALUES (22246, 'c7e9edf5', 8044);
INSERT INTO public.builds VALUES (22247, 'f38adb8f', 7762);
INSERT INTO public.builds VALUES (22248, '64ab7573', 8549);
INSERT INTO public.builds VALUES (22249, '95c3ff97', 8865);
INSERT INTO public.builds VALUES (22250, '247902e6', 9329);
INSERT INTO public.builds VALUES (22251, '47d4e0d3', 9330);
INSERT INTO public.builds VALUES (22252, '12b40d37', 8345);
INSERT INTO public.builds VALUES (22253, '957afe63', 9278);
INSERT INTO public.builds VALUES (22254, '88347018', 9055);
INSERT INTO public.builds VALUES (22255, 'f26a3e8a', 8314);
INSERT INTO public.builds VALUES (22256, '3207d9d8', 8299);
INSERT INTO public.builds VALUES (22257, '534ae076', 8980);
INSERT INTO public.builds VALUES (22258, '56bdfd40', 8212);
INSERT INTO public.builds VALUES (22259, '3cab668c', 8004);
INSERT INTO public.builds VALUES (22260, '3adfcdf0', 8346);
INSERT INTO public.builds VALUES (22261, '2e1e8343', 8084);
INSERT INTO public.builds VALUES (22262, '88aa936d', 8950);
INSERT INTO public.builds VALUES (22263, '9931ddfb', 8700);
INSERT INTO public.builds VALUES (22264, '976e182e', 9218);
INSERT INTO public.builds VALUES (22265, '8cb777b9', 7535);
INSERT INTO public.builds VALUES (22266, 'fd284917', 7998);
INSERT INTO public.builds VALUES (22267, 'b6a26cf5', 7708);
INSERT INTO public.builds VALUES (22268, '175059ce', 7904);
INSERT INTO public.builds VALUES (22269, '40b46c8a', 7753);
INSERT INTO public.builds VALUES (22270, '319436d0', 8490);
INSERT INTO public.builds VALUES (22271, '3251d4bb', 7167);
INSERT INTO public.builds VALUES (22272, '6f4bb8d5', 7877);
INSERT INTO public.builds VALUES (22273, '84eddf71', 7275);
INSERT INTO public.builds VALUES (22274, '207eda42', 7937);
INSERT INTO public.builds VALUES (22275, 'a3987fa5', 7556);
INSERT INTO public.builds VALUES (22276, '5a2ffbd0', 8300);
INSERT INTO public.builds VALUES (22277, '1a971ea2', 8380);
INSERT INTO public.builds VALUES (22278, 'f5b52174', 7959);
INSERT INTO public.builds VALUES (22279, '407c3431', 8586);
INSERT INTO public.builds VALUES (22280, 'c030d661', 7945);
INSERT INTO public.builds VALUES (22281, '17762911', 8830);
INSERT INTO public.builds VALUES (22282, '018c914e', 8490);
INSERT INTO public.builds VALUES (22283, '2a7d0a8d', 9355);
INSERT INTO public.builds VALUES (22284, 'a630bfeb', 9320);
INSERT INTO public.builds VALUES (22285, '801bcbe4', 8947);
INSERT INTO public.builds VALUES (22286, '6e6a50a3', 8831);
INSERT INTO public.builds VALUES (22287, 'caa1add7', 8341);
INSERT INTO public.builds VALUES (22288, 'dccc9d51', 9159);
INSERT INTO public.builds VALUES (22289, '14797e7b', 9176);
INSERT INTO public.builds VALUES (22290, '02724f18', 9213);
INSERT INTO public.builds VALUES (22291, '2a41a230', 8363);
INSERT INTO public.builds VALUES (22292, '5162a401', 8458);
INSERT INTO public.builds VALUES (22293, 'c88b0582', 8615);
INSERT INTO public.builds VALUES (22294, 'bc08ae72', 8376);
INSERT INTO public.builds VALUES (22295, '0237a897', 8281);
INSERT INTO public.builds VALUES (22296, 'a3242251', 8302);
INSERT INTO public.builds VALUES (22297, '526fc2ab', 8171);
INSERT INTO public.builds VALUES (22298, '57b5fed2', 7997);
INSERT INTO public.builds VALUES (22299, 'f774bb41', 8433);
INSERT INTO public.builds VALUES (22300, '04d22ad0', 8201);
INSERT INTO public.builds VALUES (22301, '62731fd8', 7967);
INSERT INTO public.builds VALUES (22302, 'f4424f4d', 8289);
INSERT INTO public.builds VALUES (22303, '8cd8a5b4', 8279);
INSERT INTO public.builds VALUES (22304, 'c01c5215', 8071);
INSERT INTO public.builds VALUES (22305, '5a969b4f', 7670);
INSERT INTO public.builds VALUES (22306, '6729cce6', 7997);
INSERT INTO public.builds VALUES (22307, '4f9da249', 8178);
INSERT INTO public.builds VALUES (22308, 'ce57e8e2', 7735);
INSERT INTO public.builds VALUES (22309, '535200d0', 8065);
INSERT INTO public.builds VALUES (22310, 'd4ced978', 7596);
INSERT INTO public.builds VALUES (22311, '51d683ec', 7718);
INSERT INTO public.builds VALUES (22312, 'dd5cd50c', 7250);
INSERT INTO public.builds VALUES (22313, 'f8528e7c', 7411);
INSERT INTO public.builds VALUES (22314, '092deb21', 7402);
INSERT INTO public.builds VALUES (22315, 'b9bf8919', 8903);
INSERT INTO public.builds VALUES (22316, 'ab86f225', 8829);
INSERT INTO public.builds VALUES (22317, 'ea8d7579', 8112);
INSERT INTO public.builds VALUES (22318, 'c9edfc05', 8143);
INSERT INTO public.builds VALUES (22319, '77d0f2ae', 8146);
INSERT INTO public.builds VALUES (22320, 'a93e24e5', 7199);
INSERT INTO public.builds VALUES (22321, 'd5bbd51d', 8354);
INSERT INTO public.builds VALUES (22322, '2f6ac048', 8395);
INSERT INTO public.builds VALUES (22323, 'ebccb2ce', 7708);
INSERT INTO public.builds VALUES (22324, '3bc695e9', 8493);
INSERT INTO public.builds VALUES (22325, '98e51c91', 8975);
INSERT INTO public.builds VALUES (22326, 'ca89f85b', 9010);
INSERT INTO public.builds VALUES (22327, '3adbd7ae', 8290);
INSERT INTO public.builds VALUES (22328, '595584a8', 8837);
INSERT INTO public.builds VALUES (22329, 'ce3a9da2', 7421);
INSERT INTO public.builds VALUES (22330, '1323a3ef', 8009);
INSERT INTO public.builds VALUES (22331, 'e449b953', 7856);
INSERT INTO public.builds VALUES (22332, '7e86b701', 7376);
INSERT INTO public.builds VALUES (22333, '4254caab', 7614);
INSERT INTO public.builds VALUES (22334, '4a5df56e', 8143);
INSERT INTO public.builds VALUES (22335, '564ce1bd', 7628);
INSERT INTO public.builds VALUES (22336, '98e1a34e', 7381);
INSERT INTO public.builds VALUES (22337, 'c2e7808c', 7549);
INSERT INTO public.builds VALUES (22338, '3fbc1d72', 7853);
INSERT INTO public.builds VALUES (22339, '24d418c7', 7800);
INSERT INTO public.builds VALUES (22340, 'cfcc5005', 7039);
INSERT INTO public.builds VALUES (22341, 'efd7a296', 7726);
INSERT INTO public.builds VALUES (22342, 'e15dc156', 7518);
INSERT INTO public.builds VALUES (22343, 'a83baa94', 7809);
INSERT INTO public.builds VALUES (22344, '2a476959', 7369);
INSERT INTO public.builds VALUES (22345, 'b6d3c247', 7897);
INSERT INTO public.builds VALUES (22346, '95a72fb2', 7570);
INSERT INTO public.builds VALUES (22347, '8eebace6', 7821);
INSERT INTO public.builds VALUES (22348, '91bb0707', 7989);
INSERT INTO public.builds VALUES (22349, 'c7f26c43', 8500);
INSERT INTO public.builds VALUES (22350, '3c31562c', 7720);
INSERT INTO public.builds VALUES (22351, '8a3f304e', 8496);
INSERT INTO public.builds VALUES (22352, 'cbb6738f', 8999);
INSERT INTO public.builds VALUES (22353, 'b29628d4', 8867);
INSERT INTO public.builds VALUES (22354, '757e9b42', 8959);
INSERT INTO public.builds VALUES (22355, '70e99ab8', 8352);
INSERT INTO public.builds VALUES (22356, '25e7eb62', 8513);
INSERT INTO public.builds VALUES (22357, '7539cfa1', 8884);
INSERT INTO public.builds VALUES (22358, '5eebd9ca', 8992);
INSERT INTO public.builds VALUES (22359, 'a24f332e', 8354);
INSERT INTO public.builds VALUES (22360, 'bc93aaa5', 8999);
INSERT INTO public.builds VALUES (22361, '5f826b7e', 9057);
INSERT INTO public.builds VALUES (22362, 'f6172053', 8828);
INSERT INTO public.builds VALUES (22363, '799be8ff', 8800);
INSERT INTO public.builds VALUES (22364, 'd78fab15', 7957);
INSERT INTO public.builds VALUES (22365, 'e69c77bf', 7587);
INSERT INTO public.builds VALUES (22366, '7d97715c', 7503);
INSERT INTO public.builds VALUES (22367, '5c89f473', 8019);
INSERT INTO public.builds VALUES (22368, 'd68a65a6', 8423);
INSERT INTO public.builds VALUES (22369, 'bd7a51c2', 7484);
INSERT INTO public.builds VALUES (22370, 'f4cb6427', 7540);
INSERT INTO public.builds VALUES (22371, '3a6cfa16', 8473);
INSERT INTO public.builds VALUES (22372, '5d926211', 7778);
INSERT INTO public.builds VALUES (22373, 'f08c1d42', 7837);
INSERT INTO public.builds VALUES (22374, '1cc59f5b', 8168);
INSERT INTO public.builds VALUES (22375, '23b782e2', 7636);
INSERT INTO public.builds VALUES (22376, '0780114f', 7676);
INSERT INTO public.builds VALUES (22377, 'ffbfb27f', 7939);
INSERT INTO public.builds VALUES (22378, '325bc11f', 7724);


--
-- Data for Name: match_player_resources; Type: TABLE DATA; Schema: public; Owner: dev
--

INSERT INTO public.match_player_resources VALUES (17975, 39, 45);
INSERT INTO public.match_player_resources VALUES (17975, 40, 1286);
INSERT INTO public.match_player_resources VALUES (17975, 41, 1);
INSERT INTO public.match_player_resources VALUES (17975, 42, 3935);
INSERT INTO public.match_player_resources VALUES (17975, 43, 3935);
INSERT INTO public.match_player_resources VALUES (17975, 44, 3935);
INSERT INTO public.match_player_resources VALUES (18001, 45, 18);
INSERT INTO public.match_player_resources VALUES (18001, 40, 665);
INSERT INTO public.match_player_resources VALUES (18001, 41, 1);
INSERT INTO public.match_player_resources VALUES (18001, 42, 2034);
INSERT INTO public.match_player_resources VALUES (18001, 43, 2034);
INSERT INTO public.match_player_resources VALUES (18001, 44, 2034);
INSERT INTO public.match_player_resources VALUES (18007, 39, 41);
INSERT INTO public.match_player_resources VALUES (18007, 40, 932);
INSERT INTO public.match_player_resources VALUES (18007, 41, 4);
INSERT INTO public.match_player_resources VALUES (18007, 42, 8769);
INSERT INTO public.match_player_resources VALUES (18007, 43, 8769);
INSERT INTO public.match_player_resources VALUES (18007, 44, 8769);
INSERT INTO public.match_player_resources VALUES (18023, 39, 29);
INSERT INTO public.match_player_resources VALUES (18023, 40, 787);
INSERT INTO public.match_player_resources VALUES (18023, 41, 4);
INSERT INTO public.match_player_resources VALUES (18023, 42, 7405);
INSERT INTO public.match_player_resources VALUES (18023, 43, 7405);
INSERT INTO public.match_player_resources VALUES (18023, 44, 7405);
INSERT INTO public.match_player_resources VALUES (18039, 39, 47);
INSERT INTO public.match_player_resources VALUES (18039, 40, 1295);
INSERT INTO public.match_player_resources VALUES (18039, 41, 4);
INSERT INTO public.match_player_resources VALUES (18039, 42, 12185);
INSERT INTO public.match_player_resources VALUES (18039, 43, 12185);
INSERT INTO public.match_player_resources VALUES (18039, 44, 12185);
INSERT INTO public.match_player_resources VALUES (18055, 39, 40);
INSERT INTO public.match_player_resources VALUES (18055, 40, 690);
INSERT INTO public.match_player_resources VALUES (18055, 41, 4);
INSERT INTO public.match_player_resources VALUES (18055, 42, 6492);
INSERT INTO public.match_player_resources VALUES (18055, 43, 6492);
INSERT INTO public.match_player_resources VALUES (18055, 44, 6492);
INSERT INTO public.match_player_resources VALUES (18071, 39, 44);
INSERT INTO public.match_player_resources VALUES (18071, 40, 1267);
INSERT INTO public.match_player_resources VALUES (18071, 41, 4);
INSERT INTO public.match_player_resources VALUES (18071, 42, 11921);
INSERT INTO public.match_player_resources VALUES (18071, 43, 11921);
INSERT INTO public.match_player_resources VALUES (18071, 44, 11921);
INSERT INTO public.match_player_resources VALUES (18087, 45, 19);
INSERT INTO public.match_player_resources VALUES (18087, 40, 1277);
INSERT INTO public.match_player_resources VALUES (18087, 41, 3);
INSERT INTO public.match_player_resources VALUES (18087, 42, 9612);
INSERT INTO public.match_player_resources VALUES (18087, 43, 9612);
INSERT INTO public.match_player_resources VALUES (18087, 44, 9612);
INSERT INTO public.match_player_resources VALUES (18103, 45, 20);
INSERT INTO public.match_player_resources VALUES (18103, 40, 1312);
INSERT INTO public.match_player_resources VALUES (18103, 41, 2);
INSERT INTO public.match_player_resources VALUES (18103, 42, 7407);
INSERT INTO public.match_player_resources VALUES (18103, 43, 7407);
INSERT INTO public.match_player_resources VALUES (18103, 44, 7407);
INSERT INTO public.match_player_resources VALUES (18119, 45, 12);
INSERT INTO public.match_player_resources VALUES (18119, 40, 689);
INSERT INTO public.match_player_resources VALUES (18119, 41, 1);
INSERT INTO public.match_player_resources VALUES (18119, 42, 2593);
INSERT INTO public.match_player_resources VALUES (18119, 43, 2593);
INSERT INTO public.match_player_resources VALUES (18119, 44, 2593);
INSERT INTO public.match_player_resources VALUES (18135, 45, 18);
INSERT INTO public.match_player_resources VALUES (18135, 40, 1256);
INSERT INTO public.match_player_resources VALUES (18135, 41, 1);
INSERT INTO public.match_player_resources VALUES (18135, 42, 4727);
INSERT INTO public.match_player_resources VALUES (18135, 43, 4727);
INSERT INTO public.match_player_resources VALUES (18135, 44, 4727);
INSERT INTO public.match_player_resources VALUES (18151, 45, 13);
INSERT INTO public.match_player_resources VALUES (18151, 40, 777);
INSERT INTO public.match_player_resources VALUES (18151, 41, 0);
INSERT INTO public.match_player_resources VALUES (18151, 42, 1462);
INSERT INTO public.match_player_resources VALUES (18151, 43, 1462);
INSERT INTO public.match_player_resources VALUES (18151, 44, 1462);
INSERT INTO public.match_player_resources VALUES (18167, 45, 14);
INSERT INTO public.match_player_resources VALUES (18167, 40, 933);
INSERT INTO public.match_player_resources VALUES (18167, 41, 0);
INSERT INTO public.match_player_resources VALUES (18167, 42, 1755);
INSERT INTO public.match_player_resources VALUES (18167, 43, 1755);
INSERT INTO public.match_player_resources VALUES (18167, 44, 1755);
INSERT INTO public.match_player_resources VALUES (18183, 45, 18);
INSERT INTO public.match_player_resources VALUES (18183, 40, 901);
INSERT INTO public.match_player_resources VALUES (18183, 41, 0);
INSERT INTO public.match_player_resources VALUES (18183, 42, 1695);
INSERT INTO public.match_player_resources VALUES (18183, 43, 1695);
INSERT INTO public.match_player_resources VALUES (18183, 44, 1695);
INSERT INTO public.match_player_resources VALUES (18209, 45, 12);
INSERT INTO public.match_player_resources VALUES (18209, 40, 943);
INSERT INTO public.match_player_resources VALUES (18209, 41, 0);
INSERT INTO public.match_player_resources VALUES (18209, 42, 1774);
INSERT INTO public.match_player_resources VALUES (18209, 43, 1774);
INSERT INTO public.match_player_resources VALUES (18209, 44, 1774);
INSERT INTO public.match_player_resources VALUES (18215, 39, 37);
INSERT INTO public.match_player_resources VALUES (18215, 40, 162);
INSERT INTO public.match_player_resources VALUES (18215, 41, 4);
INSERT INTO public.match_player_resources VALUES (18215, 42, 1524);
INSERT INTO public.match_player_resources VALUES (18215, 43, 1524);
INSERT INTO public.match_player_resources VALUES (18215, 44, 1524);
INSERT INTO public.match_player_resources VALUES (18231, 39, 43);
INSERT INTO public.match_player_resources VALUES (18231, 40, 1246);
INSERT INTO public.match_player_resources VALUES (18231, 41, 4);
INSERT INTO public.match_player_resources VALUES (18231, 42, 11724);
INSERT INTO public.match_player_resources VALUES (18231, 43, 11724);
INSERT INTO public.match_player_resources VALUES (18231, 44, 11724);
INSERT INTO public.match_player_resources VALUES (18247, 39, 41);
INSERT INTO public.match_player_resources VALUES (18247, 40, 545);
INSERT INTO public.match_player_resources VALUES (18247, 41, 4);
INSERT INTO public.match_player_resources VALUES (18247, 42, 5128);
INSERT INTO public.match_player_resources VALUES (18247, 43, 5128);
INSERT INTO public.match_player_resources VALUES (18247, 44, 5128);
INSERT INTO public.match_player_resources VALUES (18263, 45, 20);
INSERT INTO public.match_player_resources VALUES (18263, 40, 1303);
INSERT INTO public.match_player_resources VALUES (18263, 41, 4);
INSERT INTO public.match_player_resources VALUES (18263, 42, 12260);
INSERT INTO public.match_player_resources VALUES (18263, 43, 12260);
INSERT INTO public.match_player_resources VALUES (18263, 44, 12260);
INSERT INTO public.match_player_resources VALUES (18291, 45, 12);
INSERT INTO public.match_player_resources VALUES (18291, 40, 869);
INSERT INTO public.match_player_resources VALUES (18291, 41, 4);
INSERT INTO public.match_player_resources VALUES (18291, 42, 8176);
INSERT INTO public.match_player_resources VALUES (18291, 43, 8176);
INSERT INTO public.match_player_resources VALUES (18291, 44, 8176);
INSERT INTO public.match_player_resources VALUES (18308, 45, 13);
INSERT INTO public.match_player_resources VALUES (18308, 40, 1261);
INSERT INTO public.match_player_resources VALUES (18308, 41, 4);
INSERT INTO public.match_player_resources VALUES (18308, 42, 11865);
INSERT INTO public.match_player_resources VALUES (18308, 43, 11865);
INSERT INTO public.match_player_resources VALUES (18308, 44, 11865);
INSERT INTO public.match_player_resources VALUES (18311, 45, 19);
INSERT INTO public.match_player_resources VALUES (18311, 40, 1281);
INSERT INTO public.match_player_resources VALUES (18311, 41, 2);
INSERT INTO public.match_player_resources VALUES (18311, 42, 7232);
INSERT INTO public.match_player_resources VALUES (18311, 43, 7232);
INSERT INTO public.match_player_resources VALUES (18311, 44, 7232);
INSERT INTO public.match_player_resources VALUES (18327, 45, 19);
INSERT INTO public.match_player_resources VALUES (18327, 40, 1260);
INSERT INTO public.match_player_resources VALUES (18327, 41, 2);
INSERT INTO public.match_player_resources VALUES (18327, 42, 7113);
INSERT INTO public.match_player_resources VALUES (18327, 43, 7113);
INSERT INTO public.match_player_resources VALUES (18327, 44, 7113);
INSERT INTO public.match_player_resources VALUES (18343, 45, 18);
INSERT INTO public.match_player_resources VALUES (18343, 40, 865);
INSERT INTO public.match_player_resources VALUES (18343, 41, 1);
INSERT INTO public.match_player_resources VALUES (18343, 42, 3255);
INSERT INTO public.match_player_resources VALUES (18343, 43, 3255);
INSERT INTO public.match_player_resources VALUES (18343, 44, 3255);
INSERT INTO public.match_player_resources VALUES (18359, 45, 14);
INSERT INTO public.match_player_resources VALUES (18359, 40, 1282);
INSERT INTO public.match_player_resources VALUES (18359, 41, 1);
INSERT INTO public.match_player_resources VALUES (18359, 42, 4825);
INSERT INTO public.match_player_resources VALUES (18359, 43, 4825);
INSERT INTO public.match_player_resources VALUES (18359, 44, 4825);


--
-- Data for Name: match_players; Type: TABLE DATA; Schema: public; Owner: dev
--

INSERT INTO public.match_players VALUES (17975, 1628718728212966, 7907969, false, 'Rot_Fish_Bandit', 1, 0);
INSERT INTO public.match_players VALUES (17976, 1628718728212966, 5018113, false, 'Capemplanet', 1, 0);
INSERT INTO public.match_players VALUES (17977, 1628718728212966, -10114, true, 'Anthony', 1, 0);
INSERT INTO public.match_players VALUES (17978, 1628718728212966, -1266, true, 'Mary', 2, 0);
INSERT INTO public.match_players VALUES (17979, 1628718728212966, -1166, true, 'Emma', 1, 0);
INSERT INTO public.match_players VALUES (17980, 1628718728212966, -5578, true, 'Sandra', 2, 0);
INSERT INTO public.match_players VALUES (17981, 1628718728212966, -1448, true, 'Ryan', 1, 0);
INSERT INTO public.match_players VALUES (17982, 1628718728212966, -21110, true, 'Florence', 2, 0);
INSERT INTO public.match_players VALUES (17983, 1628718728212966, -2912, true, 'Robyn', 1, 0);
INSERT INTO public.match_players VALUES (17984, 1628718728212966, -4628, true, 'Daniel', 2, 0);
INSERT INTO public.match_players VALUES (17985, 1628718728212966, 6884232, false, 'g33kFace', 1, 0);
INSERT INTO public.match_players VALUES (17986, 1628718728212966, 3541656, false, 'Blackhand99', 2, 0);
INSERT INTO public.match_players VALUES (17987, 1628718728212966, 10271124, false, 'IM_GETTIN_HIM', 2, 0);
INSERT INTO public.match_players VALUES (17988, 1628718728212966, 8863049, false, 'MagillaGuerilla', 2, 0);
INSERT INTO public.match_players VALUES (17989, 1628718728212966, 5154927, false, 'ArkStereo', 1, 0);
INSERT INTO public.match_players VALUES (17990, 1628718728212966, 3588454, false, 'KingAceSlayer', 2, 0);
INSERT INTO public.match_players VALUES (17991, 1628719058239445, 2578912, false, 'EvilPython', 1, 51153062);
INSERT INTO public.match_players VALUES (17992, 1628719058239445, 4576722, false, 'CriaDuRodo', 2, 51153045);
INSERT INTO public.match_players VALUES (17993, 1628719058239445, 10936506, false, 'Chillax45094', 1, 0);
INSERT INTO public.match_players VALUES (17994, 1628719058239445, 10276656, false, 'OddFuture420', 2, 0);
INSERT INTO public.match_players VALUES (17995, 1628719058239445, 1373956, false, 'yourgreatestfear', 1, 0);
INSERT INTO public.match_players VALUES (17996, 1628719058239445, 9889917, false, 'Rapiddonkey', 2, 0);
INSERT INTO public.match_players VALUES (17997, 1628719058239445, 10621252, false, 'Lexa202020', 1, 0);
INSERT INTO public.match_players VALUES (17998, 1628719058239445, 2217016, false, 'Ambyra', 2, 51153045);
INSERT INTO public.match_players VALUES (17999, 1628719058239445, 9504226, false, 'SacratusSactus', 2, 0);
INSERT INTO public.match_players VALUES (18000, 1628719058239445, 1796885, false, 'S4G_GALLEGO', 1, 0);
INSERT INTO public.match_players VALUES (18001, 1628719058239445, 7907969, false, 'Rot_Fish_Bandit', 1, 0);
INSERT INTO public.match_players VALUES (18002, 1628719058239445, 10885794, false, 'skullnubis', 2, 0);
INSERT INTO public.match_players VALUES (18003, 1628719058239445, 5454696, false, 'sNake64774', 1, 51153062);
INSERT INTO public.match_players VALUES (18004, 1628719058239445, 94834, false, 'Javier_kuhn', 2, 0);
INSERT INTO public.match_players VALUES (18005, 1628719058239445, 3588454, false, 'KingAceSlayer', 1, 0);
INSERT INTO public.match_players VALUES (18006, 1628719058239445, 3312211, false, 'TheWasistdas', 2, 0);
INSERT INTO public.match_players VALUES (18007, 1633137941586677, 7907969, false, 'Rot_Fish_Bandit', 1, 0);
INSERT INTO public.match_players VALUES (18008, 1633137941586677, -2432, true, 'Helen', 2, 0);
INSERT INTO public.match_players VALUES (18009, 1633137941586677, -2518, true, 'Frank', 1, 0);
INSERT INTO public.match_players VALUES (18010, 1633137941586677, -21378, true, 'Isabella', 2, 0);
INSERT INTO public.match_players VALUES (18011, 1633137941586677, -4794, true, 'Alexis', 1, 0);
INSERT INTO public.match_players VALUES (18012, 1633137941586677, 5446456, false, 'grosta', 1, 51861291);
INSERT INTO public.match_players VALUES (18013, 1633137941586677, 5317272, false, 'Kryrex', 1, 51861291);
INSERT INTO public.match_players VALUES (18014, 1633137941586677, 4755269, false, 'simonbbqc', 2, 51861197);
INSERT INTO public.match_players VALUES (18015, 1633137941586677, 8490318, false, 'BiwingBabe13', 2, 0);
INSERT INTO public.match_players VALUES (18016, 1633137941586677, 4626238, false, 'xXBootyfulBoyXx', 1, 0);
INSERT INTO public.match_players VALUES (18017, 1633137941586677, 10431527, false, 'pervissa', 1, 0);
INSERT INTO public.match_players VALUES (18018, 1633137941586677, 11655260, false, 'Spixes', 2, 51861197);
INSERT INTO public.match_players VALUES (18019, 1633137941586677, 11747291, false, 'DrChaos172', 2, 51861197);
INSERT INTO public.match_players VALUES (18020, 1633137941586677, 3035660, false, 'Taterkaze', 2, 0);
INSERT INTO public.match_players VALUES (18021, 1633137941586677, 8580763, false, 'wheelsofFury', 1, 0);
INSERT INTO public.match_players VALUES (18022, 1633137941586677, 7141412, false, 'AlkatrauXX', 2, 0);
INSERT INTO public.match_players VALUES (18023, 1633138067523454, 7907969, false, 'Rot_Fish_Bandit', 1, 0);
INSERT INTO public.match_players VALUES (18024, 1633138067523454, 4755269, false, 'simonbbqc', 2, 51861197);
INSERT INTO public.match_players VALUES (18025, 1633138067523454, 11747291, false, 'DrChaos172', 2, 51861197);
INSERT INTO public.match_players VALUES (18026, 1633138067523454, 11655260, false, 'Spixes', 2, 51861197);
INSERT INTO public.match_players VALUES (18027, 1633138067523454, 5446456, false, 'grosta', 1, 51861291);
INSERT INTO public.match_players VALUES (18028, 1633138067523454, 5317272, false, 'Kryrex', 1, 51861291);
INSERT INTO public.match_players VALUES (18029, 1633138067523454, 3618752, false, 'Gantz99', 1, 0);
INSERT INTO public.match_players VALUES (18030, 1633138067523454, 4626238, false, 'xXBootyfulBoyXx', 2, 0);
INSERT INTO public.match_players VALUES (18031, 1633138067523454, -2494, true, 'Grace', 2, 0);
INSERT INTO public.match_players VALUES (18032, 1633138067523454, -21850, true, 'Nicholas', 1, 0);
INSERT INTO public.match_players VALUES (18033, 1633138067523454, -11456, true, 'Kristen', 2, 0);
INSERT INTO public.match_players VALUES (18034, 1633138067523454, -1122, true, 'Andy', 1, 0);
INSERT INTO public.match_players VALUES (18035, 1633138067523454, -2432, true, 'Helen', 2, 0);
INSERT INTO public.match_players VALUES (18036, 1633138067523454, -2740, true, 'Sarah', 1, 0);
INSERT INTO public.match_players VALUES (18037, 1633138067523454, 11690707, false, 'HurI', 1, 0);
INSERT INTO public.match_players VALUES (18038, 1633138067523454, 7141412, false, 'AlkatrauXX', 2, 0);
INSERT INTO public.match_players VALUES (18039, 1633138291617985, 7907969, false, 'Rot_Fish_Bandit', 2, 0);
INSERT INTO public.match_players VALUES (18040, 1633138291617985, -21906, true, 'Matthias', 1, 0);
INSERT INTO public.match_players VALUES (18041, 1633138291617985, -2528, true, 'Ethan', 2, 0);
INSERT INTO public.match_players VALUES (18042, 1633138291617985, -1166, true, 'Emma', 1, 0);
INSERT INTO public.match_players VALUES (18043, 1633138291617985, -21378, true, 'Isabella', 2, 0);
INSERT INTO public.match_players VALUES (18044, 1633138291617985, -5104, true, 'Connor', 1, 0);
INSERT INTO public.match_players VALUES (18045, 1633138291617985, -8820, true, 'Abigail', 2, 0);
INSERT INTO public.match_players VALUES (18046, 1633138291617985, 8580763, false, 'wheelsofFury', 1, 0);
INSERT INTO public.match_players VALUES (18047, 1633138291617985, 3035660, false, 'Taterkaze', 2, 0);
INSERT INTO public.match_players VALUES (18048, 1633138291617985, 10169169, false, 'MrFulltime', 1, 0);
INSERT INTO public.match_players VALUES (18049, 1633138291617985, 4938602, false, 'Illuminati_Killr', 2, 0);
INSERT INTO public.match_players VALUES (18050, 1633138291617985, 6331418, false, 'jairulezz21', 2, 0);
INSERT INTO public.match_players VALUES (18051, 1633138291617985, 11239816, false, 'DUBP', 1, 0);
INSERT INTO public.match_players VALUES (18052, 1633138291617985, 4581019, false, 'MaquiavelicoS', 1, 0);
INSERT INTO public.match_players VALUES (18053, 1633138291617985, 6805011, false, 'NOWTHEONe', 2, 0);
INSERT INTO public.match_players VALUES (18054, 1633138291617985, 11690707, false, 'HurI', 1, 0);
INSERT INTO public.match_players VALUES (18055, 1633138498569990, 7907969, false, 'Rot_Fish_Bandit', 1, 0);
INSERT INTO public.match_players VALUES (18056, 1633138498569990, 7204217, false, 'KINGKONG9387', 1, 0);
INSERT INTO public.match_players VALUES (18057, 1633138498569990, 4010778, false, 'Donovan17222', 2, 0);
INSERT INTO public.match_players VALUES (18058, 1633138498569990, 4626238, false, 'xXBootyfulBoyXx', 1, 0);
INSERT INTO public.match_players VALUES (18059, 1633138498569990, 6805011, false, 'NOWTHEONe', 2, 0);
INSERT INTO public.match_players VALUES (18060, 1633138498569990, 8580763, false, 'wheelsofFury', 2, 0);
INSERT INTO public.match_players VALUES (18061, 1633138498569990, 7070402, false, 'kingdoom9000', 1, 0);
INSERT INTO public.match_players VALUES (18062, 1633138498569990, 10169169, false, 'MrFulltime', 1, 0);
INSERT INTO public.match_players VALUES (18063, 1633138498569990, 6088184, false, 'GIMSMACK', 2, 0);
INSERT INTO public.match_players VALUES (18064, 1633138498569990, 3729808, false, 'wherron', 2, 0);
INSERT INTO public.match_players VALUES (18065, 1633138498569990, -2652, true, 'Joern', 2, 0);
INSERT INTO public.match_players VALUES (18066, 1633138498569990, -10632, true, 'Kenneth', 1, 0);
INSERT INTO public.match_players VALUES (18067, 1633138498569990, 11239816, false, 'DUBP', 2, 0);
INSERT INTO public.match_players VALUES (18068, 1633138498569990, 11379046, false, 'ibartok', 1, 0);
INSERT INTO public.match_players VALUES (18069, 1633138498569990, 5469906, false, 'Tekylita', 2, 0);
INSERT INTO public.match_players VALUES (18070, 1633138498569990, 10965694, false, 'sergioye', 1, 0);
INSERT INTO public.match_players VALUES (18071, 1633138682560809, 7907969, false, 'Rot_Fish_Bandit', 2, 0);
INSERT INTO public.match_players VALUES (18072, 1633138682560809, 7204217, false, 'KINGKONG9387', 1, 0);
INSERT INTO public.match_players VALUES (18073, 1633138682560809, 4068945, false, 'saudamizer', 2, 0);
INSERT INTO public.match_players VALUES (18074, 1633138682560809, -6042, true, 'Yannis', 1, 0);
INSERT INTO public.match_players VALUES (18075, 1633138682560809, -2652, true, 'Joern', 2, 0);
INSERT INTO public.match_players VALUES (18076, 1633138682560809, -1006, true, 'Adam', 2, 0);
INSERT INTO public.match_players VALUES (18077, 1633138682560809, -2494, true, 'Grace', 1, 0);
INSERT INTO public.match_players VALUES (18078, 1633138682560809, -4628, true, 'Daniel', 2, 0);
INSERT INTO public.match_players VALUES (18079, 1633138682560809, -2528, true, 'Ethan', 1, 0);
INSERT INTO public.match_players VALUES (18080, 1633138682560809, 6805011, false, 'NOWTHEONe', 2, 0);
INSERT INTO public.match_players VALUES (18081, 1633138682560809, 4581019, false, 'MaquiavelicoS', 1, 0);
INSERT INTO public.match_players VALUES (18082, 1633138682560809, 11239816, false, 'DUBP', 1, 0);
INSERT INTO public.match_players VALUES (18083, 1633138682560809, 2390230, false, 'Wheelmanz', 1, 0);
INSERT INTO public.match_players VALUES (18084, 1633138682560809, 6088184, false, 'GIMSMACK', 1, 0);
INSERT INTO public.match_players VALUES (18085, 1633138682560809, 8580763, false, 'wheelsofFury', 2, 0);
INSERT INTO public.match_players VALUES (18086, 1633138682560809, 89835, false, 'Diabetos', 2, 0);
INSERT INTO public.match_players VALUES (18087, 1633138915653607, 7907969, false, 'Rot_Fish_Bandit', 2, 0);
INSERT INTO public.match_players VALUES (18088, 1633138915653607, 4320536, false, '_0Damagedone', 1, 0);
INSERT INTO public.match_players VALUES (18089, 1633138915653607, -5544, true, 'Joseph', 2, 0);
INSERT INTO public.match_players VALUES (18090, 1633138915653607, -5702, true, 'Olivia', 1, 0);
INSERT INTO public.match_players VALUES (18091, 1633138915653607, -2518, true, 'Frank', 2, 0);
INSERT INTO public.match_players VALUES (18092, 1633138915653607, -6042, true, 'Yannis', 1, 0);
INSERT INTO public.match_players VALUES (18093, 1633138915653607, -2912, true, 'Robyn', 2, 0);
INSERT INTO public.match_players VALUES (18094, 1633138915653607, -10632, true, 'Kenneth', 1, 0);
INSERT INTO public.match_players VALUES (18095, 1633138915653607, 7933514, false, 'ferchass', 1, 0);
INSERT INTO public.match_players VALUES (18096, 1633138915653607, 4244191, false, 'sandrotbg', 1, 0);
INSERT INTO public.match_players VALUES (18097, 1633138915653607, 7088746, false, 'Rockskillskids', 1, 51861426);
INSERT INTO public.match_players VALUES (18098, 1633138915653607, 1047417, false, 'Sir_Stallsalot', 2, 51861129);
INSERT INTO public.match_players VALUES (18099, 1633138915653607, 11280315, false, 'The_executioner_', 2, 0);
INSERT INTO public.match_players VALUES (18100, 1633138915653607, 5988192, false, 'FlyingSpaceD2328', 1, 51861426);
INSERT INTO public.match_players VALUES (18101, 1633138915653607, 4626238, false, 'xXBootyfulBoyXx', 2, 0);
INSERT INTO public.match_players VALUES (18102, 1633138915653607, 1219523, false, 'NeckBeardNinja', 2, 51861129);
INSERT INTO public.match_players VALUES (18103, 1633139064634885, 7907969, false, 'Rot_Fish_Bandit', 2, 0);
INSERT INTO public.match_players VALUES (18104, 1633139064634885, -2408, true, 'Brian', 2, 0);
INSERT INTO public.match_players VALUES (18105, 1633139064634885, -11456, true, 'Kristen', 1, 0);
INSERT INTO public.match_players VALUES (18106, 1633139064634885, -5758, true, 'Sergei', 2, 0);
INSERT INTO public.match_players VALUES (18107, 1633139064634885, -2912, true, 'Robyn', 1, 0);
INSERT INTO public.match_players VALUES (18108, 1633139064634885, -1098, true, 'Dave', 2, 0);
INSERT INTO public.match_players VALUES (18109, 1633139064634885, -6160, true, 'Steven', 1, 0);
INSERT INTO public.match_players VALUES (18110, 1633139064634885, 5096950, false, 'Kharika', 2, 51861346);
INSERT INTO public.match_players VALUES (18111, 1633139064634885, 5096276, false, 'Astoner', 2, 51861346);
INSERT INTO public.match_players VALUES (18112, 1633139064634885, 3070418, false, 'Terror_Ist', 2, 0);
INSERT INTO public.match_players VALUES (18113, 1633139064634885, 10841458, false, 'MILES4you', 2, 0);
INSERT INTO public.match_players VALUES (18114, 1633139064634885, 11239816, false, 'DUBP', 1, 0);
INSERT INTO public.match_players VALUES (18115, 1633139064634885, 7088746, false, 'Rockskillskids', 1, 51861426);
INSERT INTO public.match_players VALUES (18116, 1633139064634885, 5988192, false, 'FlyingSpaceD2328', 1, 51861426);
INSERT INTO public.match_players VALUES (18117, 1633139064634885, 2390230, false, 'Wheelmanz', 1, 0);
INSERT INTO public.match_players VALUES (18118, 1633139064634885, 11379046, false, 'ibartok', 1, 0);
INSERT INTO public.match_players VALUES (18119, 1633139253672591, 7907969, false, 'Rot_Fish_Bandit', 2, 0);
INSERT INTO public.match_players VALUES (18120, 1633139253672591, 8932558, false, 'MALCOMXNX', 1, 0);
INSERT INTO public.match_players VALUES (18121, 1633139253672591, 5096950, false, 'Kharika', 2, 51861346);
INSERT INTO public.match_players VALUES (18122, 1633139253672591, 5096276, false, 'Astoner', 2, 51861346);
INSERT INTO public.match_players VALUES (18123, 1633139253672591, 5988192, false, 'FlyingSpaceD2328', 1, 51861426);
INSERT INTO public.match_players VALUES (18124, 1633139253672591, 7088746, false, 'Rockskillskids', 1, 51861426);
INSERT INTO public.match_players VALUES (18125, 1633139253672591, 10169169, false, 'MrFulltime', 2, 0);
INSERT INTO public.match_players VALUES (18126, 1633139253672591, 6093781, false, 'XVideosdacom', 2, 0);
INSERT INTO public.match_players VALUES (18127, 1633139253672591, 4320536, false, '_0Damagedone', 1, 0);
INSERT INTO public.match_players VALUES (18128, 1633139253672591, -5030, true, 'George', 2, 0);
INSERT INTO public.match_players VALUES (18129, 1633139253672591, -1448, true, 'Ryan', 1, 0);
INSERT INTO public.match_players VALUES (18130, 1633139253672591, -1322, true, 'Juli', 2, 0);
INSERT INTO public.match_players VALUES (18131, 1633139253672591, -11726, true, 'Orlando', 1, 0);
INSERT INTO public.match_players VALUES (18132, 1633139253672591, -9686, true, 'Claudia', 2, 0);
INSERT INTO public.match_players VALUES (18133, 1633139253672591, -11456, true, 'Kristen', 1, 0);
INSERT INTO public.match_players VALUES (18134, 1633139253672591, 11239816, false, 'DUBP', 1, 0);
INSERT INTO public.match_players VALUES (18135, 1633139532697000, 7907969, false, 'Rot_Fish_Bandit', 1, 0);
INSERT INTO public.match_players VALUES (18136, 1633139532697000, -6054, true, 'Sophia', 1, 0);
INSERT INTO public.match_players VALUES (18137, 1633139532697000, -2528, true, 'Ethan', 2, 0);
INSERT INTO public.match_players VALUES (18138, 1633139532697000, -2912, true, 'Robyn', 1, 0);
INSERT INTO public.match_players VALUES (18139, 1633139532697000, -21906, true, 'Matthias', 2, 0);
INSERT INTO public.match_players VALUES (18140, 1633139532697000, -8820, true, 'Abigail', 1, 0);
INSERT INTO public.match_players VALUES (18141, 1633139532697000, -2304, true, 'Bernd', 2, 0);
INSERT INTO public.match_players VALUES (18142, 1633139532697000, -10114, true, 'Anthony', 1, 0);
INSERT INTO public.match_players VALUES (18143, 1633139532697000, -2550, true, 'Eltom', 2, 0);
INSERT INTO public.match_players VALUES (18144, 1633139532697000, 3223502, false, 'RashaKahn', 1, 51861387);
INSERT INTO public.match_players VALUES (18145, 1633139532697000, 7757846, false, 'mrfuego', 2, 0);
INSERT INTO public.match_players VALUES (18146, 1633139532697000, 4581019, false, 'MaquiavelicoS', 1, 0);
INSERT INTO public.match_players VALUES (18147, 1633139532697000, 89835, false, 'Diabetos', 2, 0);
INSERT INTO public.match_players VALUES (18148, 1633139532697000, 5776682, false, 'kremzeek8133', 1, 51861387);
INSERT INTO public.match_players VALUES (18149, 1633139532697000, 7088746, false, 'Rockskillskids', 2, 51861426);
INSERT INTO public.match_players VALUES (18150, 1633139532697000, 5988192, false, 'FlyingSpaceD2328', 2, 51861426);
INSERT INTO public.match_players VALUES (18151, 1633139692681264, 7907969, false, 'Rot_Fish_Bandit', 1, 0);
INSERT INTO public.match_players VALUES (18152, 1633139692681264, 3223502, false, 'RashaKahn', 1, 51861387);
INSERT INTO public.match_players VALUES (18153, 1633139692681264, 5776682, false, 'kremzeek8133', 1, 51861387);
INSERT INTO public.match_players VALUES (18154, 1633139692681264, 5988192, false, 'FlyingSpaceD2328', 2, 51861426);
INSERT INTO public.match_players VALUES (18155, 1633139692681264, 7088746, false, 'Rockskillskids', 2, 51861426);
INSERT INTO public.match_players VALUES (18156, 1633139692681264, 9307608, false, 'Skinnyspliff', 1, 0);
INSERT INTO public.match_players VALUES (18157, 1633139692681264, 11690707, false, 'HurI', 2, 0);
INSERT INTO public.match_players VALUES (18158, 1633139692681264, 7757846, false, 'mrfuego', 1, 0);
INSERT INTO public.match_players VALUES (18159, 1633139692681264, 4581019, false, 'MaquiavelicoS', 2, 0);
INSERT INTO public.match_players VALUES (18160, 1633139692681264, -4966, true, 'Ashley', 1, 0);
INSERT INTO public.match_players VALUES (18161, 1633139692681264, -12294, true, 'William', 2, 0);
INSERT INTO public.match_players VALUES (18162, 1633139692681264, -5078, true, 'Alyssa', 1, 0);
INSERT INTO public.match_players VALUES (18163, 1633139692681264, -10336, true, 'Madison', 2, 0);
INSERT INTO public.match_players VALUES (18164, 1633139692681264, 2278623, false, 'xFENRISx', 1, 0);
INSERT INTO public.match_players VALUES (18165, 1633139692681264, 10919066, false, 'bigtimetroopah', 2, 0);
INSERT INTO public.match_players VALUES (18166, 1633139692681264, 10935416, false, 'Brutustheboss', 2, 0);
INSERT INTO public.match_players VALUES (18167, 1633139836750622, 7907969, false, 'Rot_Fish_Bandit', 1, 0);
INSERT INTO public.match_players VALUES (18168, 1633139836750622, 5096950, false, 'Kharika', 1, 51861346);
INSERT INTO public.match_players VALUES (18169, 1633139836750622, 5096276, false, 'Astoner', 1, 51861346);
INSERT INTO public.match_players VALUES (18170, 1633139836750622, 5988192, false, 'FlyingSpaceD2328', 2, 51861426);
INSERT INTO public.match_players VALUES (18171, 1633139836750622, 7088746, false, 'Rockskillskids', 2, 51861426);
INSERT INTO public.match_players VALUES (18172, 1633139836750622, 8490318, false, 'BiwingBabe13', 1, 0);
INSERT INTO public.match_players VALUES (18173, 1633139836750622, 5624250, false, 'iamsolomonscott', 2, 0);
INSERT INTO public.match_players VALUES (18174, 1633139836750622, 4581019, false, 'MaquiavelicoS', 2, 0);
INSERT INTO public.match_players VALUES (18175, 1633139836750622, 10935416, false, 'Brutustheboss', 1, 0);
INSERT INTO public.match_players VALUES (18176, 1633139836750622, -2494, true, 'Grace', 2, 0);
INSERT INTO public.match_players VALUES (18177, 1633139836750622, -1098, true, 'Dave', 1, 0);
INSERT INTO public.match_players VALUES (18178, 1633139836750622, -2550, true, 'Eltom', 2, 0);
INSERT INTO public.match_players VALUES (18179, 1633139836750622, -10612, true, 'Michael', 1, 0);
INSERT INTO public.match_players VALUES (18180, 1633139836750622, -5104, true, 'Connor', 2, 0);
INSERT INTO public.match_players VALUES (18181, 1633139836750622, -2912, true, 'Robyn', 1, 0);
INSERT INTO public.match_players VALUES (18182, 1633139836750622, 11551481, false, 'NOTURNORJ199', 2, 0);
INSERT INTO public.match_players VALUES (18183, 1633140010812306, 7907969, false, 'Rot_Fish_Bandit', 2, 0);
INSERT INTO public.match_players VALUES (18184, 1633140010812306, 3223502, false, 'RashaKahn', 1, 51861387);
INSERT INTO public.match_players VALUES (18185, 1633140010812306, 5776682, false, 'kremzeek8133', 1, 51861387);
INSERT INTO public.match_players VALUES (18186, 1633140010812306, 5988192, false, 'FlyingSpaceD2328', 2, 51861426);
INSERT INTO public.match_players VALUES (18187, 1633140010812306, 7088746, false, 'Rockskillskids', 2, 51861426);
INSERT INTO public.match_players VALUES (18188, 1633140010812306, 4626238, false, 'xXBootyfulBoyXx', 1, 0);
INSERT INTO public.match_players VALUES (18189, 1633140010812306, 10169169, false, 'MrFulltime', 2, 0);
INSERT INTO public.match_players VALUES (18190, 1633140010812306, 10965694, false, 'sergioye', 2, 0);
INSERT INTO public.match_players VALUES (18191, 1633140010812306, 4581019, false, 'MaquiavelicoS', 2, 0);
INSERT INTO public.match_players VALUES (18192, 1633140010812306, 11647091, false, 'Deadrites', 1, 0);
INSERT INTO public.match_players VALUES (18193, 1633140010812306, -5578, true, 'Sandra', 2, 0);
INSERT INTO public.match_players VALUES (18194, 1633140010812306, -4628, true, 'Daniel', 1, 0);
INSERT INTO public.match_players VALUES (18195, 1633140010812306, 8490318, false, 'BiwingBabe13', 1, 0);
INSERT INTO public.match_players VALUES (18196, 1633140010812306, 6352337, false, 'kx900', 1, 0);
INSERT INTO public.match_players VALUES (18197, 1633140010812306, 5624250, false, 'iamsolomonscott', 2, 0);
INSERT INTO public.match_players VALUES (18198, 1633140010812306, 1969335, false, 'Moplebebleh', 1, 0);
INSERT INTO public.match_players VALUES (18199, 1633140170793983, 9957215, false, 'ljdem84', 2, 0);
INSERT INTO public.match_players VALUES (18200, 1633140170793983, 1969335, false, 'Moplebebleh', 2, 0);
INSERT INTO public.match_players VALUES (18201, 1633140170793983, -5702, true, 'Olivia', 2, 0);
INSERT INTO public.match_players VALUES (18202, 1633140170793983, -1066, true, 'Alec', 1, 0);
INSERT INTO public.match_players VALUES (18203, 1633140170793983, -5816, true, 'Robert', 2, 0);
INSERT INTO public.match_players VALUES (18204, 1633140170793983, -5720, true, 'Oliver', 1, 0);
INSERT INTO public.match_players VALUES (18205, 1633140170793983, -2432, true, 'Helen', 2, 0);
INSERT INTO public.match_players VALUES (18206, 1633140170793983, -10114, true, 'Anthony', 1, 0);
INSERT INTO public.match_players VALUES (18207, 1633140170793983, -2550, true, 'Eltom', 2, 0);
INSERT INTO public.match_players VALUES (18208, 1633140170793983, -2316, true, 'David', 1, 0);
INSERT INTO public.match_players VALUES (18209, 1633140170793983, 7907969, false, 'Rot_Fish_Bandit', 1, 0);
INSERT INTO public.match_players VALUES (18210, 1633140170793983, 5988192, false, 'FlyingSpaceD2328', 2, 51861426);
INSERT INTO public.match_players VALUES (18211, 1633140170793983, 7088746, false, 'Rockskillskids', 2, 51861426);
INSERT INTO public.match_players VALUES (18212, 1633140170793983, 3223502, false, 'RashaKahn', 1, 51861387);
INSERT INTO public.match_players VALUES (18213, 1633140170793983, 5341963, false, 'TataPinochett', 1, 0);
INSERT INTO public.match_players VALUES (18214, 1633140170793983, 5776682, false, 'kremzeek8133', 1, 51861387);
INSERT INTO public.match_players VALUES (18215, 1633787688959384, 7907969, false, 'Rot_Fish_Bandit', 2, 0);
INSERT INTO public.match_players VALUES (18216, 1633787688959384, 9135214, false, 'Profesor91', 1, 0);
INSERT INTO public.match_players VALUES (18217, 1633787688959384, 3146412, false, 'Sturmi1983', 2, 0);
INSERT INTO public.match_players VALUES (18218, 1633787688959384, 9788586, false, 'nordmann_2017', 1, 0);
INSERT INTO public.match_players VALUES (18219, 1633787688959384, 2509007, false, 'KatTn', 2, 0);
INSERT INTO public.match_players VALUES (18220, 1633787688959384, -5816, true, 'Robert', 2, 0);
INSERT INTO public.match_players VALUES (18221, 1633787688959384, -2494, true, 'Grace', 1, 0);
INSERT INTO public.match_players VALUES (18222, 1633787688959384, -161400, true, 'Christopher', 2, 0);
INSERT INTO public.match_players VALUES (18223, 1633787688959384, -6160, true, 'Steven', 1, 0);
INSERT INTO public.match_players VALUES (18224, 1633787688959384, -2304, true, 'Bernd', 2, 0);
INSERT INTO public.match_players VALUES (18225, 1633787688959384, -2550, true, 'Eltom', 1, 0);
INSERT INTO public.match_players VALUES (18226, 1633787688959384, 10775619, false, 'SiRt', 2, 0);
INSERT INTO public.match_players VALUES (18227, 1633787688959384, 1846782, false, 'zorro0019', 1, 0);
INSERT INTO public.match_players VALUES (18228, 1633787688959384, 7153241, false, 'christian_p92272', 1, 0);
INSERT INTO public.match_players VALUES (18229, 1633787688959384, 2183002, false, 'THORRRR', 2, 0);
INSERT INTO public.match_players VALUES (18230, 1633787688959384, 2320918, false, '_Dessant_38_Rus_', 1, 0);
INSERT INTO public.match_players VALUES (18231, 1633787999142331, 7907969, false, 'Rot_Fish_Bandit', 2, 0);
INSERT INTO public.match_players VALUES (18232, 1633787999142331, 2002698, false, 'Mulderer', 2, 0);
INSERT INTO public.match_players VALUES (18233, 1633787999142331, 5205869, false, 'TIpEBo3MogATeL', 1, 0);
INSERT INTO public.match_players VALUES (18234, 1633787999142331, 2263015, false, 'NUXT', 2, 0);
INSERT INTO public.match_players VALUES (18235, 1633787999142331, 1061794, false, 'HaboX', 1, 0);
INSERT INTO public.match_players VALUES (18236, 1633787999142331, 8354393, false, 'Mr_DARK45513', 2, 0);
INSERT INTO public.match_players VALUES (18237, 1633787999142331, 11727599, false, 'Hellstrike67095', 1, 0);
INSERT INTO public.match_players VALUES (18238, 1633787999142331, 11772027, false, 'sLyOUDALOVE', 1, 0);
INSERT INTO public.match_players VALUES (18239, 1633787999142331, 6509740, false, 'ELO_ELO_ELO_ELO', 2, 0);
INSERT INTO public.match_players VALUES (18240, 1633787999142331, 7496872, false, 'Nodlan', 2, 0);
INSERT INTO public.match_players VALUES (18241, 1633787999142331, 5202131, false, 'Reaper375', 1, 0);
INSERT INTO public.match_players VALUES (18242, 1633787999142331, -2518, true, 'Frank', 2, 0);
INSERT INTO public.match_players VALUES (18243, 1633787999142331, -1166, true, 'Emma', 1, 0);
INSERT INTO public.match_players VALUES (18244, 1633787999142331, 8107813, false, 'IMSET', 2, 0);
INSERT INTO public.match_players VALUES (18245, 1633787999142331, 1431689, false, 'The_Tort1k', 1, 0);
INSERT INTO public.match_players VALUES (18246, 1633787999142331, 10742258, false, 'Matias826', 1, 0);
INSERT INTO public.match_players VALUES (18247, 1633788175192852, 7907969, false, 'Rot_Fish_Bandit', 1, 0);
INSERT INTO public.match_players VALUES (18248, 1633788175192852, 1402389, false, 'AlexHendrix', 1, 0);
INSERT INTO public.match_players VALUES (18249, 1633788175192852, 8354393, false, 'Mr_DARK45513', 2, 0);
INSERT INTO public.match_players VALUES (18250, 1633788175192852, -2316, true, 'David', 2, 0);
INSERT INTO public.match_players VALUES (18251, 1633788175192852, -9686, true, 'Claudia', 1, 0);
INSERT INTO public.match_players VALUES (18252, 1633788175192852, 5311414, false, 'CrayCrayWrecker', 2, 0);
INSERT INTO public.match_players VALUES (18253, 1633788175192852, 9790757, false, 'BSW_rock', 2, 0);
INSERT INTO public.match_players VALUES (18254, 1633788175192852, 11285387, false, 'Blogg68129', 2, 0);
INSERT INTO public.match_players VALUES (18255, 1633788175192852, 10345758, false, 'prokra507', 1, 0);
INSERT INTO public.match_players VALUES (18256, 1633788175192852, 7864086, false, 'Parasitschema47', 2, 0);
INSERT INTO public.match_players VALUES (18257, 1633788175192852, 10636656, false, 'munca', 1, 0);
INSERT INTO public.match_players VALUES (18258, 1633788175192852, 1632686, false, 'BullieSE', 1, 0);
INSERT INTO public.match_players VALUES (18259, 1633788175192852, 9337475, false, 'Gully0815', 2, 0);
INSERT INTO public.match_players VALUES (18260, 1633788175192852, 8449649, false, 'indy_der_erste', 1, 0);
INSERT INTO public.match_players VALUES (18261, 1633788175192852, 1139996, false, '_Peap_', 1, 0);
INSERT INTO public.match_players VALUES (18262, 1633788175192852, 10641437, false, 'Drakenhorf', 2, 0);
INSERT INTO public.match_players VALUES (18263, 1633788333116003, 7907969, false, 'Rot_Fish_Bandit', 1, 0);
INSERT INTO public.match_players VALUES (18264, 1633788333116003, 11583863, false, 'Wakaouli', 2, 51964030);
INSERT INTO public.match_players VALUES (18265, 1633788333116003, 11583864, false, 'D_a_w_e_e_d', 2, 51964030);
INSERT INTO public.match_players VALUES (18266, 1633788333116003, 11772027, false, 'sLyOUDALOVE', 2, 0);
INSERT INTO public.match_players VALUES (18267, 1633788333116003, 8259700, false, 'ironbeard68635', 2, 0);
INSERT INTO public.match_players VALUES (18268, 1633788333116003, -2432, true, 'Helen', 1, 0);
INSERT INTO public.match_players VALUES (18269, 1633788333116003, -2376, true, 'Jacob', 2, 0);
INSERT INTO public.match_players VALUES (18270, 1633788333116003, -6054, true, 'Sophia', 1, 0);
INSERT INTO public.match_players VALUES (18271, 1633788333116003, -1122, true, 'Andy', 2, 0);
INSERT INTO public.match_players VALUES (18272, 1633788333116003, -21378, true, 'Isabella', 1, 0);
INSERT INTO public.match_players VALUES (18273, 1633788333116003, -5078, true, 'Alyssa', 2, 0);
INSERT INTO public.match_players VALUES (18274, 1633788333116003, 7535475, false, 'SOVA1991', 2, 0);
INSERT INTO public.match_players VALUES (18275, 1633788333116003, 8749953, false, '_N3XT_', 1, 0);
INSERT INTO public.match_players VALUES (18276, 1633788333116003, 3226531, false, 'Ejidem', 1, 51963908);
INSERT INTO public.match_players VALUES (18277, 1633788333116003, 141454, false, 'JAGHal0', 1, 0);
INSERT INTO public.match_players VALUES (18278, 1633788333116003, 2004918, false, 's0hard', 1, 51963908);
INSERT INTO public.match_players VALUES (18279, 1633788515114901, 11284391, false, 'Axelito21811', 1, 51964156);
INSERT INTO public.match_players VALUES (18280, 1633788515114901, 10654950, false, 'El_Fuebro', 1, 51964156);
INSERT INTO public.match_players VALUES (18281, 1633788515114901, 6469607, false, '_ParasiT_0', 2, 51964224);
INSERT INTO public.match_players VALUES (18282, 1633788515114901, 4480152, false, 'Hemoglobinum', 1, 0);
INSERT INTO public.match_players VALUES (18283, 1633788515114901, -5720, true, 'Oliver', 2, 0);
INSERT INTO public.match_players VALUES (18284, 1633788515114901, -1300, true, 'Paul', 1, 0);
INSERT INTO public.match_players VALUES (18285, 1633788515114901, -2912, true, 'Robyn', 2, 0);
INSERT INTO public.match_players VALUES (18286, 1633788515114901, -10282, true, 'Dominic', 1, 0);
INSERT INTO public.match_players VALUES (18287, 1633788515114901, -8820, true, 'Abigail', 2, 0);
INSERT INTO public.match_players VALUES (18288, 1633788515114901, -22562, true, 'Samantha', 1, 0);
INSERT INTO public.match_players VALUES (18289, 1633788515114901, 11782617, false, 'FuRy_V', 2, 0);
INSERT INTO public.match_players VALUES (18290, 1633788515114901, 1683933, false, 'DJ4war_pt', 1, 0);
INSERT INTO public.match_players VALUES (18291, 1633788515114901, 7907969, false, 'Rot_Fish_Bandit', 1, 0);
INSERT INTO public.match_players VALUES (18292, 1633788515114901, 2509007, false, 'KatTn', 2, 0);
INSERT INTO public.match_players VALUES (18293, 1633788515114901, 6773695, false, 'Dynamit1987', 2, 51964224);
INSERT INTO public.match_players VALUES (18294, 1633788515114901, 8107813, false, 'IMSET', 2, 0);
INSERT INTO public.match_players VALUES (18295, 1633788757297626, 3794642, false, 'Dante73hun', 2, 0);
INSERT INTO public.match_players VALUES (18296, 1633788757297626, 1402389, false, 'AlexHendrix', 2, 0);
INSERT INTO public.match_players VALUES (18297, 1633788757297626, 10859473, false, 'Do1youmong', 2, 0);
INSERT INTO public.match_players VALUES (18298, 1633788757297626, 1372359, false, 'Surmaja', 1, 0);
INSERT INTO public.match_players VALUES (18299, 1633788757297626, 3282222, false, 'professorb96', 1, 0);
INSERT INTO public.match_players VALUES (18300, 1633788757297626, 8354393, false, 'Mr_DARK45513', 2, 0);
INSERT INTO public.match_players VALUES (18301, 1633788757297626, -6160, true, 'Steven', 2, 0);
INSERT INTO public.match_players VALUES (18302, 1633788757297626, -5758, true, 'Sergei', 1, 0);
INSERT INTO public.match_players VALUES (18303, 1633788757297626, -2912, true, 'Robyn', 2, 0);
INSERT INTO public.match_players VALUES (18304, 1633788757297626, -5574, true, 'Joshua', 1, 0);
INSERT INTO public.match_players VALUES (18305, 1633788757297626, -2652, true, 'Joern', 2, 0);
INSERT INTO public.match_players VALUES (18306, 1633788757297626, -10114, true, 'Anthony', 1, 0);
INSERT INTO public.match_players VALUES (18307, 1633788757297626, 5990764, false, 'LRSDX', 2, 0);
INSERT INTO public.match_players VALUES (18308, 1633788757297626, 7907969, false, 'Rot_Fish_Bandit', 1, 0);
INSERT INTO public.match_players VALUES (18309, 1633788757297626, 1846782, false, 'zorro0019', 1, 0);
INSERT INTO public.match_players VALUES (18310, 1633788757297626, 9768553, false, 'whipht94', 1, 0);
INSERT INTO public.match_players VALUES (18311, 1633789011158670, 7907969, false, 'Rot_Fish_Bandit', 1, 0);
INSERT INTO public.match_players VALUES (18312, 1633789011158670, 2320918, false, '_Dessant_38_Rus_', 2, 0);
INSERT INTO public.match_players VALUES (18313, 1633789011158670, 146546, false, 'Roxy_Wolf_Dragon', 2, 51964243);
INSERT INTO public.match_players VALUES (18314, 1633789011158670, 64000, false, 'yordivink', 2, 51964243);
INSERT INTO public.match_players VALUES (18315, 1633789011158670, 6469607, false, '_ParasiT_0', 1, 51964224);
INSERT INTO public.match_players VALUES (18316, 1633789011158670, 6773695, false, 'Dynamit1987', 1, 51964224);
INSERT INTO public.match_players VALUES (18317, 1633789011158670, 5990764, false, 'LRSDX', 1, 0);
INSERT INTO public.match_players VALUES (18318, 1633789011158670, 3794642, false, 'Dante73hun', 1, 0);
INSERT INTO public.match_players VALUES (18319, 1633789011158670, 1402389, false, 'AlexHendrix', 2, 0);
INSERT INTO public.match_players VALUES (18320, 1633789011158670, 3282222, false, 'professorb96', 1, 0);
INSERT INTO public.match_players VALUES (18321, 1633789011158670, 9463369, false, 'SkairipA', 2, 0);
INSERT INTO public.match_players VALUES (18322, 1633789011158670, 3256395, false, 'PrcoliJebach', 1, 0);
INSERT INTO public.match_players VALUES (18323, 1633789011158670, 7535475, false, 'SOVA1991', 2, 0);
INSERT INTO public.match_players VALUES (18324, 1633789011158670, 9889917, false, 'Rapiddonkey', 1, 0);
INSERT INTO public.match_players VALUES (18325, 1633789011158670, -10914, true, 'Matthew', 2, 0);
INSERT INTO public.match_players VALUES (18326, 1633789011158670, 7585833, false, 'Miclan', 2, 0);
INSERT INTO public.match_players VALUES (18327, 1633789169380717, 7907969, false, 'Rot_Fish_Bandit', 1, 0);
INSERT INTO public.match_players VALUES (18328, 1633789169380717, 3794642, false, 'Dante73hun', 2, 0);
INSERT INTO public.match_players VALUES (18329, 1633789169380717, 4337334, false, 'Corviid', 1, 0);
INSERT INTO public.match_players VALUES (18330, 1633789169380717, 3256395, false, 'PrcoliJebach', 2, 0);
INSERT INTO public.match_players VALUES (18331, 1633789169380717, 7585833, false, 'Miclan', 1, 0);
INSERT INTO public.match_players VALUES (18332, 1633789169380717, 5990764, false, 'LRSDX', 2, 0);
INSERT INTO public.match_players VALUES (18333, 1633789169380717, -10114, true, 'Anthony', 2, 0);
INSERT INTO public.match_players VALUES (18334, 1633789169380717, -1066, true, 'Alec', 1, 0);
INSERT INTO public.match_players VALUES (18335, 1633789169380717, -2528, true, 'Ethan', 2, 0);
INSERT INTO public.match_players VALUES (18336, 1633789169380717, -22562, true, 'Samantha', 1, 0);
INSERT INTO public.match_players VALUES (18337, 1633789169380717, 9337475, false, 'Gully0815', 2, 0);
INSERT INTO public.match_players VALUES (18338, 1633789169380717, 5564021, false, 'NeoStormer', 1, 0);
INSERT INTO public.match_players VALUES (18339, 1633789169380717, 7794546, false, 'Isenhardt80', 2, 0);
INSERT INTO public.match_players VALUES (18340, 1633789169380717, 11782617, false, 'FuRy_V', 1, 0);
INSERT INTO public.match_players VALUES (18341, 1633789169380717, 4431501, false, 'Losing_Streak', 2, 0);
INSERT INTO public.match_players VALUES (18342, 1633789169380717, 1969335, false, 'Moplebebleh', 1, 0);
INSERT INTO public.match_players VALUES (18343, 1633789396210041, 7907969, false, 'Rot_Fish_Bandit', 1, 0);
INSERT INTO public.match_players VALUES (18344, 1633789396210041, 8261933, false, 'Cysp', 1, 0);
INSERT INTO public.match_players VALUES (18345, 1633789396210041, 1280230, false, 'Krumptzz', 2, 0);
INSERT INTO public.match_players VALUES (18346, 1633789396210041, 4243744, false, 'Kohtupora_69', 2, 0);
INSERT INTO public.match_players VALUES (18347, 1633789396210041, 1999495, false, 'ManWhoSaysNii', 2, 0);
INSERT INTO public.match_players VALUES (18348, 1633789396210041, 9828798, false, 'orelik_orel', 1, 0);
INSERT INTO public.match_players VALUES (18349, 1633789396210041, 4480152, false, 'Hemoglobinum', 2, 0);
INSERT INTO public.match_players VALUES (18350, 1633789396210041, 4746471, false, 'J_A_R_I', 2, 0);
INSERT INTO public.match_players VALUES (18351, 1633789396210041, 4431501, false, 'Losing_Streak', 2, 0);
INSERT INTO public.match_players VALUES (18352, 1633789396210041, 9436612, false, 'Oracleeee', 1, 0);
INSERT INTO public.match_players VALUES (18353, 1633789396210041, 1997969, false, 'Madkoker', 1, 0);
INSERT INTO public.match_players VALUES (18354, 1633789396210041, 8132066, false, 'steelRoman', 2, 0);
INSERT INTO public.match_players VALUES (18355, 1633789396210041, 115075, false, 'Andacover', 2, 0);
INSERT INTO public.match_players VALUES (18356, 1633789396210041, 11534627, false, 'Viciaia', 1, 0);
INSERT INTO public.match_players VALUES (18357, 1633789396210041, 1016342, false, 'stonetoes', 1, 0);
INSERT INTO public.match_players VALUES (18358, 1633789396210041, 4803994, false, 'Avenged1', 1, 0);
INSERT INTO public.match_players VALUES (18359, 1633789646428213, 7907969, false, 'Rot_Fish_Bandit', 1, 0);
INSERT INTO public.match_players VALUES (18360, 1633789646428213, 4946618, false, 'ShriC', 2, 0);
INSERT INTO public.match_players VALUES (18361, 1633789646428213, 4498163, false, 'WrathOfAnubis', 1, 0);
INSERT INTO public.match_players VALUES (18362, 1633789646428213, 6636368, false, 'Jeriah15377', 1, 0);
INSERT INTO public.match_players VALUES (18363, 1633789646428213, 8951030, false, 'Aabel', 2, 0);
INSERT INTO public.match_players VALUES (18364, 1633789646428213, 4647621, false, 'GreenIsland', 1, 0);
INSERT INTO public.match_players VALUES (18365, 1633789646428213, 4681143, false, 'Deep17', 2, 0);
INSERT INTO public.match_players VALUES (18366, 1633789646428213, 2886185, false, 'BenevolentJohn', 2, 0);
INSERT INTO public.match_players VALUES (18367, 1633789646428213, 10957230, false, 'TheWiseOne4923', 2, 0);
INSERT INTO public.match_players VALUES (18368, 1633789646428213, 1129619, false, 'Blood_Berserker', 2, 0);
INSERT INTO public.match_players VALUES (18369, 1633789646428213, 9379927, false, 'Ivan080686', 1, 0);
INSERT INTO public.match_players VALUES (18370, 1633789646428213, 5891667, false, '_junkyard_', 2, 0);
INSERT INTO public.match_players VALUES (18371, 1633789646428213, 5202131, false, 'Reaper375', 1, 0);
INSERT INTO public.match_players VALUES (18372, 1633789646428213, 10583350, false, 'Felix_the_Jo3', 2, 0);
INSERT INTO public.match_players VALUES (18373, 1633789646428213, 5217161, false, 'Mat58901', 1, 0);
INSERT INTO public.match_players VALUES (18374, 1633789646428213, 3105487, false, 'JuanRa', 1, 0);


--
-- Data for Name: matches; Type: TABLE DATA; Schema: public; Owner: dev
--

INSERT INTO public.matches VALUES (1628718728212966, '8v8', 1, '2021-08-11', '2021-08-11', 'riverport', 1, 1, '0.12.80.177330', '0.1.0.88', 'wheel10lw-us.pxo');
INSERT INTO public.matches VALUES (1628719058239445, '8v8', 1, '2021-08-11', '2021-08-11', 'powerplant', 1, 1, '0.12.80.177330', '0.1.0.88', 'wheel80lw-nl.pxo');
INSERT INTO public.matches VALUES (1633137941586677, '8v8', 1, '2021-10-02', '2021-10-02', 'riverport', 1, 1, '0.13.04.182753', '0.1.0.88', 'wheel07lw-us.pxo');
INSERT INTO public.matches VALUES (1633138067523454, '8v8', 1, '2021-10-02', '2021-10-02', 'holes', 2, 1, '0.13.04.182753', '0.1.0.88', 'wheel10lw-us.pxo');
INSERT INTO public.matches VALUES (1633138291617985, '8v8', 1, '2021-10-02', '2021-10-02', 'sand_valley', 2, 1, '0.13.04.182753', '0.1.0.88', 'wheel10lw-us.pxo');
INSERT INTO public.matches VALUES (1633138498569990, '8v8', 1, '2021-10-02', '2021-10-02', 'holes', 1, 1, '0.13.04.182753', '0.1.0.88', 'wheel10lw-us.pxo');
INSERT INTO public.matches VALUES (1633138682560809, '8v8', 1, '2021-10-02', '2021-10-02', 'sinto', 2, 1, '0.13.04.182753', '0.1.0.88', 'wheel09lw-us.pxo');
INSERT INTO public.matches VALUES (1633138915653607, '8v8', 1, '2021-10-02', '2021-10-02', 'sinto', 2, 1, '0.13.04.182753', '0.1.0.88', 'wheel10lw-us.pxo');
INSERT INTO public.matches VALUES (1633139064634885, '8v8', 1, '2021-10-02', '2021-10-02', 'chemical_plant', 2, 1, '0.13.04.182753', '0.1.0.88', 'wheel09lw-us.pxo');
INSERT INTO public.matches VALUES (1633139253672591, '8v8', 1, '2021-10-02', '2021-10-02', 'rockcity', 1, 1, '0.13.04.182753', '0.1.0.88', 'wheel07lw-us.pxo');
INSERT INTO public.matches VALUES (1633139532697000, '8v8', 1, '2021-10-02', '2021-10-02', 'conflagration', 1, 1, '0.13.04.182753', '0.1.0.88', 'wheel10lw-us.pxo');
INSERT INTO public.matches VALUES (1633139692681264, '8v8', 1, '2021-10-02', '2021-10-02', 'powerplant', 2, 1, '0.13.04.182753', '0.1.0.88', 'wheel10lw-us.pxo');
INSERT INTO public.matches VALUES (1633139836750622, '8v8', 1, '2021-10-02', '2021-10-02', 'building_yard3', 2, 1, '0.13.04.182753', '0.1.0.88', 'wheel10lw-us.pxo');
INSERT INTO public.matches VALUES (1633140010812306, '8v8', 1, '2021-10-02', '2021-10-02', 'tower', 2, 1, '0.13.04.182753', '0.1.0.88', 'wheel05lw-us.pxo');
INSERT INTO public.matches VALUES (1633140170793983, '8v8', 1, '2021-10-02', '2021-10-02', 'building_yard3', 2, 1, '0.13.04.182753', '0.1.0.88', 'wheel10lw-us.pxo');
INSERT INTO public.matches VALUES (1633787688959384, '8v8', 1, '2021-10-09', '2021-10-09', 'tower', 2, 1, '0.13.05.183381', '0.1.0.88', 'wheel60lw-nl.pxo');
INSERT INTO public.matches VALUES (1633787999142331, '8v8', 1, '2021-10-09', '2021-10-09', 'chemical_plant', 2, 1, '0.13.05.183381', '0.1.0.88', 'wheel74lw-nl.pxo');
INSERT INTO public.matches VALUES (1633788175192852, '8v8', 1, '2021-10-09', '2021-10-09', 'island', 1, 1, '0.13.05.183381', '0.1.0.88', 'wheel66lw-nl.pxo');
INSERT INTO public.matches VALUES (1633788333116003, '8v8', 1, '2021-10-09', '2021-10-09', 'chemical_plant', 1, 1, '0.13.05.183381', '0.1.0.88', 'wheel86lw-nl.pxo');
INSERT INTO public.matches VALUES (1633788515114901, '8v8', 1, '2021-10-09', '2021-10-09', 'conflagration', 2, 1, '0.13.05.183381', '0.1.0.88', 'wheel86lw-nl.pxo');
INSERT INTO public.matches VALUES (1633788757297626, '8v8', 1, '2021-10-09', '2021-10-09', 'holes', 2, 1, '0.13.05.183381', '0.1.0.88', 'wheel87lw-nl.pxo');
INSERT INTO public.matches VALUES (1633789011158670, '8v8', 1, '2021-10-09', '2021-10-09', 'geopp', 1, 1, '0.13.05.183381', '0.1.0.88', 'wheel88lw-nl.pxo');
INSERT INTO public.matches VALUES (1633789169380717, '8v8', 1, '2021-10-09', '2021-10-09', 'iron_way_center', 1, 1, '0.13.05.183381', '0.1.0.88', 'wheel87lw-nl.pxo');
INSERT INTO public.matches VALUES (1633789396210041, '8v8', 1, '2021-10-09', '2021-10-09', 'cityruin', 1, 1, '0.13.05.183381', '0.1.0.88', 'wheel88lw-nl.pxo');
INSERT INTO public.matches VALUES (1633789646428213, '8v8', 1, '2021-10-09', '2021-10-09', 'cityruin', 2, 1, '0.13.05.183381', '0.1.0.88', 'wheel74lw-nl.pxo');


--
-- Data for Name: medals; Type: TABLE DATA; Schema: public; Owner: dev
--

INSERT INTO public.medals VALUES (546, 'PvpDestroyDetailsCommon');
INSERT INTO public.medals VALUES (547, 'PvpDestroyDetailsVeryRare');
INSERT INTO public.medals VALUES (548, 'PvpDestroyDetailsLegendary');
INSERT INTO public.medals VALUES (549, 'PvpTurretKill');
INSERT INTO public.medals VALUES (550, 'PvpDestroyDetailsRare');
INSERT INTO public.medals VALUES (551, 'PvpFirstBlood');
INSERT INTO public.medals VALUES (552, 'PvpMachinegunVeryRareKill');
INSERT INTO public.medals VALUES (553, 'PvpDestroyDetailsEpic');
INSERT INTO public.medals VALUES (554, 'PvpAssist');
INSERT INTO public.medals VALUES (555, 'PvpStealthBreak');
INSERT INTO public.medals VALUES (556, 'PvpMeleeEpicKill');
INSERT INTO public.medals VALUES (557, 'PvpDominator');
INSERT INTO public.medals VALUES (558, 'PvpMvpWin');
INSERT INTO public.medals VALUES (559, 'PvpDeathFromAbove');
INSERT INTO public.medals VALUES (560, 'PvpMachinegunLegendaryKill');
INSERT INTO public.medals VALUES (561, 'PvpMachinegunEpicKill');
INSERT INTO public.medals VALUES (562, 'PvpMeleeCommonKill');
INSERT INTO public.medals VALUES (563, 'PvpAutocannonEpicKill');
INSERT INTO public.medals VALUES (564, 'PvpFireLegendaryKill');
INSERT INTO public.medals VALUES (565, 'PvpCompanionRareKill');
INSERT INTO public.medals VALUES (566, 'PvpFlawless');
INSERT INTO public.medals VALUES (567, 'PvpCompanionKill');
INSERT INTO public.medals VALUES (568, 'PvpEnergyEpicKill');
INSERT INTO public.medals VALUES (569, 'PvpFireEpicKill');
INSERT INTO public.medals VALUES (570, 'PvpCannonVeryRareKill');
INSERT INTO public.medals VALUES (571, 'PvpCannonRareKill');
INSERT INTO public.medals VALUES (572, 'PvpAutocannonLegendaryKill');
INSERT INTO public.medals VALUES (573, 'PvpShotgunEpicKill');
INSERT INTO public.medals VALUES (574, 'PvpInvader');
INSERT INTO public.medals VALUES (575, 'PvpQuadrocopterRareKill');
INSERT INTO public.medals VALUES (576, 'PvpRocketEpicKill');
INSERT INTO public.medals VALUES (577, 'PvpMeleeVeryRareKill');
INSERT INTO public.medals VALUES (578, 'PvpQuadrocopterKill');
INSERT INTO public.medals VALUES (579, 'PvpShotgunVeryRareKill');
INSERT INTO public.medals VALUES (580, 'PvpGrenadeLauncherLegendaryKill');
INSERT INTO public.medals VALUES (581, 'PvpTurretVeryRareKill');
INSERT INTO public.medals VALUES (582, 'PvpMeleeRareKill');
INSERT INTO public.medals VALUES (583, 'PvpHalfMvp');
INSERT INTO public.medals VALUES (584, 'PvpTurretRareKill');
INSERT INTO public.medals VALUES (585, 'PvpCompanionOwnerKill');
INSERT INTO public.medals VALUES (586, 'PvpGrenadeLauncherEpicKill');
INSERT INTO public.medals VALUES (587, 'PvpKillJoy');
INSERT INTO public.medals VALUES (588, 'PvpMinelayersLegendaryKill');
INSERT INTO public.medals VALUES (589, 'PvpShotgunLegendaryKill');
INSERT INTO public.medals VALUES (590, 'PvpShotgunRareKill');
INSERT INTO public.medals VALUES (591, 'PvpRocketVeryRareKill');
INSERT INTO public.medals VALUES (592, 'PvpMachinegunCommonKill');
INSERT INTO public.medals VALUES (593, 'PvpDeathblow');
INSERT INTO public.medals VALUES (594, 'PvpCompanionEpicKill');
INSERT INTO public.medals VALUES (595, 'PvpShotgunCommonKill');
INSERT INTO public.medals VALUES (596, 'PvpMeleeLegendaryKill');
INSERT INTO public.medals VALUES (597, 'PvpTurretEpicKill');
INSERT INTO public.medals VALUES (598, 'PvpQuadrocopterVeryRareKill');
INSERT INTO public.medals VALUES (599, 'PvpCrossbowEpicKill');
INSERT INTO public.medals VALUES (600, 'PvpQuadrocopterLegendaryKill');
INSERT INTO public.medals VALUES (601, 'PvpQuadrocopterEpicKill');
INSERT INTO public.medals VALUES (602, 'PvpLifter');
INSERT INTO public.medals VALUES (603, 'PvpQuadrocopterOwnerKill');
INSERT INTO public.medals VALUES (604, 'PvpSpecialRareKill');
INSERT INTO public.medals VALUES (605, 'PvpSpecialEpicKill');
INSERT INTO public.medals VALUES (606, 'PvpSuperiority');
INSERT INTO public.medals VALUES (607, 'PvpMachinegunRareKill');
INSERT INTO public.medals VALUES (608, 'PvpEnergyRareKill');
INSERT INTO public.medals VALUES (609, 'PvpSurvival');
INSERT INTO public.medals VALUES (610, 'PvpMinelayersEpicKill');
INSERT INTO public.medals VALUES (611, 'PvpAutocannonVeryRareKill');
INSERT INTO public.medals VALUES (612, 'PvpTurretOwnerKill');
INSERT INTO public.medals VALUES (613, 'PvpBackstab');
INSERT INTO public.medals VALUES (614, 'PvpRocketLegendaryKill');
INSERT INTO public.medals VALUES (615, 'PvpRailgunExoticKill');
INSERT INTO public.medals VALUES (616, 'PvpEnergyLegendaryKill');
INSERT INTO public.medals VALUES (617, 'PvpCannonEpicKill');
INSERT INTO public.medals VALUES (618, 'PvpRocketRareKill');
INSERT INTO public.medals VALUES (619, 'PvpSpecialLegendaryKill');
INSERT INTO public.medals VALUES (620, 'PvpAutocannonRareKill');
INSERT INTO public.medals VALUES (621, 'PvpMinelayersExoticKill');
INSERT INTO public.medals VALUES (622, 'PvpCannonLegendaryKill');
INSERT INTO public.medals VALUES (623, 'PvpCannonExoticKill');
INSERT INTO public.medals VALUES (624, 'PvpCrossbowLegendaryKill');
INSERT INTO public.medals VALUES (625, 'PvpCannonCommonKill');
INSERT INTO public.medals VALUES (626, 'PvpAegis');
INSERT INTO public.medals VALUES (627, 'PvpShotgunExoticKill');
INSERT INTO public.medals VALUES (628, 'PvpEnergyExoticKill');
INSERT INTO public.medals VALUES (629, 'PvpMachinegunExoticKill');
INSERT INTO public.medals VALUES (630, 'PveDestroyWheel');
INSERT INTO public.medals VALUES (631, 'PveDestroyWeapon');
INSERT INTO public.medals VALUES (632, 'PveNomadEasyKill');
INSERT INTO public.medals VALUES (633, 'PveMultikillFast');
INSERT INTO public.medals VALUES (634, 'PveNomadBossEasyKill');
INSERT INTO public.medals VALUES (635, 'PveWin');
INSERT INTO public.medals VALUES (636, 'PveWinAlive');
INSERT INTO public.medals VALUES (637, 'PveSurvival');
INSERT INTO public.medals VALUES (638, 'PveMvp');
INSERT INTO public.medals VALUES (639, 'PvePsychoEasyKill');
INSERT INTO public.medals VALUES (640, 'PvePsychoBossEasyKill');
INSERT INTO public.medals VALUES (641, 'PveOneShot');


--
-- Data for Name: parts; Type: TABLE DATA; Schema: public; Owner: dev
--

INSERT INTO public.parts VALUES (10420, 'CarPart_Gun_Machinegun_Preepic');
INSERT INTO public.parts VALUES (10421, 'CarPart_Shnekohod');
INSERT INTO public.parts VALUES (10422, 'CarPart_Workers_Sidepart_2x3x6_l');
INSERT INTO public.parts VALUES (10423, 'CarPart_Gun_Machinegun_Frontal_legend');
INSERT INTO public.parts VALUES (10424, 'CarPart_Gun_Machinegun_Frontal_Epic');
INSERT INTO public.parts VALUES (10425, 'CarPart_VanBumper');
INSERT INTO public.parts VALUES (10426, 'CarPart_Gun_Cannon_epic');
INSERT INTO public.parts VALUES (10427, 'CarPart_Wheel_MonsterTruck_S');
INSERT INTO public.parts VALUES (10428, 'CarPart_Avia_lafet');
INSERT INTO public.parts VALUES (10429, 'CarPart_TankTrackBig_epic');
INSERT INTO public.parts VALUES (10430, 'CarPart_Engine_Powerful');
INSERT INTO public.parts VALUES (10431, 'CarPart_BumperTrain2_epic');
INSERT INTO public.parts VALUES (10432, 'CarPart_Gun_BigCannon_EX_rare');
INSERT INTO public.parts VALUES (10433, 'CarPart_MechaLeg');
INSERT INTO public.parts VALUES (10434, 'CarPart_ChassisTruck8');
INSERT INTO public.parts VALUES (10435, 'CarPart_BladeWing_double');
INSERT INTO public.parts VALUES (10436, 'CarPart_Knobstick');
INSERT INTO public.parts VALUES (10437, 'CarPart_TruckSide2');
INSERT INTO public.parts VALUES (10438, 'CarPart_AviaBox4x1x4');
INSERT INTO public.parts VALUES (10439, 'CarPart_TruckSide4');
INSERT INTO public.parts VALUES (10440, 'Chassis_Spider');
INSERT INTO public.parts VALUES (10441, 'CarPart_Gun_Mortar_Revert');
INSERT INTO public.parts VALUES (10442, 'CarPart_WheelDroneDeployer');
INSERT INTO public.parts VALUES (10443, 'CarPart_Headlights2');
INSERT INTO public.parts VALUES (10444, 'CarPart_WheelDouble_RS_epic');
INSERT INTO public.parts VALUES (10445, 'CarPart_WheelDouble_R_epic');
INSERT INTO public.parts VALUES (10446, 'CarPart_ChassisBase4');
INSERT INTO public.parts VALUES (10447, 'Chassis_Maz');
INSERT INTO public.parts VALUES (10448, 'CarPart_Military_slope_thin_1x1x4');
INSERT INTO public.parts VALUES (10449, 'CarPart_Military_box_4x1x8');
INSERT INTO public.parts VALUES (10450, 'CarPart_Military_door_slope_4x1x4');
INSERT INTO public.parts VALUES (10451, 'CarPart_Military_slope_2x1x8');
INSERT INTO public.parts VALUES (10452, 'CarPart_Military_box_1x2x8');
INSERT INTO public.parts VALUES (10453, 'CarPart_Military_box_slope_4x1x8');
INSERT INTO public.parts VALUES (10454, 'CarPart_Military_box_slope_2x1x8');
INSERT INTO public.parts VALUES (10455, 'CarPart_HomingMissileLauncherBurstR_legend');
INSERT INTO public.parts VALUES (10456, 'CarPart_HomingMissileLauncher_epic');
INSERT INTO public.parts VALUES (10457, 'CarPart_TankTrackBig_legend');
INSERT INTO public.parts VALUES (10458, 'CarPart_FenderSolidOutside_rare');
INSERT INTO public.parts VALUES (10459, 'CarPart_Gun_Syfy_ParticleBeam');
INSERT INTO public.parts VALUES (10460, 'CarPart_Gun_Plasma_Cutter');
INSERT INTO public.parts VALUES (10461, 'CarPart_Wheel_MonsterTruck_S_C2_Raider');
INSERT INTO public.parts VALUES (10462, 'CarPart_Wheel_MonsterTruck');
INSERT INTO public.parts VALUES (10463, 'CarPart_Workers_Boxslope_2x1x4');
INSERT INTO public.parts VALUES (10464, 'CarPart_ChassisBase2x6');
INSERT INTO public.parts VALUES (10465, 'CarPart_Nosecut_War');
INSERT INTO public.parts VALUES (10466, 'CarPart_JunkBumper');
INSERT INTO public.parts VALUES (10467, 'CarPart_Grid_1');
INSERT INTO public.parts VALUES (10468, 'CarPart_Gun_Catapult');
INSERT INTO public.parts VALUES (10469, 'CarPart_Gun_BigCannon_EX_Preepic');
INSERT INTO public.parts VALUES (10470, 'CarPart_TankTrackBig_dow');
INSERT INTO public.parts VALUES (10471, 'CarPart_Gun_Machinegun_epic');
INSERT INTO public.parts VALUES (10472, 'CarPart_Gun_Cannon_Legend');
INSERT INTO public.parts VALUES (10473, 'CarPart_WheelMedium_epic_S');
INSERT INTO public.parts VALUES (10474, 'CarPart_Gun_MineLauncher_Legend');
INSERT INTO public.parts VALUES (10475, 'Cabin_Tribal_Hog');
INSERT INTO public.parts VALUES (10476, 'CarPart_Scientists_Spikes1');
INSERT INTO public.parts VALUES (10477, 'CarPart_Gun_Machinegun_Corner');
INSERT INTO public.parts VALUES (10478, 'CarPart_Gun_MineTrap');
INSERT INTO public.parts VALUES (10479, 'CarPart_TurretDeployer_Preepic');
INSERT INTO public.parts VALUES (10480, 'CarPart_Wheel_MonsterTruck_S_C1_Raider');
INSERT INTO public.parts VALUES (10481, 'CarPart_Gun_Shotgun_epic');
INSERT INTO public.parts VALUES (10482, 'CarPart_CyberEast_Spoiler_01');
INSERT INTO public.parts VALUES (10483, 'CarPart_Quadrocopter_rare');
INSERT INTO public.parts VALUES (10484, 'CarPart_Gun_Minigun');
INSERT INTO public.parts VALUES (10485, 'CarPart_Structure_Avia_Bumper_01');
INSERT INTO public.parts VALUES (10486, 'Cabin_Halloween2020_Cab');
INSERT INTO public.parts VALUES (10487, 'CarPart_Gun_SMG_Epic');
INSERT INTO public.parts VALUES (10488, 'CarPart_Buggy_bumper');
INSERT INTO public.parts VALUES (10489, 'CarPart_Wheel_SawWheel_S');
INSERT INTO public.parts VALUES (10490, 'CarPart_Wheel_SawWheel');
INSERT INTO public.parts VALUES (10491, 'CarPart_Military_Bumper1_Left');
INSERT INTO public.parts VALUES (10492, 'CarPart_Gun_BigCannon_Free_Preepic');
INSERT INTO public.parts VALUES (10493, 'CarPart_BladeWing_epic');
INSERT INTO public.parts VALUES (10494, 'CarPart_Gun_Shotgun_Preepic');
INSERT INTO public.parts VALUES (10495, 'CarPart_Structure_boxslope_1x2x6');
INSERT INTO public.parts VALUES (10496, 'CarPart_Slope_Pestilence');
INSERT INTO public.parts VALUES (10497, 'CarPart_Gun_GrenadeLauncher_Shotgun');
INSERT INTO public.parts VALUES (10498, 'CarPart_Gun_Lcannon_epic');
INSERT INTO public.parts VALUES (10499, 'CarPart_Blade_rare');
INSERT INTO public.parts VALUES (10500, 'CarPart_Drill_epic');
INSERT INTO public.parts VALUES (10501, 'CarPart_Structure_CyberEast_Bumper_Front_01');
INSERT INTO public.parts VALUES (10502, 'CarPart_TurretDeployer_rare');
INSERT INTO public.parts VALUES (10503, 'CarPart_Gun_GrenadeLauncher_Burst');
INSERT INTO public.parts VALUES (10504, 'CarPart_Workers_Boxslope_4x2x2');
INSERT INTO public.parts VALUES (10505, 'CarPart_Sideleft_War');
INSERT INTO public.parts VALUES (10506, 'Cabin_CyberEast_Cab3');
INSERT INTO public.parts VALUES (10507, 'CarPart_Sideright_War');
INSERT INTO public.parts VALUES (10508, 'CarPart_ChassisTruck6');
INSERT INTO public.parts VALUES (10509, 'CarPart_TruckDoor');
INSERT INTO public.parts VALUES (10510, 'CarPart_Workers_Boxslope_6x2x2');
INSERT INTO public.parts VALUES (10511, 'CarPart_Gun_WheelRocket');
INSERT INTO public.parts VALUES (10512, 'CarPart_Structure_bumper2');
INSERT INTO public.parts VALUES (10513, 'CarPart_Exhaust_Quad_01');
INSERT INTO public.parts VALUES (10514, 'Car_Part_dronebarrel_wheel_S');
INSERT INTO public.parts VALUES (10515, 'Cabin_Kamikaze_DronSpawn');
INSERT INTO public.parts VALUES (10516, 'CarPart_Buggy_Grid6');
INSERT INTO public.parts VALUES (10517, 'CarPart_Structure_Syfy_Slope_Large');
INSERT INTO public.parts VALUES (10518, 'CarPart_ChassisLight1x8');
INSERT INTO public.parts VALUES (10519, 'CarPart_Gun_MiddleRangeShotgun_legend');
INSERT INTO public.parts VALUES (10520, 'CarPart_BumperSpike_rare');
INSERT INTO public.parts VALUES (10521, 'CarPart_ChassisLight4');
INSERT INTO public.parts VALUES (10522, 'CarPart_Gun_Shotgun_Frontal');
INSERT INTO public.parts VALUES (10523, 'CarPart_Military_Spikes1_Right');
INSERT INTO public.parts VALUES (10524, 'CarPart_ChassisBase1x8');
INSERT INTO public.parts VALUES (10525, 'CarPart_BumperTrain_rare');
INSERT INTO public.parts VALUES (10526, 'CarPart_Wheel_Work');
INSERT INTO public.parts VALUES (10527, 'CarPart_Gun_SMG');
INSERT INTO public.parts VALUES (10528, 'CarPart_Gun_SMG_Legend');
INSERT INTO public.parts VALUES (10529, 'CarPart_Radiator_rare');
INSERT INTO public.parts VALUES (10530, 'CarPart_AutoGuidedCourseGun_Nurs_Preepic');
INSERT INTO public.parts VALUES (10531, 'CarPart_Structure_fender2_r');
INSERT INTO public.parts VALUES (10532, 'CarPart_WheelMedium_epic');
INSERT INTO public.parts VALUES (10533, 'CarPart_Wheel_AviaSmall_S');
INSERT INTO public.parts VALUES (10534, 'CarPart_Roundsaw_rare');
INSERT INTO public.parts VALUES (10535, 'CarPart_WheelMilitary_S');
INSERT INTO public.parts VALUES (10536, 'CarPart_WheelMilitary_S_C2_Raider');
INSERT INTO public.parts VALUES (10537, 'CarPart_WheelMilitary');
INSERT INTO public.parts VALUES (10538, 'CarPart_Workers_Boxslope_6x1x2');
INSERT INTO public.parts VALUES (10539, 'CarPart_ChainSaw_epic');
INSERT INTO public.parts VALUES (10540, 'CarPart_Military_Spikes1_Left');
INSERT INTO public.parts VALUES (10541, 'CarPart_Avia_fender_l');
INSERT INTO public.parts VALUES (10542, 'CarPart_Avia_fender_r');
INSERT INTO public.parts VALUES (10543, 'CarPart_AviaRadial2x2x2');
INSERT INTO public.parts VALUES (10544, 'CarPart_Structure_CyberEast_Splitter_01');
INSERT INTO public.parts VALUES (10545, 'CarPart_TruckBox');
INSERT INTO public.parts VALUES (10546, 'CarPart_Engine_epic');
INSERT INTO public.parts VALUES (10547, 'CarPart_Gun_Machinegun');
INSERT INTO public.parts VALUES (10548, 'CarPart_Gun_CloseCombatCannon');
INSERT INTO public.parts VALUES (10549, 'CarPart_WheelBig_RS_epic');
INSERT INTO public.parts VALUES (10550, 'CarPart_WheelBig_R_epic');
INSERT INTO public.parts VALUES (10551, 'CarPart_TruckSide');
INSERT INTO public.parts VALUES (10552, 'Cabin_Lunar_Rover');
INSERT INTO public.parts VALUES (10553, 'CarPart_Footstep');
INSERT INTO public.parts VALUES (10554, 'CarPart_Exhaust2');
INSERT INTO public.parts VALUES (10555, 'CarPart_TankTrack_rare');
INSERT INTO public.parts VALUES (10556, 'CarPart_Muscle_front');
INSERT INTO public.parts VALUES (10557, 'Cabin_Moonwalker');
INSERT INTO public.parts VALUES (10558, 'CarPart_Hover_rare');
INSERT INTO public.parts VALUES (10559, 'CarPart_Gun_Plasma_Drill');
INSERT INTO public.parts VALUES (10560, 'CarPart_RadarSmall_rare');
INSERT INTO public.parts VALUES (10561, 'CarPart_Gun_Shotgun');
INSERT INTO public.parts VALUES (10562, 'CarPart_Gun_Shotgun_Fixed_epic');
INSERT INTO public.parts VALUES (10563, 'CarPart_VanWindow_epic');
INSERT INTO public.parts VALUES (10564, 'CarPart_Gun_Flamethrower_frontal');
INSERT INTO public.parts VALUES (10565, 'CarPart_Harvester_legend');
INSERT INTO public.parts VALUES (10566, 'CarPart_Wheel_Ilon');
INSERT INTO public.parts VALUES (10567, 'CarPart_Nosecut_Death');
INSERT INTO public.parts VALUES (10568, 'CarPart_ChassisLight1x6');
INSERT INTO public.parts VALUES (10569, 'CarPart_WheelDroneDeployer_epic');
INSERT INTO public.parts VALUES (10570, 'CarPart_TurretDeployerMissile_epic');
INSERT INTO public.parts VALUES (10571, 'CarPart_NewSpike_square');
INSERT INTO public.parts VALUES (10572, 'CarPart_Wheel_Stance_S');
INSERT INTO public.parts VALUES (10573, 'Cabin_Satellite');
INSERT INTO public.parts VALUES (10574, 'CarPart_Quadrocopter_preepic');
INSERT INTO public.parts VALUES (10575, 'CarPart_Structure_Junk_Corner_2x1x3_L');
INSERT INTO public.parts VALUES (10576, 'CarPart_AviaSlope2x1x2');
INSERT INTO public.parts VALUES (10577, 'CarPart_Wheel_Raider_01_epic');
INSERT INTO public.parts VALUES (10578, 'CarPart_Structure_Workers_Cornerpart_2x3x1_R');
INSERT INTO public.parts VALUES (10579, 'CarPart_Structure_Junk_Corner_2x1x3_R');
INSERT INTO public.parts VALUES (10580, 'CarPart_Structure_Workers_Cornerpart_2x3x1_L');
INSERT INTO public.parts VALUES (10581, 'CarPart_Structure_CyberEast_Trunk_02_R');
INSERT INTO public.parts VALUES (10582, 'CarPart_Gun_Blast_ClassicCrossbow');
INSERT INTO public.parts VALUES (10583, 'CarPart_Structure_SyFy_bumper');
INSERT INTO public.parts VALUES (10584, 'Cabin_Volcano');
INSERT INTO public.parts VALUES (10585, 'CarPart_Quadrocopter_Syfy');
INSERT INTO public.parts VALUES (10586, 'CarPart_Quadrocopter_epic');
INSERT INTO public.parts VALUES (10587, 'CarPart_Wheel_Raider_01_epic_S');
INSERT INTO public.parts VALUES (10588, 'CarPart_Structure_Scientists_Bumper2');
INSERT INTO public.parts VALUES (10589, 'CarPart_Wheel_Drag_S_C1_Raider');
INSERT INTO public.parts VALUES (10590, 'Cabin_CyberEast_Cab1');
INSERT INTO public.parts VALUES (10591, 'CarPart_Spikes_4x2x2');
INSERT INTO public.parts VALUES (10592, 'CarPart_Gun_ShotGun_Garbage');
INSERT INTO public.parts VALUES (10593, 'CarPart_Wheel_Work_S');
INSERT INTO public.parts VALUES (10594, 'CarPart_Buggy_Grid10');
INSERT INTO public.parts VALUES (10595, 'CarPart_lambo_r_fender_l');
INSERT INTO public.parts VALUES (10596, 'CarPart_Military_slope_dble_2x1x2');
INSERT INTO public.parts VALUES (10597, 'CarPart_Gun_NailGun_epic');
INSERT INTO public.parts VALUES (10598, 'CarPart_Gun_NailGun_rare');
INSERT INTO public.parts VALUES (10599, 'CarPart_Gun_BigCannon_EX_epic');
INSERT INTO public.parts VALUES (10600, 'Cabin_Workers_epic');
INSERT INTO public.parts VALUES (10601, 'CarPart_ChassisLight8');
INSERT INTO public.parts VALUES (10602, 'CarPart_Gun_Harpoon');
INSERT INTO public.parts VALUES (10603, 'CarPart_ChainSaw_dble_epic');
INSERT INTO public.parts VALUES (10604, 'CarPart_MechaWheelLeg');
INSERT INTO public.parts VALUES (10605, 'CarPart_Dogs_of_War_const_bumper1');
INSERT INTO public.parts VALUES (10606, 'CarPart_Muscle_fender');
INSERT INTO public.parts VALUES (10607, 'CarPart_Holder_2x2');
INSERT INTO public.parts VALUES (10608, 'CarPart_Gun_Machinegun_rare');
INSERT INTO public.parts VALUES (10609, 'CarPart_Gun_Cannon_Preepic');
INSERT INTO public.parts VALUES (10610, 'CarPart_Wheel_Stance');
INSERT INTO public.parts VALUES (10611, 'CarPart_CyberEast_Neon_4_01');
INSERT INTO public.parts VALUES (10612, 'CarPart_Structure_CyberEast_SideSkirt_01_R');
INSERT INTO public.parts VALUES (10613, 'CarPart_Gun_Shotgun_Fixed_Rare');
INSERT INTO public.parts VALUES (10614, 'CarPart_Buggy_Grid1');
INSERT INTO public.parts VALUES (10615, 'CarPart_TruckSlope');
INSERT INTO public.parts VALUES (10616, 'CarPart_Cooler_rare');
INSERT INTO public.parts VALUES (10617, 'CarPart_Tribal_bumper3');
INSERT INTO public.parts VALUES (10618, 'CarPart_Bumper2_rare');
INSERT INTO public.parts VALUES (10619, 'CarPart_Gun_Syfy_FusionRifle');
INSERT INTO public.parts VALUES (10620, 'CarPart_Structure_Syfy_Box_Wide');
INSERT INTO public.parts VALUES (10621, 'CarPart_Structure_Syfy_Boxslope_Large');
INSERT INTO public.parts VALUES (10622, 'CarPart_ChassisBase2');
INSERT INTO public.parts VALUES (10623, 'CarPart_Shield_mortal');
INSERT INTO public.parts VALUES (10624, 'CarPart_Structure_Syfy_Boxslope_Wide');
INSERT INTO public.parts VALUES (10625, 'CarPart_RadarBig_epic');
INSERT INTO public.parts VALUES (10626, 'CarPart_Structure_Syfy_Boxslope_Small');
INSERT INTO public.parts VALUES (10627, 'CarPart_Gun_Revolver_epic');
INSERT INTO public.parts VALUES (10628, 'CarPart_TankTrackRomb');
INSERT INTO public.parts VALUES (10629, 'CarPart_Gun_ShotGun_Garbage_legend');
INSERT INTO public.parts VALUES (10630, 'CarPart_Gun_Minigun_Legend');
INSERT INTO public.parts VALUES (10631, 'CarPart_Gun_CannonMinigun_legend');
INSERT INTO public.parts VALUES (10632, 'CarPart_Structure_Syfy_Box_Small');
INSERT INTO public.parts VALUES (10633, 'CarPart_WheelDouble_RS_epic_C1_Raider');
INSERT INTO public.parts VALUES (10634, 'Cabin_CyberEast_Cab2');
INSERT INTO public.parts VALUES (10635, 'CarPart_Muscle_cap');
INSERT INTO public.parts VALUES (10636, 'CarPart_Oracle_2x4_Bundle');
INSERT INTO public.parts VALUES (10637, 'CarPart_Military_tower_slope_4x3x2');
INSERT INTO public.parts VALUES (10638, 'CarPart_AviaWing8x1x3');
INSERT INTO public.parts VALUES (10639, 'CarPart_Gun_Syfy_ShotGun');
INSERT INTO public.parts VALUES (10640, 'CarPart_Zubilo_Trunk');
INSERT INTO public.parts VALUES (10641, 'CarPart_Gun_BigCannon_Free_epic');
INSERT INTO public.parts VALUES (10642, 'CarPart_HalfTrunk_R_Pestilence');
INSERT INTO public.parts VALUES (10643, 'Cabin_Famine');
INSERT INTO public.parts VALUES (10644, 'CarPart_BumperArc_epic');
INSERT INTO public.parts VALUES (10645, 'CarPart_Dogs_of_War_const_radiatorgrille1');
INSERT INTO public.parts VALUES (10646, 'CarPart_ChassisBase1x6');
INSERT INTO public.parts VALUES (10647, 'Cabin_War');
INSERT INTO public.parts VALUES (10648, 'CarPart_Gun_Grenade_Launcher_epic');
INSERT INTO public.parts VALUES (10649, 'CarPart_Gun_Missile_3x_Front_epic');
INSERT INTO public.parts VALUES (10650, 'Car_Part_dronebarrel_wheel_rear');
INSERT INTO public.parts VALUES (10651, 'CarPart_Stealth_legend');
INSERT INTO public.parts VALUES (10652, 'CarPart_Gun_Carabine');
INSERT INTO public.parts VALUES (10653, 'CarPart_Gun_SmartMachinegun');
INSERT INTO public.parts VALUES (10654, 'CarPart_Grid_3');
INSERT INTO public.parts VALUES (10655, 'CarPart_BumperTrain2');
INSERT INTO public.parts VALUES (10656, 'CarPart_Gun_Syfy_Plazma');
INSERT INTO public.parts VALUES (10657, 'CarPart_ChassisBase1x4');
INSERT INTO public.parts VALUES (10658, 'CarPart_ChassisLight6');
INSERT INTO public.parts VALUES (10659, 'CarPart_Structure_CyberEast_Diffuser_01');
INSERT INTO public.parts VALUES (10660, 'CarPart_Structure_CyberEast_NoseCut_02');
INSERT INTO public.parts VALUES (10661, 'CarPart_Structure_CyberEast_Fender_Front_02_L');
INSERT INTO public.parts VALUES (10662, 'CarPart_Gun_SniperCrossbow');
INSERT INTO public.parts VALUES (10663, 'CarPart_kamikazeDroneDeployer');
INSERT INTO public.parts VALUES (10664, 'CarPart_Gun_GrenadeLauncher_Auto');
INSERT INTO public.parts VALUES (10665, 'Cabin_InnateMelee');
INSERT INTO public.parts VALUES (10666, 'CarPart_Buggy_fender');
INSERT INTO public.parts VALUES (10667, 'CarPart_Exhaust_Dble_Side_L');
INSERT INTO public.parts VALUES (10668, 'CarPart_TruckSlope_Fender');
INSERT INTO public.parts VALUES (10669, 'CarPart_Gun_Plasma_Drill_legendary');
INSERT INTO public.parts VALUES (10670, 'CarPart_WheelSmallSpiked_S');
INSERT INTO public.parts VALUES (10671, 'CarPart_Gun_BigCannon_Free_T34_epic');
INSERT INTO public.parts VALUES (10672, 'CarPart_Gun_CannonLong_legend');
INSERT INTO public.parts VALUES (10673, 'CarPart_Structure_trunk');
INSERT INTO public.parts VALUES (10674, 'CarPart_Military_Bumper1_Right');
INSERT INTO public.parts VALUES (10675, 'CarPart_Structure_Workers_Sidepart_1x3x7');
INSERT INTO public.parts VALUES (10676, 'CarPart_Structure_diffusor');
INSERT INTO public.parts VALUES (10677, 'CarPart_Wheel_Moonwalker_S');
INSERT INTO public.parts VALUES (10678, 'CarPart_EngineMini_epic');
INSERT INTO public.parts VALUES (10679, 'CarPart_TruckPipeBig2x4');
INSERT INTO public.parts VALUES (10680, 'CarPart_AutoGuidedCourseGun_epic');
INSERT INTO public.parts VALUES (10681, 'CarPart_Improv_HomingMissileLauncher_epic');
INSERT INTO public.parts VALUES (10682, 'CarPart_Structure_Raider_Bumper_01');
INSERT INTO public.parts VALUES (10683, 'CarPart_Structure_CyberEast_FenderDif_02_L');
INSERT INTO public.parts VALUES (10684, 'CarPart_ChassisLight2x6');
INSERT INTO public.parts VALUES (10685, 'CarPart_Engine_avia_front');
INSERT INTO public.parts VALUES (10686, 'CarPart_Structure_Syfy_Box_Large');
INSERT INTO public.parts VALUES (10687, 'CarPart_Structure_hood_half');
INSERT INTO public.parts VALUES (10688, 'CarPart_Military_box_slope_2x1x4');
INSERT INTO public.parts VALUES (10689, 'CarPart_ArmorPlate_Grid2_rare');
INSERT INTO public.parts VALUES (10690, 'CarPart_Scientists_Box_4x4x2');
INSERT INTO public.parts VALUES (10691, 'Cabin_Zubilo');
INSERT INTO public.parts VALUES (10692, 'CarPart_AutoGuidedCourseGun_rare');
INSERT INTO public.parts VALUES (10693, 'CarPart_SpearExplosive');
INSERT INTO public.parts VALUES (10694, 'CarPart_Structure_Raider_Boxslope_3x1x7');
INSERT INTO public.parts VALUES (10695, 'CarPart_Gun_Coilgun_Legend');
INSERT INTO public.parts VALUES (10696, 'CarPart_Military_slope_3ple_1x1x8');
INSERT INTO public.parts VALUES (10697, 'CarPart_Wheel_Drag_S');
INSERT INTO public.parts VALUES (10698, 'CarPart_Engine_v8');
INSERT INTO public.parts VALUES (10699, 'CarPart_TruckPipeBig2x6');
INSERT INTO public.parts VALUES (10700, 'CarPart_Gun_BigCannon_Free_rare');
INSERT INTO public.parts VALUES (10701, 'CarPart_Gun_Cannon_rare');
INSERT INTO public.parts VALUES (10702, 'CarPart_Radiator_epic');
INSERT INTO public.parts VALUES (10703, 'CarPart_Tribal_Box_4x4x2');
INSERT INTO public.parts VALUES (10704, 'CarPart_TruckPipe4x1x1');
INSERT INTO public.parts VALUES (10705, 'Cabin_Lambo');
INSERT INTO public.parts VALUES (10706, 'CarPart_ChassisLight1x4');
INSERT INTO public.parts VALUES (10707, 'CarPart_WheelSmallChains_S');
INSERT INTO public.parts VALUES (10708, 'CarPart_Gun_Shotgun_rare');
INSERT INTO public.parts VALUES (10709, 'CarPart_AviaSlope2x1x1');
INSERT INTO public.parts VALUES (10710, 'CarPart_WheelMed_R_rare');
INSERT INTO public.parts VALUES (10711, 'CarPart_WheelMed_RS_rare');
INSERT INTO public.parts VALUES (10712, 'CarPart_Military_Box_4x4x2');
INSERT INTO public.parts VALUES (10713, 'CarPart_Wheel_Medieval_S');
INSERT INTO public.parts VALUES (10714, 'CarPart_Trunk_Pestilence');
INSERT INTO public.parts VALUES (10715, 'CarPart_Cooldown_Accelerator_epic');
INSERT INTO public.parts VALUES (10716, 'CarPart_Wheel_Baloon');
INSERT INTO public.parts VALUES (10717, 'CarPart_Moby_Rear_Fender_R');
INSERT INTO public.parts VALUES (10718, 'CarPart_Structure_CyberEast_Fender_Rear_02_L');
INSERT INTO public.parts VALUES (10719, 'CarPart_Structure_CyberEast_Fender_Rear_02_R');


--
-- Data for Name: resources; Type: TABLE DATA; Schema: public; Owner: dev
--

INSERT INTO public.resources VALUES (39, 'Scrap_Common');
INSERT INTO public.resources VALUES (40, 'expBase');
INSERT INTO public.resources VALUES (41, 'expDailyBonus');
INSERT INTO public.resources VALUES (42, 'expTotal');
INSERT INTO public.resources VALUES (43, 'expBaseFactionTotal');
INSERT INTO public.resources VALUES (44, 'expFactionTotal');
INSERT INTO public.resources VALUES (45, 'Scrap_Rare');
INSERT INTO public.resources VALUES (46, 'Glory');
INSERT INTO public.resources VALUES (47, 'Accumulators');
INSERT INTO public.resources VALUES (48, 'Platinum');


--
-- Data for Name: round_player_damages; Type: TABLE DATA; Schema: public; Owner: dev
--

INSERT INTO public.round_player_damages VALUES (25627, 857, 8345.27);
INSERT INTO public.round_player_damages VALUES (25627, 858, 164.06);
INSERT INTO public.round_player_damages VALUES (25627, 859, 239.06);
INSERT INTO public.round_player_damages VALUES (25628, 860, 2486.17);
INSERT INTO public.round_player_damages VALUES (25628, 861, 3479.57);
INSERT INTO public.round_player_damages VALUES (25628, 859, 118.45);
INSERT INTO public.round_player_damages VALUES (25629, 862, 1111.74);
INSERT INTO public.round_player_damages VALUES (25629, 859, 254.54);
INSERT INTO public.round_player_damages VALUES (25630, 863, 498.32);
INSERT INTO public.round_player_damages VALUES (25631, 864, 2055.02);
INSERT INTO public.round_player_damages VALUES (25631, 859, 7.43);
INSERT INTO public.round_player_damages VALUES (25631, 865, 61.21);
INSERT INTO public.round_player_damages VALUES (25632, 864, 3257.42);
INSERT INTO public.round_player_damages VALUES (25632, 865, 836.73);
INSERT INTO public.round_player_damages VALUES (25632, 859, 19.48);
INSERT INTO public.round_player_damages VALUES (25633, 865, 148.67);
INSERT INTO public.round_player_damages VALUES (25634, 866, 704.09);
INSERT INTO public.round_player_damages VALUES (25634, 867, 136.61);
INSERT INTO public.round_player_damages VALUES (25635, 868, 856.8);
INSERT INTO public.round_player_damages VALUES (25635, 869, 973.68);
INSERT INTO public.round_player_damages VALUES (25635, 859, 100.56);
INSERT INTO public.round_player_damages VALUES (25636, 869, 448.0);
INSERT INTO public.round_player_damages VALUES (25636, 868, 37.34);
INSERT INTO public.round_player_damages VALUES (25637, 870, 1077.44);
INSERT INTO public.round_player_damages VALUES (25638, 863, 2378.67);
INSERT INTO public.round_player_damages VALUES (25638, 871, 888.11);
INSERT INTO public.round_player_damages VALUES (25638, 859, 271.99);
INSERT INTO public.round_player_damages VALUES (25639, 857, 973.44);
INSERT INTO public.round_player_damages VALUES (25639, 872, 497.04);
INSERT INTO public.round_player_damages VALUES (25639, 873, 2156.35);
INSERT INTO public.round_player_damages VALUES (25640, 859, 206.9);
INSERT INTO public.round_player_damages VALUES (25640, 874, 3163.75);
INSERT INTO public.round_player_damages VALUES (25640, 875, 1050.97);
INSERT INTO public.round_player_damages VALUES (25641, 876, 7287.87);
INSERT INTO public.round_player_damages VALUES (25641, 877, 159.36);
INSERT INTO public.round_player_damages VALUES (25641, 878, 25.41);
INSERT INTO public.round_player_damages VALUES (25642, 875, 607.8);
INSERT INTO public.round_player_damages VALUES (25642, 879, 0.1);
INSERT INTO public.round_player_damages VALUES (25642, 859, 1067.18);
INSERT INTO public.round_player_damages VALUES (25643, 880, 4686.72);
INSERT INTO public.round_player_damages VALUES (25643, 859, 10.51);
INSERT INTO public.round_player_damages VALUES (25644, 881, 1114.37);
INSERT INTO public.round_player_damages VALUES (25644, 859, 320.21);
INSERT INTO public.round_player_damages VALUES (25645, 867, 2308.72);
INSERT INTO public.round_player_damages VALUES (25646, 882, 185.95);
INSERT INTO public.round_player_damages VALUES (25646, 868, 324.06);
INSERT INTO public.round_player_damages VALUES (25646, 859, 1135.41);
INSERT INTO public.round_player_damages VALUES (25647, 883, 5008.71);
INSERT INTO public.round_player_damages VALUES (25647, 859, 586.91);
INSERT INTO public.round_player_damages VALUES (25648, 884, 4254.47);
INSERT INTO public.round_player_damages VALUES (25648, 859, 645.35);
INSERT INTO public.round_player_damages VALUES (25649, 885, 2367.48);
INSERT INTO public.round_player_damages VALUES (25649, 880, 391.18);
INSERT INTO public.round_player_damages VALUES (25649, 859, 485.26);
INSERT INTO public.round_player_damages VALUES (25650, 859, 147.34);
INSERT INTO public.round_player_damages VALUES (25650, 886, 41.32);
INSERT INTO public.round_player_damages VALUES (25651, 862, 2173.97);
INSERT INTO public.round_player_damages VALUES (25651, 887, 916.98);
INSERT INTO public.round_player_damages VALUES (25652, 859, 20.56);
INSERT INTO public.round_player_damages VALUES (25653, 857, 5847.17);
INSERT INTO public.round_player_damages VALUES (25653, 859, 130.64);
INSERT INTO public.round_player_damages VALUES (25654, 888, 1179.28);
INSERT INTO public.round_player_damages VALUES (25654, 870, 1601.42);
INSERT INTO public.round_player_damages VALUES (25655, 880, 4225.44);
INSERT INTO public.round_player_damages VALUES (25655, 859, 382.3);
INSERT INTO public.round_player_damages VALUES (25656, 859, 1615.04);
INSERT INTO public.round_player_damages VALUES (25657, 859, 330.0);
INSERT INTO public.round_player_damages VALUES (25657, 875, 3.41);
INSERT INTO public.round_player_damages VALUES (25658, 889, 1293.77);
INSERT INTO public.round_player_damages VALUES (25658, 859, 740.85);
INSERT INTO public.round_player_damages VALUES (25659, 890, 4808.49);
INSERT INTO public.round_player_damages VALUES (25659, 859, 277.17);
INSERT INTO public.round_player_damages VALUES (25659, 858, 107.15);
INSERT INTO public.round_player_damages VALUES (25659, 891, 176.0);
INSERT INTO public.round_player_damages VALUES (25660, 869, 1049.29);
INSERT INTO public.round_player_damages VALUES (25660, 868, 555.07);
INSERT INTO public.round_player_damages VALUES (25660, 859, 24.0);
INSERT INTO public.round_player_damages VALUES (25661, 862, 269.56);
INSERT INTO public.round_player_damages VALUES (25661, 859, 2.62);
INSERT INTO public.round_player_damages VALUES (25662, 864, 49.59);
INSERT INTO public.round_player_damages VALUES (25662, 865, 130.31);
INSERT INTO public.round_player_damages VALUES (25663, 892, 5542.93);
INSERT INTO public.round_player_damages VALUES (25663, 877, 269.43);
INSERT INTO public.round_player_damages VALUES (25664, 857, 6247.69);
INSERT INTO public.round_player_damages VALUES (25664, 859, 92.37);
INSERT INTO public.round_player_damages VALUES (25665, 893, 4355.25);
INSERT INTO public.round_player_damages VALUES (25665, 859, 18.08);
INSERT INTO public.round_player_damages VALUES (25666, 894, 1919.48);
INSERT INTO public.round_player_damages VALUES (25666, 859, 172.3);
INSERT INTO public.round_player_damages VALUES (25667, 895, 24.58);
INSERT INTO public.round_player_damages VALUES (25667, 859, 37.82);
INSERT INTO public.round_player_damages VALUES (25667, 896, 25.95);
INSERT INTO public.round_player_damages VALUES (25667, 868, 11.27);
INSERT INTO public.round_player_damages VALUES (25668, 897, 2359.86);
INSERT INTO public.round_player_damages VALUES (25669, 884, 3949.86);
INSERT INTO public.round_player_damages VALUES (25669, 859, 42.73);
INSERT INTO public.round_player_damages VALUES (25670, 857, 835.39);
INSERT INTO public.round_player_damages VALUES (25670, 872, 441.07);
INSERT INTO public.round_player_damages VALUES (25670, 861, 648.54);
INSERT INTO public.round_player_damages VALUES (25671, 885, 4774.69);
INSERT INTO public.round_player_damages VALUES (25671, 859, 724.7);
INSERT INTO public.round_player_damages VALUES (25672, 896, 1811.33);
INSERT INTO public.round_player_damages VALUES (25672, 859, 415.02);
INSERT INTO public.round_player_damages VALUES (25673, 898, 3684.7);
INSERT INTO public.round_player_damages VALUES (25673, 859, 132.62);
INSERT INTO public.round_player_damages VALUES (25673, 891, 53.16);
INSERT INTO public.round_player_damages VALUES (25673, 899, 747.34);
INSERT INTO public.round_player_damages VALUES (25674, 900, 690.82);
INSERT INTO public.round_player_damages VALUES (25674, 901, 1106.03);
INSERT INTO public.round_player_damages VALUES (25674, 859, 1688.63);
INSERT INTO public.round_player_damages VALUES (25675, 890, 4117.77);
INSERT INTO public.round_player_damages VALUES (25675, 877, 546.98);
INSERT INTO public.round_player_damages VALUES (25675, 859, 1058.89);
INSERT INTO public.round_player_damages VALUES (25676, 894, 5274.73);
INSERT INTO public.round_player_damages VALUES (25676, 859, 486.84);
INSERT INTO public.round_player_damages VALUES (25677, 885, 6472.2);
INSERT INTO public.round_player_damages VALUES (25677, 859, 547.73);
INSERT INTO public.round_player_damages VALUES (25678, 857, 174.59);
INSERT INTO public.round_player_damages VALUES (25678, 872, 747.65);
INSERT INTO public.round_player_damages VALUES (25678, 861, 683.77);
INSERT INTO public.round_player_damages VALUES (25678, 859, 280.75);
INSERT INTO public.round_player_damages VALUES (25678, 902, 33.0);
INSERT INTO public.round_player_damages VALUES (25679, 857, 1134.08);
INSERT INTO public.round_player_damages VALUES (25679, 859, 29.12);
INSERT INTO public.round_player_damages VALUES (25680, 893, 1157.72);
INSERT INTO public.round_player_damages VALUES (25680, 859, 182.86);
INSERT INTO public.round_player_damages VALUES (25681, 870, 2293.48);
INSERT INTO public.round_player_damages VALUES (25681, 859, 11.36);
INSERT INTO public.round_player_damages VALUES (25682, 897, 2471.12);
INSERT INTO public.round_player_damages VALUES (25682, 859, 8.42);
INSERT INTO public.round_player_damages VALUES (25683, 859, 43.41);
INSERT INTO public.round_player_damages VALUES (25683, 868, 222.2);
INSERT INTO public.round_player_damages VALUES (25683, 869, 649.99);
INSERT INTO public.round_player_damages VALUES (25684, 868, 681.02);
INSERT INTO public.round_player_damages VALUES (25684, 859, 74.59);
INSERT INTO public.round_player_damages VALUES (25684, 872, 204.9);
INSERT INTO public.round_player_damages VALUES (25685, 868, 551.85);
INSERT INTO public.round_player_damages VALUES (25685, 869, 266.0);
INSERT INTO public.round_player_damages VALUES (25686, 892, 1359.62);
INSERT INTO public.round_player_damages VALUES (25686, 859, 751.4);
INSERT INTO public.round_player_damages VALUES (25687, 859, 30.55);
INSERT INTO public.round_player_damages VALUES (25687, 903, 984.47);
INSERT INTO public.round_player_damages VALUES (25687, 868, 52.57);
INSERT INTO public.round_player_damages VALUES (25688, 863, 2332.0);
INSERT INTO public.round_player_damages VALUES (25688, 859, 225.01);
INSERT INTO public.round_player_damages VALUES (25689, 904, 2547.09);
INSERT INTO public.round_player_damages VALUES (25689, 905, 868.01);
INSERT INTO public.round_player_damages VALUES (25689, 902, 1333.93);
INSERT INTO public.round_player_damages VALUES (25689, 859, 13.63);
INSERT INTO public.round_player_damages VALUES (25689, 899, 953.86);
INSERT INTO public.round_player_damages VALUES (25690, 900, 1080.63);
INSERT INTO public.round_player_damages VALUES (25690, 901, 2030.24);
INSERT INTO public.round_player_damages VALUES (25690, 859, 72.58);
INSERT INTO public.round_player_damages VALUES (25691, 890, 10740.41);
INSERT INTO public.round_player_damages VALUES (25691, 859, 744.97);
INSERT INTO public.round_player_damages VALUES (25691, 891, 62.77);
INSERT INTO public.round_player_damages VALUES (25691, 877, 431.88);
INSERT INTO public.round_player_damages VALUES (25692, 869, 1298.32);
INSERT INTO public.round_player_damages VALUES (25692, 859, 28.8);
INSERT INTO public.round_player_damages VALUES (25692, 868, 8.97);
INSERT INTO public.round_player_damages VALUES (25693, 868, 574.03);
INSERT INTO public.round_player_damages VALUES (25693, 859, 173.51);
INSERT INTO public.round_player_damages VALUES (25693, 869, 657.25);
INSERT INTO public.round_player_damages VALUES (25694, 859, 55.28);
INSERT INTO public.round_player_damages VALUES (25694, 868, 1133.29);
INSERT INTO public.round_player_damages VALUES (25696, 859, 88.69);
INSERT INTO public.round_player_damages VALUES (25696, 862, 147.21);
INSERT INTO public.round_player_damages VALUES (25697, 868, 36.38);
INSERT INTO public.round_player_damages VALUES (25697, 859, 41.42);
INSERT INTO public.round_player_damages VALUES (25697, 869, 473.0);
INSERT INTO public.round_player_damages VALUES (25698, 898, 2354.69);
INSERT INTO public.round_player_damages VALUES (25698, 859, 132.88);
INSERT INTO public.round_player_damages VALUES (25699, 906, 1556.94);
INSERT INTO public.round_player_damages VALUES (25699, 907, 1041.22);
INSERT INTO public.round_player_damages VALUES (25699, 859, 0.48);
INSERT INTO public.round_player_damages VALUES (25700, 870, 2245.14);
INSERT INTO public.round_player_damages VALUES (25700, 859, 19.5);
INSERT INTO public.round_player_damages VALUES (25701, 865, 1389.62);
INSERT INTO public.round_player_damages VALUES (25701, 908, 1746.08);
INSERT INTO public.round_player_damages VALUES (25701, 909, 1206.57);
INSERT INTO public.round_player_damages VALUES (25701, 859, 130.06);
INSERT INTO public.round_player_damages VALUES (25702, 882, 1514.3);
INSERT INTO public.round_player_damages VALUES (25702, 859, 674.65);
INSERT INTO public.round_player_damages VALUES (25703, 910, 2030.43);
INSERT INTO public.round_player_damages VALUES (25703, 881, 451.71);
INSERT INTO public.round_player_damages VALUES (25703, 859, 470.92);
INSERT INTO public.round_player_damages VALUES (25704, 911, 5209.85);
INSERT INTO public.round_player_damages VALUES (25704, 859, 57.29);
INSERT INTO public.round_player_damages VALUES (25705, 881, 849.88);
INSERT INTO public.round_player_damages VALUES (25705, 912, 649.97);
INSERT INTO public.round_player_damages VALUES (25705, 913, 1242.08);
INSERT INTO public.round_player_damages VALUES (25705, 859, 126.06);
INSERT INTO public.round_player_damages VALUES (25706, 904, 804.06);
INSERT INTO public.round_player_damages VALUES (25706, 905, 277.01);
INSERT INTO public.round_player_damages VALUES (25706, 902, 217.52);
INSERT INTO public.round_player_damages VALUES (25706, 859, 49.38);
INSERT INTO public.round_player_damages VALUES (25707, 890, 6108.46);
INSERT INTO public.round_player_damages VALUES (25707, 859, 695.5);
INSERT INTO public.round_player_damages VALUES (25708, 875, 3395.88);
INSERT INTO public.round_player_damages VALUES (25708, 859, 687.01);
INSERT INTO public.round_player_damages VALUES (25708, 877, 1184.33);
INSERT INTO public.round_player_damages VALUES (25708, 858, 478.96);
INSERT INTO public.round_player_damages VALUES (25709, 914, 5815.87);
INSERT INTO public.round_player_damages VALUES (25709, 859, 392.85);
INSERT INTO public.round_player_damages VALUES (25710, 897, 1973.54);
INSERT INTO public.round_player_damages VALUES (25710, 859, 90.03);
INSERT INTO public.round_player_damages VALUES (25711, 912, 807.31);
INSERT INTO public.round_player_damages VALUES (25711, 913, 1094.19);
INSERT INTO public.round_player_damages VALUES (25711, 881, 297.84);
INSERT INTO public.round_player_damages VALUES (25711, 859, 3008.33);
INSERT INTO public.round_player_damages VALUES (25712, 898, 2547.19);
INSERT INTO public.round_player_damages VALUES (25712, 859, 132.9);
INSERT INTO public.round_player_damages VALUES (25712, 915, 1951.32);
INSERT INTO public.round_player_damages VALUES (25712, 877, 835.21);
INSERT INTO public.round_player_damages VALUES (25712, 858, 8.82);
INSERT INTO public.round_player_damages VALUES (25713, 885, 3780.01);
INSERT INTO public.round_player_damages VALUES (25713, 859, 194.86);
INSERT INTO public.round_player_damages VALUES (25713, 891, 71.9);
INSERT INTO public.round_player_damages VALUES (25714, 870, 4803.04);
INSERT INTO public.round_player_damages VALUES (25714, 891, 583.8);
INSERT INTO public.round_player_damages VALUES (25714, 859, 75.03);
INSERT INTO public.round_player_damages VALUES (25715, 916, 308.3);
INSERT INTO public.round_player_damages VALUES (25715, 917, 289.85);
INSERT INTO public.round_player_damages VALUES (25716, 863, 439.1);
INSERT INTO public.round_player_damages VALUES (25716, 918, 827.15);
INSERT INTO public.round_player_damages VALUES (25716, 859, 2438.1);
INSERT INTO public.round_player_damages VALUES (25717, 863, 435.57);
INSERT INTO public.round_player_damages VALUES (25717, 859, 82.2);
INSERT INTO public.round_player_damages VALUES (25718, 864, 423.79);
INSERT INTO public.round_player_damages VALUES (25718, 859, 75.3);
INSERT INTO public.round_player_damages VALUES (25718, 865, 108.59);
INSERT INTO public.round_player_damages VALUES (25718, 915, 2.26);
INSERT INTO public.round_player_damages VALUES (25719, 910, 832.32);
INSERT INTO public.round_player_damages VALUES (25719, 881, 80.0);
INSERT INTO public.round_player_damages VALUES (25719, 859, 195.46);
INSERT INTO public.round_player_damages VALUES (25720, 919, 0.6);
INSERT INTO public.round_player_damages VALUES (25720, 920, 2221.11);
INSERT INTO public.round_player_damages VALUES (25720, 859, 10.09);
INSERT INTO public.round_player_damages VALUES (25720, 902, 564.82);
INSERT INTO public.round_player_damages VALUES (25721, 867, 1754.8);
INSERT INTO public.round_player_damages VALUES (25721, 859, 186.0);
INSERT INTO public.round_player_damages VALUES (25722, 872, 1355.24);
INSERT INTO public.round_player_damages VALUES (25722, 857, 1395.81);
INSERT INTO public.round_player_damages VALUES (25722, 859, 7.81);
INSERT INTO public.round_player_damages VALUES (25722, 908, 845.5);
INSERT INTO public.round_player_damages VALUES (25723, 890, 7395.6);
INSERT INTO public.round_player_damages VALUES (25723, 859, 29.24);
INSERT INTO public.round_player_damages VALUES (25723, 858, 98.84);
INSERT INTO public.round_player_damages VALUES (25723, 878, 174.72);
INSERT INTO public.round_player_damages VALUES (25724, 919, 0.2);
INSERT INTO public.round_player_damages VALUES (25724, 875, 3801.28);
INSERT INTO public.round_player_damages VALUES (25724, 859, 3.98);
INSERT INTO public.round_player_damages VALUES (25725, 857, 1107.08);
INSERT INTO public.round_player_damages VALUES (25725, 910, 573.57);
INSERT INTO public.round_player_damages VALUES (25725, 921, 106.45);
INSERT INTO public.round_player_damages VALUES (25725, 859, 214.46);
INSERT INTO public.round_player_damages VALUES (25726, 863, 1663.66);
INSERT INTO public.round_player_damages VALUES (25726, 859, 279.79);
INSERT INTO public.round_player_damages VALUES (25727, 864, 652.0);
INSERT INTO public.round_player_damages VALUES (25727, 865, 499.93);
INSERT INTO public.round_player_damages VALUES (25727, 859, 180.03);
INSERT INTO public.round_player_damages VALUES (25728, 869, 1988.71);
INSERT INTO public.round_player_damages VALUES (25728, 868, 589.95);
INSERT INTO public.round_player_damages VALUES (25728, 859, 49.95);
INSERT INTO public.round_player_damages VALUES (25729, 903, 571.92);
INSERT INTO public.round_player_damages VALUES (25729, 868, 372.19);
INSERT INTO public.round_player_damages VALUES (25730, 863, 4853.65);
INSERT INTO public.round_player_damages VALUES (25730, 859, 167.07);
INSERT INTO public.round_player_damages VALUES (25731, 869, 852.19);
INSERT INTO public.round_player_damages VALUES (25731, 868, 309.14);
INSERT INTO public.round_player_damages VALUES (25731, 859, 4.74);
INSERT INTO public.round_player_damages VALUES (25732, 912, 604.94);
INSERT INTO public.round_player_damages VALUES (25732, 913, 1416.32);
INSERT INTO public.round_player_damages VALUES (25732, 881, 459.99);
INSERT INTO public.round_player_damages VALUES (25733, 911, 5797.09);
INSERT INTO public.round_player_damages VALUES (25733, 859, 62.0);
INSERT INTO public.round_player_damages VALUES (25734, 910, 1250.72);
INSERT INTO public.round_player_damages VALUES (25734, 881, 342.04);
INSERT INTO public.round_player_damages VALUES (25734, 859, 335.84);
INSERT INTO public.round_player_damages VALUES (25735, 921, 903.5);
INSERT INTO public.round_player_damages VALUES (25735, 900, 391.89);
INSERT INTO public.round_player_damages VALUES (25735, 922, 899.01);
INSERT INTO public.round_player_damages VALUES (25735, 882, 1022.13);
INSERT INTO public.round_player_damages VALUES (25735, 859, 40.16);
INSERT INTO public.round_player_damages VALUES (25735, 923, 30.65);
INSERT INTO public.round_player_damages VALUES (25736, 917, 805.72);
INSERT INTO public.round_player_damages VALUES (25736, 916, 140.0);
INSERT INTO public.round_player_damages VALUES (25737, 859, 265.12);
INSERT INTO public.round_player_damages VALUES (25737, 898, 1872.79);
INSERT INTO public.round_player_damages VALUES (25737, 923, 846.34);
INSERT INTO public.round_player_damages VALUES (25737, 924, 149.16);
INSERT INTO public.round_player_damages VALUES (25738, 925, 2148.18);
INSERT INTO public.round_player_damages VALUES (25738, 905, 480.75);
INSERT INTO public.round_player_damages VALUES (25738, 859, 493.92);
INSERT INTO public.round_player_damages VALUES (25739, 890, 11250.68);
INSERT INTO public.round_player_damages VALUES (25739, 859, 14.14);
INSERT INTO public.round_player_damages VALUES (25740, 859, 632.08);
INSERT INTO public.round_player_damages VALUES (25740, 902, 4840.86);
INSERT INTO public.round_player_damages VALUES (25740, 877, 132.59);
INSERT INTO public.round_player_damages VALUES (25741, 864, 757.69);
INSERT INTO public.round_player_damages VALUES (25741, 859, 1.69);
INSERT INTO public.round_player_damages VALUES (25741, 865, 168.3);
INSERT INTO public.round_player_damages VALUES (25742, 864, 3212.71);
INSERT INTO public.round_player_damages VALUES (25742, 859, 62.46);
INSERT INTO public.round_player_damages VALUES (25742, 865, 673.06);
INSERT INTO public.round_player_damages VALUES (25743, 926, 382.87);
INSERT INTO public.round_player_damages VALUES (25743, 859, 249.19);
INSERT INTO public.round_player_damages VALUES (25744, 863, 279.35);
INSERT INTO public.round_player_damages VALUES (25744, 859, 21.1);
INSERT INTO public.round_player_damages VALUES (25745, 869, 1024.25);
INSERT INTO public.round_player_damages VALUES (25745, 859, 5.68);
INSERT INTO public.round_player_damages VALUES (25745, 868, 389.29);
INSERT INTO public.round_player_damages VALUES (25746, 859, 63.7);
INSERT INTO public.round_player_damages VALUES (25746, 863, 2156.31);
INSERT INTO public.round_player_damages VALUES (25747, 872, 1986.51);
INSERT INTO public.round_player_damages VALUES (25747, 859, 754.59);
INSERT INTO public.round_player_damages VALUES (25749, 861, 1926.85);
INSERT INTO public.round_player_damages VALUES (25749, 860, 1194.78);
INSERT INTO public.round_player_damages VALUES (25749, 859, 51.11);
INSERT INTO public.round_player_damages VALUES (25750, 927, 6065.93);
INSERT INTO public.round_player_damages VALUES (25751, 859, 390.73);
INSERT INTO public.round_player_damages VALUES (25751, 885, 2257.74);
INSERT INTO public.round_player_damages VALUES (25752, 859, 15.0);
INSERT INTO public.round_player_damages VALUES (25752, 882, 5768.99);
INSERT INTO public.round_player_damages VALUES (25752, 879, 0.36);
INSERT INTO public.round_player_damages VALUES (25753, 897, 6078.86);
INSERT INTO public.round_player_damages VALUES (25754, 928, 2710.7);
INSERT INTO public.round_player_damages VALUES (25754, 859, 75.53);
INSERT INTO public.round_player_damages VALUES (25755, 890, 13885.75);
INSERT INTO public.round_player_damages VALUES (25755, 859, 1044.98);
INSERT INTO public.round_player_damages VALUES (25755, 891, 1125.93);
INSERT INTO public.round_player_damages VALUES (25755, 858, 1764.0);
INSERT INTO public.round_player_damages VALUES (25755, 877, 387.35);
INSERT INTO public.round_player_damages VALUES (25756, 859, 472.85);
INSERT INTO public.round_player_damages VALUES (25756, 929, 856.23);
INSERT INTO public.round_player_damages VALUES (25757, 903, 118.84);
INSERT INTO public.round_player_damages VALUES (25758, 864, 2474.35);
INSERT INTO public.round_player_damages VALUES (25758, 865, 850.91);
INSERT INTO public.round_player_damages VALUES (25758, 930, 345.18);
INSERT INTO public.round_player_damages VALUES (25758, 859, 59.38);
INSERT INTO public.round_player_damages VALUES (25759, 926, 1026.5);
INSERT INTO public.round_player_damages VALUES (25759, 859, 93.09);
INSERT INTO public.round_player_damages VALUES (25760, 864, 731.69);
INSERT INTO public.round_player_damages VALUES (25760, 865, 193.83);
INSERT INTO public.round_player_damages VALUES (25761, 864, 2542.24);
INSERT INTO public.round_player_damages VALUES (25761, 865, 132.16);
INSERT INTO public.round_player_damages VALUES (25761, 859, 85.64);
INSERT INTO public.round_player_damages VALUES (25762, 859, 3471.61);
INSERT INTO public.round_player_damages VALUES (25763, 910, 581.77);
INSERT INTO public.round_player_damages VALUES (25763, 859, 2043.09);
INSERT INTO public.round_player_damages VALUES (25763, 909, 928.91);
INSERT INTO public.round_player_damages VALUES (25764, 882, 441.19);
INSERT INTO public.round_player_damages VALUES (25764, 868, 1217.59);
INSERT INTO public.round_player_damages VALUES (25764, 859, 23.62);
INSERT INTO public.round_player_damages VALUES (25765, 868, 1134.85);
INSERT INTO public.round_player_damages VALUES (25765, 859, 92.0);
INSERT INTO public.round_player_damages VALUES (25765, 931, 625.44);
INSERT INTO public.round_player_damages VALUES (25766, 910, 1412.25);
INSERT INTO public.round_player_damages VALUES (25766, 881, 439.35);
INSERT INTO public.round_player_damages VALUES (25766, 930, 221.85);
INSERT INTO public.round_player_damages VALUES (25766, 859, 464.2);
INSERT INTO public.round_player_damages VALUES (25767, 860, 3754.49);
INSERT INTO public.round_player_damages VALUES (25767, 861, 4126.16);
INSERT INTO public.round_player_damages VALUES (25767, 859, 71.91);
INSERT INTO public.round_player_damages VALUES (25767, 877, 471.16);
INSERT INTO public.round_player_damages VALUES (25768, 859, 15.0);
INSERT INTO public.round_player_damages VALUES (25768, 882, 8910.07);
INSERT INTO public.round_player_damages VALUES (25768, 879, 0.36);
INSERT INTO public.round_player_damages VALUES (25769, 922, 859.21);
INSERT INTO public.round_player_damages VALUES (25769, 921, 117.12);
INSERT INTO public.round_player_damages VALUES (25769, 882, 644.7);
INSERT INTO public.round_player_damages VALUES (25769, 900, 2.26);
INSERT INTO public.round_player_damages VALUES (25769, 859, 11.33);
INSERT INTO public.round_player_damages VALUES (25770, 919, 0.1);
INSERT INTO public.round_player_damages VALUES (25770, 920, 2269.21);
INSERT INTO public.round_player_damages VALUES (25770, 902, 1336.23);
INSERT INTO public.round_player_damages VALUES (25770, 924, 425.96);
INSERT INTO public.round_player_damages VALUES (25770, 859, 56.6);
INSERT INTO public.round_player_damages VALUES (25771, 890, 7403.23);
INSERT INTO public.round_player_damages VALUES (25772, 912, 4270.5);
INSERT INTO public.round_player_damages VALUES (25772, 859, 393.62);
INSERT INTO public.round_player_damages VALUES (25773, 859, 4965.89);
INSERT INTO public.round_player_damages VALUES (25773, 877, 3.76);
INSERT INTO public.round_player_damages VALUES (25774, 859, 1647.64);
INSERT INTO public.round_player_damages VALUES (25774, 910, 988.16);
INSERT INTO public.round_player_damages VALUES (25775, 859, 15.0);
INSERT INTO public.round_player_damages VALUES (25775, 882, 3194.79);
INSERT INTO public.round_player_damages VALUES (25775, 879, 0.24);
INSERT INTO public.round_player_damages VALUES (25776, 860, 1800.67);
INSERT INTO public.round_player_damages VALUES (25776, 861, 1915.62);
INSERT INTO public.round_player_damages VALUES (25776, 859, 39.49);
INSERT INTO public.round_player_damages VALUES (25776, 891, 367.7);
INSERT INTO public.round_player_damages VALUES (25777, 870, 4346.77);
INSERT INTO public.round_player_damages VALUES (25777, 859, 24.04);
INSERT INTO public.round_player_damages VALUES (25778, 906, 237.47);
INSERT INTO public.round_player_damages VALUES (25778, 932, 498.07);
INSERT INTO public.round_player_damages VALUES (25778, 859, 9.44);
INSERT INTO public.round_player_damages VALUES (25779, 902, 3572.95);
INSERT INTO public.round_player_damages VALUES (25779, 859, 299.67);
INSERT INTO public.round_player_damages VALUES (25779, 915, 380.45);
INSERT INTO public.round_player_damages VALUES (25780, 903, 878.02);
INSERT INTO public.round_player_damages VALUES (25780, 868, 1727.14);
INSERT INTO public.round_player_damages VALUES (25780, 859, 28.71);
INSERT INTO public.round_player_damages VALUES (25781, 926, 1205.29);
INSERT INTO public.round_player_damages VALUES (25782, 903, 895.41);
INSERT INTO public.round_player_damages VALUES (25782, 868, 665.24);
INSERT INTO public.round_player_damages VALUES (25782, 859, 128.21);
INSERT INTO public.round_player_damages VALUES (25783, 863, 3711.19);
INSERT INTO public.round_player_damages VALUES (25783, 859, 66.58);
INSERT INTO public.round_player_damages VALUES (25784, 864, 124.77);
INSERT INTO public.round_player_damages VALUES (25784, 859, 191.35);
INSERT INTO public.round_player_damages VALUES (25785, 864, 74.88);
INSERT INTO public.round_player_damages VALUES (25785, 865, 654.04);
INSERT INTO public.round_player_damages VALUES (25785, 859, 70.4);
INSERT INTO public.round_player_damages VALUES (25786, 910, 2897.32);
INSERT INTO public.round_player_damages VALUES (25786, 881, 1208.43);
INSERT INTO public.round_player_damages VALUES (25786, 859, 498.94);
INSERT INTO public.round_player_damages VALUES (25786, 877, 123.99);
INSERT INTO public.round_player_damages VALUES (25787, 890, 9859.0);
INSERT INTO public.round_player_damages VALUES (25788, 859, 437.22);
INSERT INTO public.round_player_damages VALUES (25788, 929, 833.87);
INSERT INTO public.round_player_damages VALUES (25789, 881, 2171.93);
INSERT INTO public.round_player_damages VALUES (25789, 889, 379.9);
INSERT INTO public.round_player_damages VALUES (25789, 859, 162.2);
INSERT INTO public.round_player_damages VALUES (25790, 868, 414.24);
INSERT INTO public.round_player_damages VALUES (25790, 903, 341.79);
INSERT INTO public.round_player_damages VALUES (25790, 859, 25.04);
INSERT INTO public.round_player_damages VALUES (25791, 859, 99.74);
INSERT INTO public.round_player_damages VALUES (25791, 869, 459.27);
INSERT INTO public.round_player_damages VALUES (25791, 868, 214.94);
INSERT INTO public.round_player_damages VALUES (25792, 869, 1650.09);
INSERT INTO public.round_player_damages VALUES (25792, 868, 160.59);
INSERT INTO public.round_player_damages VALUES (25792, 859, 1.71);
INSERT INTO public.round_player_damages VALUES (25793, 892, 4122.98);
INSERT INTO public.round_player_damages VALUES (25794, 872, 404.91);
INSERT INTO public.round_player_damages VALUES (25794, 868, 295.07);
INSERT INTO public.round_player_damages VALUES (25795, 869, 434.0);
INSERT INTO public.round_player_damages VALUES (25795, 868, 143.53);
INSERT INTO public.round_player_damages VALUES (25796, 863, 6261.89);
INSERT INTO public.round_player_damages VALUES (25796, 859, 15.16);
INSERT INTO public.round_player_damages VALUES (25797, 893, 2393.21);
INSERT INTO public.round_player_damages VALUES (25797, 859, 7.31);
INSERT INTO public.round_player_damages VALUES (25797, 933, 4.76);
INSERT INTO public.round_player_damages VALUES (25798, 911, 6537.93);
INSERT INTO public.round_player_damages VALUES (25799, 925, 1853.52);
INSERT INTO public.round_player_damages VALUES (25799, 905, 550.17);
INSERT INTO public.round_player_damages VALUES (25799, 859, 284.9);
INSERT INTO public.round_player_damages VALUES (25800, 906, 1186.97);
INSERT INTO public.round_player_damages VALUES (25800, 859, 232.41);
INSERT INTO public.round_player_damages VALUES (25800, 898, 1140.56);
INSERT INTO public.round_player_damages VALUES (25800, 930, 625.16);
INSERT INTO public.round_player_damages VALUES (25801, 860, 882.29);
INSERT INTO public.round_player_damages VALUES (25801, 861, 1659.38);
INSERT INTO public.round_player_damages VALUES (25802, 859, 15.0);
INSERT INTO public.round_player_damages VALUES (25802, 882, 4486.6);
INSERT INTO public.round_player_damages VALUES (25802, 879, 22.26);
INSERT INTO public.round_player_damages VALUES (25802, 930, 211.99);
INSERT INTO public.round_player_damages VALUES (25803, 890, 7489.72);
INSERT INTO public.round_player_damages VALUES (25804, 863, 2834.43);
INSERT INTO public.round_player_damages VALUES (25804, 859, 10.37);
INSERT INTO public.round_player_damages VALUES (25805, 906, 136.94);
INSERT INTO public.round_player_damages VALUES (25805, 898, 659.25);
INSERT INTO public.round_player_damages VALUES (25805, 859, 11.4);
INSERT INTO public.round_player_damages VALUES (25806, 859, 15.0);
INSERT INTO public.round_player_damages VALUES (25806, 882, 5463.6);
INSERT INTO public.round_player_damages VALUES (25806, 879, 0.54);
INSERT INTO public.round_player_damages VALUES (25807, 861, 2602.05);
INSERT INTO public.round_player_damages VALUES (25807, 860, 1408.9);
INSERT INTO public.round_player_damages VALUES (25807, 859, 28.7);
INSERT INTO public.round_player_damages VALUES (25808, 905, 2980.04);
INSERT INTO public.round_player_damages VALUES (25808, 859, 77.2);
INSERT INTO public.round_player_damages VALUES (25809, 904, 443.74);
INSERT INTO public.round_player_damages VALUES (25809, 905, 203.14);
INSERT INTO public.round_player_damages VALUES (25809, 902, 388.44);
INSERT INTO public.round_player_damages VALUES (25809, 859, 7.06);
INSERT INTO public.round_player_damages VALUES (25810, 859, 18.27);
INSERT INTO public.round_player_damages VALUES (25810, 893, 556.95);
INSERT INTO public.round_player_damages VALUES (25811, 911, 3682.79);
INSERT INTO public.round_player_damages VALUES (25812, 863, 4685.83);
INSERT INTO public.round_player_damages VALUES (25812, 859, 141.46);
INSERT INTO public.round_player_damages VALUES (25813, 869, 774.33);
INSERT INTO public.round_player_damages VALUES (25813, 868, 459.7);
INSERT INTO public.round_player_damages VALUES (25813, 859, 102.48);
INSERT INTO public.round_player_damages VALUES (25814, 881, 695.07);
INSERT INTO public.round_player_damages VALUES (25814, 889, 228.0);
INSERT INTO public.round_player_damages VALUES (25814, 859, 14.09);
INSERT INTO public.round_player_damages VALUES (25815, 863, 2428.54);
INSERT INTO public.round_player_damages VALUES (25815, 859, 116.58);
INSERT INTO public.round_player_damages VALUES (25816, 869, 3675.65);
INSERT INTO public.round_player_damages VALUES (25816, 859, 340.7);
INSERT INTO public.round_player_damages VALUES (25817, 884, 5331.51);
INSERT INTO public.round_player_damages VALUES (25817, 859, 442.53);
INSERT INTO public.round_player_damages VALUES (25817, 891, 498.72);
INSERT INTO public.round_player_damages VALUES (25818, 934, 6845.32);
INSERT INTO public.round_player_damages VALUES (25818, 859, 78.52);
INSERT INTO public.round_player_damages VALUES (25819, 890, 12648.89);
INSERT INTO public.round_player_damages VALUES (25819, 859, 67.66);
INSERT INTO public.round_player_damages VALUES (25820, 859, 1220.68);
INSERT INTO public.round_player_damages VALUES (25821, 870, 138.33);
INSERT INTO public.round_player_damages VALUES (25822, 859, 15.0);
INSERT INTO public.round_player_damages VALUES (25822, 882, 3825.84);
INSERT INTO public.round_player_damages VALUES (25822, 879, 0.22);
INSERT INTO public.round_player_damages VALUES (25823, 861, 2125.08);
INSERT INTO public.round_player_damages VALUES (25823, 860, 1099.06);
INSERT INTO public.round_player_damages VALUES (25823, 877, 322.53);
INSERT INTO public.round_player_damages VALUES (25824, 895, 380.84);
INSERT INTO public.round_player_damages VALUES (25824, 868, 859.09);
INSERT INTO public.round_player_damages VALUES (25824, 896, 1140.27);
INSERT INTO public.round_player_damages VALUES (25824, 859, 202.37);
INSERT INTO public.round_player_damages VALUES (25824, 930, 286.88);
INSERT INTO public.round_player_damages VALUES (25825, 935, 9699.44);
INSERT INTO public.round_player_damages VALUES (25826, 911, 3974.76);
INSERT INTO public.round_player_damages VALUES (25826, 859, 16.2);
INSERT INTO public.round_player_damages VALUES (25827, 934, 1988.05);
INSERT INTO public.round_player_damages VALUES (25827, 859, 32.05);
INSERT INTO public.round_player_damages VALUES (25828, 892, 1130.14);
INSERT INTO public.round_player_damages VALUES (25830, 872, 612.41);
INSERT INTO public.round_player_damages VALUES (25830, 868, 973.25);
INSERT INTO public.round_player_damages VALUES (25830, 859, 34.2);
INSERT INTO public.round_player_damages VALUES (25831, 868, 172.43);
INSERT INTO public.round_player_damages VALUES (25831, 872, 239.94);
INSERT INTO public.round_player_damages VALUES (25832, 869, 1965.8);
INSERT INTO public.round_player_damages VALUES (25832, 868, 90.93);
INSERT INTO public.round_player_damages VALUES (25832, 859, 72.84);
INSERT INTO public.round_player_damages VALUES (25833, 892, 156.36);
INSERT INTO public.round_player_damages VALUES (25833, 859, 129.33);
INSERT INTO public.round_player_damages VALUES (25834, 885, 867.39);
INSERT INTO public.round_player_damages VALUES (25834, 859, 186.51);
INSERT INTO public.round_player_damages VALUES (25835, 890, 5091.29);
INSERT INTO public.round_player_damages VALUES (25835, 859, 821.64);
INSERT INTO public.round_player_damages VALUES (25835, 915, 187.06);
INSERT INTO public.round_player_damages VALUES (25836, 863, 1665.5);
INSERT INTO public.round_player_damages VALUES (25837, 898, 477.03);
INSERT INTO public.round_player_damages VALUES (25837, 859, 200.42);
INSERT INTO public.round_player_damages VALUES (25837, 906, 128.55);
INSERT INTO public.round_player_damages VALUES (25838, 859, 34.37);
INSERT INTO public.round_player_damages VALUES (25838, 882, 4121.88);
INSERT INTO public.round_player_damages VALUES (25838, 858, 612.98);
INSERT INTO public.round_player_damages VALUES (25838, 891, 470.72);
INSERT INTO public.round_player_damages VALUES (25838, 879, 0.39);
INSERT INTO public.round_player_damages VALUES (25838, 877, 241.38);
INSERT INTO public.round_player_damages VALUES (25839, 861, 2611.77);
INSERT INTO public.round_player_damages VALUES (25839, 860, 1215.57);
INSERT INTO public.round_player_damages VALUES (25839, 859, 13.1);
INSERT INTO public.round_player_damages VALUES (25840, 897, 3525.72);
INSERT INTO public.round_player_damages VALUES (25840, 859, 101.38);
INSERT INTO public.round_player_damages VALUES (25841, 870, 1589.22);
INSERT INTO public.round_player_damages VALUES (25842, 857, 820.75);
INSERT INTO public.round_player_damages VALUES (25842, 872, 1224.33);
INSERT INTO public.round_player_damages VALUES (25842, 908, 887.82);
INSERT INTO public.round_player_damages VALUES (25842, 859, 86.09);
INSERT INTO public.round_player_damages VALUES (25843, 911, 2244.64);
INSERT INTO public.round_player_damages VALUES (25844, 900, 131.73);
INSERT INTO public.round_player_damages VALUES (25844, 906, 578.45);
INSERT INTO public.round_player_damages VALUES (25844, 859, 262.17);
INSERT INTO public.round_player_damages VALUES (25845, 872, 132.02);
INSERT INTO public.round_player_damages VALUES (25845, 868, 420.03);
INSERT INTO public.round_player_damages VALUES (25845, 859, 12.76);
INSERT INTO public.round_player_damages VALUES (25846, 892, 1025.16);
INSERT INTO public.round_player_damages VALUES (25847, 896, 428.74);
INSERT INTO public.round_player_damages VALUES (25847, 895, 238.57);
INSERT INTO public.round_player_damages VALUES (25847, 868, 788.24);
INSERT INTO public.round_player_damages VALUES (25848, 898, 174.77);
INSERT INTO public.round_player_damages VALUES (25848, 859, 12.12);
INSERT INTO public.round_player_damages VALUES (25849, 935, 5844.35);
INSERT INTO public.round_player_damages VALUES (25849, 859, 19.76);
INSERT INTO public.round_player_damages VALUES (25850, 925, 3065.83);
INSERT INTO public.round_player_damages VALUES (25850, 859, 5.4);
INSERT INTO public.round_player_damages VALUES (25851, 936, 1000.99);
INSERT INTO public.round_player_damages VALUES (25851, 887, 1762.32);
INSERT INTO public.round_player_damages VALUES (25851, 857, 482.3);
INSERT INTO public.round_player_damages VALUES (25851, 859, 10.23);
INSERT INTO public.round_player_damages VALUES (25852, 925, 6456.49);
INSERT INTO public.round_player_damages VALUES (25852, 859, 908.24);
INSERT INTO public.round_player_damages VALUES (25853, 866, 705.24);
INSERT INTO public.round_player_damages VALUES (25853, 867, 460.89);
INSERT INTO public.round_player_damages VALUES (25854, 864, 2642.86);
INSERT INTO public.round_player_damages VALUES (25854, 859, 14.28);
INSERT INTO public.round_player_damages VALUES (25855, 866, 219.8);
INSERT INTO public.round_player_damages VALUES (25855, 867, 212.0);
INSERT INTO public.round_player_damages VALUES (25856, 864, 2145.92);
INSERT INTO public.round_player_damages VALUES (25856, 859, 102.6);
INSERT INTO public.round_player_damages VALUES (25856, 865, 944.9);
INSERT INTO public.round_player_damages VALUES (25857, 864, 49.52);
INSERT INTO public.round_player_damages VALUES (25857, 865, 321.3);
INSERT INTO public.round_player_damages VALUES (25857, 859, 42.84);
INSERT INTO public.round_player_damages VALUES (25857, 877, 2.27);
INSERT INTO public.round_player_damages VALUES (25858, 903, 774.17);
INSERT INTO public.round_player_damages VALUES (25858, 868, 197.94);
INSERT INTO public.round_player_damages VALUES (25859, 859, 20.07);
INSERT INTO public.round_player_damages VALUES (25860, 868, 1145.27);
INSERT INTO public.round_player_damages VALUES (25860, 872, 498.95);
INSERT INTO public.round_player_damages VALUES (25860, 877, 355.78);
INSERT INTO public.round_player_damages VALUES (25861, 890, 8714.58);
INSERT INTO public.round_player_damages VALUES (25861, 859, 150.7);
INSERT INTO public.round_player_damages VALUES (25862, 859, 75.25);
INSERT INTO public.round_player_damages VALUES (25862, 882, 7228.68);
INSERT INTO public.round_player_damages VALUES (25862, 879, 0.12);
INSERT INTO public.round_player_damages VALUES (25863, 861, 2303.24);
INSERT INTO public.round_player_damages VALUES (25863, 860, 2346.45);
INSERT INTO public.round_player_damages VALUES (25863, 859, 47.64);
INSERT INTO public.round_player_damages VALUES (25864, 863, 3192.85);
INSERT INTO public.round_player_damages VALUES (25864, 858, 303.29);
INSERT INTO public.round_player_damages VALUES (25865, 937, 3159.72);
INSERT INTO public.round_player_damages VALUES (25865, 859, 1293.77);
INSERT INTO public.round_player_damages VALUES (25866, 898, 2618.23);
INSERT INTO public.round_player_damages VALUES (25866, 906, 1110.22);
INSERT INTO public.round_player_damages VALUES (25866, 859, 417.47);
INSERT INTO public.round_player_damages VALUES (25866, 915, 75.84);
INSERT INTO public.round_player_damages VALUES (25866, 877, 1514.5);
INSERT INTO public.round_player_damages VALUES (25867, 890, 2918.9);
INSERT INTO public.round_player_damages VALUES (25868, 867, 9682.64);
INSERT INTO public.round_player_damages VALUES (25868, 859, 1368.31);
INSERT INTO public.round_player_damages VALUES (25869, 867, 13736.2);
INSERT INTO public.round_player_damages VALUES (25869, 859, 202.54);
INSERT INTO public.round_player_damages VALUES (25869, 930, 260.65);
INSERT INTO public.round_player_damages VALUES (25870, 872, 3029.26);
INSERT INTO public.round_player_damages VALUES (25870, 859, 358.9);
INSERT INTO public.round_player_damages VALUES (25871, 876, 2118.13);
INSERT INTO public.round_player_damages VALUES (25871, 860, 2509.48);
INSERT INTO public.round_player_damages VALUES (25871, 872, 613.89);
INSERT INTO public.round_player_damages VALUES (25871, 859, 97.46);
INSERT INTO public.round_player_damages VALUES (25871, 858, 398.53);
INSERT INTO public.round_player_damages VALUES (25872, 903, 738.53);
INSERT INTO public.round_player_damages VALUES (25872, 868, 634.42);
INSERT INTO public.round_player_damages VALUES (25873, 863, 2878.9);
INSERT INTO public.round_player_damages VALUES (25874, 926, 730.43);
INSERT INTO public.round_player_damages VALUES (25874, 859, 331.19);
INSERT INTO public.round_player_damages VALUES (25875, 863, 2454.26);
INSERT INTO public.round_player_damages VALUES (25875, 891, 344.42);
INSERT INTO public.round_player_damages VALUES (25875, 859, 18.09);
INSERT INTO public.round_player_damages VALUES (25876, 869, 378.18);
INSERT INTO public.round_player_damages VALUES (25876, 859, 1.92);
INSERT INTO public.round_player_damages VALUES (25877, 868, 767.37);
INSERT INTO public.round_player_damages VALUES (25877, 903, 34.19);
INSERT INTO public.round_player_damages VALUES (25878, 938, 4581.88);
INSERT INTO public.round_player_damages VALUES (25878, 859, 1.65);
INSERT INTO public.round_player_damages VALUES (25878, 888, 70.0);
INSERT INTO public.round_player_damages VALUES (25879, 868, 80.87);
INSERT INTO public.round_player_damages VALUES (25879, 926, 7.77);
INSERT INTO public.round_player_damages VALUES (25880, 884, 703.22);
INSERT INTO public.round_player_damages VALUES (25880, 859, 92.38);
INSERT INTO public.round_player_damages VALUES (25881, 939, 1844.86);
INSERT INTO public.round_player_damages VALUES (25882, 870, 3336.02);
INSERT INTO public.round_player_damages VALUES (25882, 859, 1.23);
INSERT INTO public.round_player_damages VALUES (25883, 890, 7566.5);
INSERT INTO public.round_player_damages VALUES (25883, 859, 183.01);
INSERT INTO public.round_player_damages VALUES (25884, 900, 228.8);
INSERT INTO public.round_player_damages VALUES (25884, 926, 621.71);
INSERT INTO public.round_player_damages VALUES (25884, 904, 209.29);
INSERT INTO public.round_player_damages VALUES (25884, 859, 110.74);
INSERT INTO public.round_player_damages VALUES (25885, 940, 4128.11);
INSERT INTO public.round_player_damages VALUES (25885, 875, 106.61);
INSERT INTO public.round_player_damages VALUES (25885, 859, 294.08);
INSERT INTO public.round_player_damages VALUES (25886, 863, 1699.02);
INSERT INTO public.round_player_damages VALUES (25886, 859, 121.24);
INSERT INTO public.round_player_damages VALUES (25887, 940, 1914.59);
INSERT INTO public.round_player_damages VALUES (25887, 859, 85.46);
INSERT INTO public.round_player_damages VALUES (25888, 868, 160.92);
INSERT INTO public.round_player_damages VALUES (25888, 900, 33.89);
INSERT INTO public.round_player_damages VALUES (25888, 921, 48.26);
INSERT INTO public.round_player_damages VALUES (25888, 941, 110.96);
INSERT INTO public.round_player_damages VALUES (25888, 859, 191.09);
INSERT INTO public.round_player_damages VALUES (25888, 942, 14.02);
INSERT INTO public.round_player_damages VALUES (25889, 895, 2164.63);
INSERT INTO public.round_player_damages VALUES (25889, 857, 1930.61);
INSERT INTO public.round_player_damages VALUES (25889, 859, 320.35);
INSERT INTO public.round_player_damages VALUES (25890, 922, 138.95);
INSERT INTO public.round_player_damages VALUES (25890, 859, 243.79);
INSERT INTO public.round_player_damages VALUES (25890, 943, 1124.88);
INSERT INTO public.round_player_damages VALUES (25890, 891, 991.26);
INSERT INTO public.round_player_damages VALUES (25890, 924, 132.05);
INSERT INTO public.round_player_damages VALUES (25890, 888, 67.78);
INSERT INTO public.round_player_damages VALUES (25891, 931, 6483.34);
INSERT INTO public.round_player_damages VALUES (25891, 859, 795.17);
INSERT INTO public.round_player_damages VALUES (25892, 863, 2799.11);
INSERT INTO public.round_player_damages VALUES (25892, 859, 3.69);
INSERT INTO public.round_player_damages VALUES (25893, 944, 1092.85);
INSERT INTO public.round_player_damages VALUES (25893, 859, 1289.02);
INSERT INTO public.round_player_damages VALUES (25893, 932, 689.82);
INSERT INTO public.round_player_damages VALUES (25894, 863, 1440.89);
INSERT INTO public.round_player_damages VALUES (25895, 859, 247.81);
INSERT INTO public.round_player_damages VALUES (25895, 929, 535.5);
INSERT INTO public.round_player_damages VALUES (25896, 901, 499.6);
INSERT INTO public.round_player_damages VALUES (25896, 945, 719.59);
INSERT INTO public.round_player_damages VALUES (25896, 859, 2.41);
INSERT INTO public.round_player_damages VALUES (25896, 878, 374.52);
INSERT INTO public.round_player_damages VALUES (25897, 861, 1374.49);
INSERT INTO public.round_player_damages VALUES (25897, 859, 1452.59);
INSERT INTO public.round_player_damages VALUES (25898, 859, 24.96);
INSERT INTO public.round_player_damages VALUES (25898, 937, 176.72);
INSERT INTO public.round_player_damages VALUES (25899, 890, 4428.21);
INSERT INTO public.round_player_damages VALUES (25899, 859, 155.88);
INSERT INTO public.round_player_damages VALUES (25900, 884, 1650.3);
INSERT INTO public.round_player_damages VALUES (25900, 930, 169.32);
INSERT INTO public.round_player_damages VALUES (25900, 859, 248.83);
INSERT INTO public.round_player_damages VALUES (25901, 900, 43.27);
INSERT INTO public.round_player_damages VALUES (25901, 868, 731.28);
INSERT INTO public.round_player_damages VALUES (25901, 921, 33.45);
INSERT INTO public.round_player_damages VALUES (25901, 941, 132.54);
INSERT INTO public.round_player_damages VALUES (25901, 942, 152.87);
INSERT INTO public.round_player_damages VALUES (25902, 862, 169.93);
INSERT INTO public.round_player_damages VALUES (25903, 868, 630.1);
INSERT INTO public.round_player_damages VALUES (25903, 869, 1218.56);
INSERT INTO public.round_player_damages VALUES (25904, 859, 1785.0);
INSERT INTO public.round_player_damages VALUES (25905, 937, 1170.28);
INSERT INTO public.round_player_damages VALUES (25905, 859, 90.73);
INSERT INTO public.round_player_damages VALUES (25906, 903, 668.25);
INSERT INTO public.round_player_damages VALUES (25906, 859, 83.39);
INSERT INTO public.round_player_damages VALUES (25907, 875, 1850.51);
INSERT INTO public.round_player_damages VALUES (25907, 909, 1535.85);
INSERT INTO public.round_player_damages VALUES (25908, 863, 2179.63);
INSERT INTO public.round_player_damages VALUES (25908, 859, 673.11);
INSERT INTO public.round_player_damages VALUES (25909, 883, 1964.92);
INSERT INTO public.round_player_damages VALUES (25909, 859, 128.9);
INSERT INTO public.round_player_damages VALUES (25909, 930, 822.74);
INSERT INTO public.round_player_damages VALUES (25910, 867, 2389.47);
INSERT INTO public.round_player_damages VALUES (25911, 937, 2455.11);
INSERT INTO public.round_player_damages VALUES (25911, 859, 379.42);
INSERT INTO public.round_player_damages VALUES (25912, 862, 166.18);
INSERT INTO public.round_player_damages VALUES (25913, 884, 6140.13);
INSERT INTO public.round_player_damages VALUES (25913, 859, 67.46);
INSERT INTO public.round_player_damages VALUES (25914, 885, 1692.22);
INSERT INTO public.round_player_damages VALUES (25914, 859, 241.0);
INSERT INTO public.round_player_damages VALUES (25915, 890, 10284.94);
INSERT INTO public.round_player_damages VALUES (25915, 859, 1018.2);
INSERT INTO public.round_player_damages VALUES (25915, 858, 2.71);
INSERT INTO public.round_player_damages VALUES (25916, 932, 3733.51);
INSERT INTO public.round_player_damages VALUES (25916, 859, 43.32);
INSERT INTO public.round_player_damages VALUES (25916, 930, 404.67);
INSERT INTO public.round_player_damages VALUES (25917, 901, 3361.53);
INSERT INTO public.round_player_damages VALUES (25917, 859, 434.35);
INSERT INTO public.round_player_damages VALUES (25918, 943, 294.89);
INSERT INTO public.round_player_damages VALUES (25918, 859, 128.59);
INSERT INTO public.round_player_damages VALUES (25918, 888, 24.08);
INSERT INTO public.round_player_damages VALUES (25918, 922, 252.83);
INSERT INTO public.round_player_damages VALUES (25919, 903, 1521.65);
INSERT INTO public.round_player_damages VALUES (25919, 859, 125.49);
INSERT INTO public.round_player_damages VALUES (25920, 926, 1224.8);
INSERT INTO public.round_player_damages VALUES (25920, 859, 188.83);
INSERT INTO public.round_player_damages VALUES (25921, 866, 364.22);
INSERT INTO public.round_player_damages VALUES (25922, 859, 66.44);
INSERT INTO public.round_player_damages VALUES (25922, 926, 184.34);
INSERT INTO public.round_player_damages VALUES (25923, 859, 1329.2);
INSERT INTO public.round_player_damages VALUES (25923, 929, 1276.66);
INSERT INTO public.round_player_damages VALUES (25924, 859, 124.78);
INSERT INTO public.round_player_damages VALUES (25924, 903, 180.33);
INSERT INTO public.round_player_damages VALUES (25924, 930, 860.84);
INSERT INTO public.round_player_damages VALUES (25924, 868, 1200.83);
INSERT INTO public.round_player_damages VALUES (25924, 877, 259.52);
INSERT INTO public.round_player_damages VALUES (25925, 859, 362.85);
INSERT INTO public.round_player_damages VALUES (25925, 926, 70.9);
INSERT INTO public.round_player_damages VALUES (25926, 887, 2475.85);
INSERT INTO public.round_player_damages VALUES (25926, 859, 31.38);
INSERT INTO public.round_player_damages VALUES (25927, 940, 2533.55);
INSERT INTO public.round_player_damages VALUES (25928, 911, 1855.87);
INSERT INTO public.round_player_damages VALUES (25929, 932, 4323.36);
INSERT INTO public.round_player_damages VALUES (25929, 859, 173.68);
INSERT INTO public.round_player_damages VALUES (25930, 946, 2241.83);
INSERT INTO public.round_player_damages VALUES (25930, 859, 21.04);
INSERT INTO public.round_player_damages VALUES (25931, 922, 4504.2);
INSERT INTO public.round_player_damages VALUES (25931, 859, 1218.05);
INSERT INTO public.round_player_damages VALUES (25932, 947, 4815.46);
INSERT INTO public.round_player_damages VALUES (25932, 859, 212.67);
INSERT INTO public.round_player_damages VALUES (25933, 870, 5403.59);
INSERT INTO public.round_player_damages VALUES (25933, 859, 74.56);
INSERT INTO public.round_player_damages VALUES (25934, 870, 2692.19);
INSERT INTO public.round_player_damages VALUES (25934, 859, 264.32);
INSERT INTO public.round_player_damages VALUES (25935, 867, 1063.72);
INSERT INTO public.round_player_damages VALUES (25935, 859, 33.37);
INSERT INTO public.round_player_damages VALUES (25936, 863, 570.61);
INSERT INTO public.round_player_damages VALUES (25937, 864, 557.89);
INSERT INTO public.round_player_damages VALUES (25937, 859, 238.52);
INSERT INTO public.round_player_damages VALUES (25937, 865, 1533.74);
INSERT INTO public.round_player_damages VALUES (25938, 926, 345.75);
INSERT INTO public.round_player_damages VALUES (25938, 859, 2.9);
INSERT INTO public.round_player_damages VALUES (25939, 863, 2988.64);
INSERT INTO public.round_player_damages VALUES (25939, 859, 160.88);
INSERT INTO public.round_player_damages VALUES (25940, 865, 285.27);
INSERT INTO public.round_player_damages VALUES (25940, 864, 1128.35);
INSERT INTO public.round_player_damages VALUES (25940, 891, 650.41);
INSERT INTO public.round_player_damages VALUES (25940, 859, 88.51);
INSERT INTO public.round_player_damages VALUES (25941, 859, 13.69);
INSERT INTO public.round_player_damages VALUES (25942, 932, 7258.32);
INSERT INTO public.round_player_damages VALUES (25942, 859, 206.79);
INSERT INTO public.round_player_damages VALUES (25942, 858, 68.13);
INSERT INTO public.round_player_damages VALUES (25943, 890, 7792.61);
INSERT INTO public.round_player_damages VALUES (25943, 859, 423.76);
INSERT INTO public.round_player_damages VALUES (25944, 872, 1257.24);
INSERT INTO public.round_player_damages VALUES (25944, 860, 1693.97);
INSERT INTO public.round_player_damages VALUES (25944, 876, 3751.55);
INSERT INTO public.round_player_damages VALUES (25944, 859, 138.35);
INSERT INTO public.round_player_damages VALUES (25944, 930, 657.92);
INSERT INTO public.round_player_damages VALUES (25945, 880, 7734.53);
INSERT INTO public.round_player_damages VALUES (25945, 859, 315.17);
INSERT INTO public.round_player_damages VALUES (25946, 901, 1521.95);
INSERT INTO public.round_player_damages VALUES (25946, 945, 2820.0);
INSERT INTO public.round_player_damages VALUES (25946, 859, 227.15);
INSERT INTO public.round_player_damages VALUES (25947, 859, 48.08);
INSERT INTO public.round_player_damages VALUES (25947, 868, 80.6);
INSERT INTO public.round_player_damages VALUES (25948, 931, 1605.74);
INSERT INTO public.round_player_damages VALUES (25948, 859, 563.86);
INSERT INTO public.round_player_damages VALUES (25949, 948, 8660.01);
INSERT INTO public.round_player_damages VALUES (25949, 859, 448.29);
INSERT INTO public.round_player_damages VALUES (25950, 949, 1024.02);
INSERT INTO public.round_player_damages VALUES (25950, 859, 136.74);
INSERT INTO public.round_player_damages VALUES (25950, 879, 0.5);
INSERT INTO public.round_player_damages VALUES (25950, 874, 648.21);
INSERT INTO public.round_player_damages VALUES (25951, 949, 3213.73);
INSERT INTO public.round_player_damages VALUES (25951, 858, 155.0);
INSERT INTO public.round_player_damages VALUES (25951, 859, 555.86);
INSERT INTO public.round_player_damages VALUES (25952, 900, 253.72);
INSERT INTO public.round_player_damages VALUES (25952, 868, 1733.28);
INSERT INTO public.round_player_damages VALUES (25952, 859, 73.05);
INSERT INTO public.round_player_damages VALUES (25952, 921, 561.92);
INSERT INTO public.round_player_damages VALUES (25952, 941, 394.83);
INSERT INTO public.round_player_damages VALUES (25952, 942, 373.71);
INSERT INTO public.round_player_damages VALUES (25953, 881, 1122.21);
INSERT INTO public.round_player_damages VALUES (25953, 889, 927.92);
INSERT INTO public.round_player_damages VALUES (25953, 859, 64.54);
INSERT INTO public.round_player_damages VALUES (25954, 859, 287.46);
INSERT INTO public.round_player_damages VALUES (25954, 929, 380.68);
INSERT INTO public.round_player_damages VALUES (25955, 866, 1362.22);
INSERT INTO public.round_player_damages VALUES (25955, 859, 32.43);
INSERT INTO public.round_player_damages VALUES (25955, 867, 18.34);
INSERT INTO public.round_player_damages VALUES (25956, 892, 1262.63);
INSERT INTO public.round_player_damages VALUES (25956, 859, 715.06);
INSERT INTO public.round_player_damages VALUES (25958, 862, 725.55);
INSERT INTO public.round_player_damages VALUES (25959, 950, 8729.02);
INSERT INTO public.round_player_damages VALUES (25959, 859, 61.88);
INSERT INTO public.round_player_damages VALUES (25960, 890, 10865.04);
INSERT INTO public.round_player_damages VALUES (25960, 877, 346.92);
INSERT INTO public.round_player_damages VALUES (25960, 859, 342.84);
INSERT INTO public.round_player_damages VALUES (25960, 933, 325.41);
INSERT INTO public.round_player_damages VALUES (25961, 926, 956.4);
INSERT INTO public.round_player_damages VALUES (25961, 868, 2794.62);
INSERT INTO public.round_player_damages VALUES (25961, 859, 8.25);
INSERT INTO public.round_player_damages VALUES (25962, 931, 1213.6);
INSERT INTO public.round_player_damages VALUES (25962, 859, 233.6);
INSERT INTO public.round_player_damages VALUES (25963, 890, 9575.56);
INSERT INTO public.round_player_damages VALUES (25963, 878, 223.29);
INSERT INTO public.round_player_damages VALUES (25963, 859, 1233.21);
INSERT INTO public.round_player_damages VALUES (25963, 930, 99.38);
INSERT INTO public.round_player_damages VALUES (25964, 923, 714.44);
INSERT INTO public.round_player_damages VALUES (25964, 884, 429.03);
INSERT INTO public.round_player_damages VALUES (25964, 859, 10.25);
INSERT INTO public.round_player_damages VALUES (25964, 875, 11.97);
INSERT INTO public.round_player_damages VALUES (25965, 867, 2065.95);
INSERT INTO public.round_player_damages VALUES (25965, 859, 186.77);
INSERT INTO public.round_player_damages VALUES (25966, 895, 1436.94);
INSERT INTO public.round_player_damages VALUES (25966, 859, 344.21);
INSERT INTO public.round_player_damages VALUES (25968, 906, 2971.58);
INSERT INTO public.round_player_damages VALUES (25968, 859, 1019.1);
INSERT INTO public.round_player_damages VALUES (25969, 950, 2651.96);
INSERT INTO public.round_player_damages VALUES (25969, 859, 17.37);
INSERT INTO public.round_player_damages VALUES (25969, 858, 1206.97);
INSERT INTO public.round_player_damages VALUES (25969, 891, 2562.66);
INSERT INTO public.round_player_damages VALUES (25970, 894, 307.28);
INSERT INTO public.round_player_damages VALUES (25970, 868, 456.34);
INSERT INTO public.round_player_damages VALUES (25971, 951, 1361.1);
INSERT INTO public.round_player_damages VALUES (25971, 859, 289.83);
INSERT INTO public.round_player_damages VALUES (25972, 949, 2690.83);
INSERT INTO public.round_player_damages VALUES (25972, 859, 948.87);
INSERT INTO public.round_player_damages VALUES (25972, 923, 1.85);
INSERT INTO public.round_player_damages VALUES (25973, 881, 210.85);
INSERT INTO public.round_player_damages VALUES (25973, 912, 88.16);
INSERT INTO public.round_player_damages VALUES (25973, 910, 95.91);
INSERT INTO public.round_player_damages VALUES (25973, 859, 864.32);
INSERT INTO public.round_player_damages VALUES (25974, 874, 1065.74);
INSERT INTO public.round_player_damages VALUES (25974, 885, 1282.25);
INSERT INTO public.round_player_damages VALUES (25974, 859, 2.79);
INSERT INTO public.round_player_damages VALUES (25975, 887, 1268.53);
INSERT INTO public.round_player_damages VALUES (25975, 859, 1.28);
INSERT INTO public.round_player_damages VALUES (25976, 925, 1015.58);
INSERT INTO public.round_player_damages VALUES (25976, 895, 1603.19);
INSERT INTO public.round_player_damages VALUES (25976, 859, 363.53);
INSERT INTO public.round_player_damages VALUES (25977, 881, 240.0);
INSERT INTO public.round_player_damages VALUES (25977, 889, 270.0);
INSERT INTO public.round_player_damages VALUES (25977, 859, 104.58);
INSERT INTO public.round_player_damages VALUES (25978, 859, 2927.23);
INSERT INTO public.round_player_damages VALUES (25979, 890, 4861.63);
INSERT INTO public.round_player_damages VALUES (25979, 859, 501.37);
INSERT INTO public.round_player_damages VALUES (25979, 858, 25.22);
INSERT INTO public.round_player_damages VALUES (25980, 868, 422.78);
INSERT INTO public.round_player_damages VALUES (25980, 894, 27.88);
INSERT INTO public.round_player_damages VALUES (25981, 922, 3552.98);
INSERT INTO public.round_player_damages VALUES (25981, 952, 3385.84);
INSERT INTO public.round_player_damages VALUES (25982, 885, 630.86);
INSERT INTO public.round_player_damages VALUES (25982, 859, 290.35);
INSERT INTO public.round_player_damages VALUES (25982, 874, 687.48);
INSERT INTO public.round_player_damages VALUES (25983, 859, 2854.08);
INSERT INTO public.round_player_damages VALUES (25984, 950, 5683.11);
INSERT INTO public.round_player_damages VALUES (25984, 859, 793.05);
INSERT INTO public.round_player_damages VALUES (25985, 903, 500.53);
INSERT INTO public.round_player_damages VALUES (25985, 868, 316.18);
INSERT INTO public.round_player_damages VALUES (25985, 859, 194.58);
INSERT INTO public.round_player_damages VALUES (25986, 869, 550.05);
INSERT INTO public.round_player_damages VALUES (25986, 868, 91.9);
INSERT INTO public.round_player_damages VALUES (25986, 859, 102.52);
INSERT INTO public.round_player_damages VALUES (25987, 892, 1597.56);
INSERT INTO public.round_player_damages VALUES (25988, 892, 2219.69);
INSERT INTO public.round_player_damages VALUES (25988, 859, 476.48);
INSERT INTO public.round_player_damages VALUES (25989, 937, 2142.19);
INSERT INTO public.round_player_damages VALUES (25990, 871, 3986.96);
INSERT INTO public.round_player_damages VALUES (25990, 859, 23.11);
INSERT INTO public.round_player_damages VALUES (25991, 903, 2121.25);
INSERT INTO public.round_player_damages VALUES (25992, 884, 1989.16);
INSERT INTO public.round_player_damages VALUES (25992, 859, 31.22);
INSERT INTO public.round_player_damages VALUES (25993, 873, 8048.15);
INSERT INTO public.round_player_damages VALUES (25993, 859, 115.3);
INSERT INTO public.round_player_damages VALUES (25994, 918, 3398.68);
INSERT INTO public.round_player_damages VALUES (25994, 859, 267.96);
INSERT INTO public.round_player_damages VALUES (25995, 890, 4401.85);
INSERT INTO public.round_player_damages VALUES (25995, 859, 358.79);
INSERT INTO public.round_player_damages VALUES (25996, 903, 2234.91);
INSERT INTO public.round_player_damages VALUES (25996, 943, 690.74);
INSERT INTO public.round_player_damages VALUES (25996, 859, 51.09);
INSERT INTO public.round_player_damages VALUES (25997, 932, 1861.03);
INSERT INTO public.round_player_damages VALUES (25997, 859, 92.67);
INSERT INTO public.round_player_damages VALUES (25998, 859, 101.78);
INSERT INTO public.round_player_damages VALUES (25999, 903, 322.56);
INSERT INTO public.round_player_damages VALUES (25999, 943, 21.1);
INSERT INTO public.round_player_damages VALUES (25999, 859, 74.82);
INSERT INTO public.round_player_damages VALUES (26000, 887, 1511.93);
INSERT INTO public.round_player_damages VALUES (26001, 870, 1903.78);
INSERT INTO public.round_player_damages VALUES (26001, 859, 6.62);
INSERT INTO public.round_player_damages VALUES (26002, 889, 63.0);
INSERT INTO public.round_player_damages VALUES (26003, 873, 2591.14);
INSERT INTO public.round_player_damages VALUES (26003, 859, 66.21);
INSERT INTO public.round_player_damages VALUES (26004, 872, 2123.57);
INSERT INTO public.round_player_damages VALUES (26005, 927, 3185.2);
INSERT INTO public.round_player_damages VALUES (26006, 880, 169.68);
INSERT INTO public.round_player_damages VALUES (26006, 859, 3.31);
INSERT INTO public.round_player_damages VALUES (26007, 950, 1999.02);
INSERT INTO public.round_player_damages VALUES (26007, 859, 27.5);
INSERT INTO public.round_player_damages VALUES (26008, 913, 1106.68);
INSERT INTO public.round_player_damages VALUES (26009, 948, 6807.35);
INSERT INTO public.round_player_damages VALUES (26009, 859, 19.94);
INSERT INTO public.round_player_damages VALUES (26010, 929, 6226.28);
INSERT INTO public.round_player_damages VALUES (26010, 859, 123.31);
INSERT INTO public.round_player_damages VALUES (26011, 890, 8450.79);
INSERT INTO public.round_player_damages VALUES (26011, 859, 810.61);
INSERT INTO public.round_player_damages VALUES (26012, 925, 1651.34);
INSERT INTO public.round_player_damages VALUES (26012, 859, 165.43);
INSERT INTO public.round_player_damages VALUES (26013, 893, 1886.94);
INSERT INTO public.round_player_damages VALUES (26013, 859, 562.26);
INSERT INTO public.round_player_damages VALUES (26014, 901, 634.37);
INSERT INTO public.round_player_damages VALUES (26014, 876, 1370.67);
INSERT INTO public.round_player_damages VALUES (26014, 953, 284.25);
INSERT INTO public.round_player_damages VALUES (26014, 933, 195.14);
INSERT INTO public.round_player_damages VALUES (26014, 859, 92.89);
INSERT INTO public.round_player_damages VALUES (26015, 903, 3867.6);
INSERT INTO public.round_player_damages VALUES (26015, 859, 44.66);
INSERT INTO public.round_player_damages VALUES (26016, 946, 2163.2);
INSERT INTO public.round_player_damages VALUES (26016, 920, 1513.54);
INSERT INTO public.round_player_damages VALUES (26016, 859, 132.15);
INSERT INTO public.round_player_damages VALUES (26017, 867, 3724.68);
INSERT INTO public.round_player_damages VALUES (26017, 859, 27.05);
INSERT INTO public.round_player_damages VALUES (26018, 921, 219.83);
INSERT INTO public.round_player_damages VALUES (26018, 932, 1281.29);
INSERT INTO public.round_player_damages VALUES (26018, 859, 47.09);
INSERT INTO public.round_player_damages VALUES (26019, 893, 4390.11);
INSERT INTO public.round_player_damages VALUES (26019, 859, 253.81);
INSERT INTO public.round_player_damages VALUES (26019, 933, 1.23);
INSERT INTO public.round_player_damages VALUES (26020, 922, 3785.16);
INSERT INTO public.round_player_damages VALUES (26020, 859, 18.21);
INSERT INTO public.round_player_damages VALUES (26021, 870, 2894.42);
INSERT INTO public.round_player_damages VALUES (26022, 900, 53.13);
INSERT INTO public.round_player_damages VALUES (26022, 859, 287.02);
INSERT INTO public.round_player_damages VALUES (26022, 871, 963.82);
INSERT INTO public.round_player_damages VALUES (26023, 925, 5857.8);
INSERT INTO public.round_player_damages VALUES (26023, 905, 700.79);
INSERT INTO public.round_player_damages VALUES (26023, 859, 392.58);
INSERT INTO public.round_player_damages VALUES (26024, 884, 4524.99);
INSERT INTO public.round_player_damages VALUES (26024, 859, 188.58);
INSERT INTO public.round_player_damages VALUES (26025, 884, 2871.31);
INSERT INTO public.round_player_damages VALUES (26025, 859, 88.74);
INSERT INTO public.round_player_damages VALUES (26025, 954, 297.76);
INSERT INTO public.round_player_damages VALUES (26026, 862, 656.26);
INSERT INTO public.round_player_damages VALUES (26026, 868, 72.83);
INSERT INTO public.round_player_damages VALUES (26026, 904, 26.72);


--
-- Data for Name: round_player_medals; Type: TABLE DATA; Schema: public; Owner: dev
--

INSERT INTO public.round_player_medals VALUES (25627, 546, 6);
INSERT INTO public.round_player_medals VALUES (25627, 547, 1);
INSERT INTO public.round_player_medals VALUES (25627, 548, 4);
INSERT INTO public.round_player_medals VALUES (25627, 549, 3);
INSERT INTO public.round_player_medals VALUES (25627, 550, 5);
INSERT INTO public.round_player_medals VALUES (25627, 551, 1);
INSERT INTO public.round_player_medals VALUES (25627, 552, 8);
INSERT INTO public.round_player_medals VALUES (25627, 553, 2);
INSERT INTO public.round_player_medals VALUES (25627, 554, 4);
INSERT INTO public.round_player_medals VALUES (25627, 555, 3);
INSERT INTO public.round_player_medals VALUES (25627, 556, 1);
INSERT INTO public.round_player_medals VALUES (25627, 557, 1);
INSERT INTO public.round_player_medals VALUES (25627, 558, 1);
INSERT INTO public.round_player_medals VALUES (25628, 555, 3);
INSERT INTO public.round_player_medals VALUES (25628, 559, 2);
INSERT INTO public.round_player_medals VALUES (25628, 547, 3);
INSERT INTO public.round_player_medals VALUES (25628, 553, 4);
INSERT INTO public.round_player_medals VALUES (25628, 550, 2);
INSERT INTO public.round_player_medals VALUES (25628, 554, 5);
INSERT INTO public.round_player_medals VALUES (25628, 560, 8);
INSERT INTO public.round_player_medals VALUES (25628, 561, 8);
INSERT INTO public.round_player_medals VALUES (25628, 549, 6);
INSERT INTO public.round_player_medals VALUES (25628, 546, 2);
INSERT INTO public.round_player_medals VALUES (25628, 556, 2);
INSERT INTO public.round_player_medals VALUES (25628, 562, 1);
INSERT INTO public.round_player_medals VALUES (25628, 557, 1);
INSERT INTO public.round_player_medals VALUES (25629, 559, 1);
INSERT INTO public.round_player_medals VALUES (25629, 550, 1);
INSERT INTO public.round_player_medals VALUES (25629, 554, 3);
INSERT INTO public.round_player_medals VALUES (25629, 563, 2);
INSERT INTO public.round_player_medals VALUES (25629, 555, 1);
INSERT INTO public.round_player_medals VALUES (25631, 549, 9);
INSERT INTO public.round_player_medals VALUES (25631, 554, 4);
INSERT INTO public.round_player_medals VALUES (25631, 564, 4);
INSERT INTO public.round_player_medals VALUES (25631, 546, 1);
INSERT INTO public.round_player_medals VALUES (25631, 547, 1);
INSERT INTO public.round_player_medals VALUES (25631, 565, 1);
INSERT INTO public.round_player_medals VALUES (25631, 557, 1);
INSERT INTO public.round_player_medals VALUES (25632, 553, 6);
INSERT INTO public.round_player_medals VALUES (25632, 546, 6);
INSERT INTO public.round_player_medals VALUES (25632, 550, 3);
INSERT INTO public.round_player_medals VALUES (25632, 547, 2);
INSERT INTO public.round_player_medals VALUES (25632, 554, 1);
INSERT INTO public.round_player_medals VALUES (25632, 564, 1);
INSERT INTO public.round_player_medals VALUES (25633, 554, 1);
INSERT INTO public.round_player_medals VALUES (25633, 565, 1);
INSERT INTO public.round_player_medals VALUES (25633, 549, 7);
INSERT INTO public.round_player_medals VALUES (25633, 557, 1);
INSERT INTO public.round_player_medals VALUES (25633, 566, 1);
INSERT INTO public.round_player_medals VALUES (25635, 549, 2);
INSERT INTO public.round_player_medals VALUES (25635, 553, 1);
INSERT INTO public.round_player_medals VALUES (25635, 546, 2);
INSERT INTO public.round_player_medals VALUES (25635, 567, 2);
INSERT INTO public.round_player_medals VALUES (25635, 555, 1);
INSERT INTO public.round_player_medals VALUES (25635, 554, 3);
INSERT INTO public.round_player_medals VALUES (25635, 568, 3);
INSERT INTO public.round_player_medals VALUES (25635, 557, 1);
INSERT INTO public.round_player_medals VALUES (25637, 553, 3);
INSERT INTO public.round_player_medals VALUES (25637, 554, 4);
INSERT INTO public.round_player_medals VALUES (25637, 569, 4);
INSERT INTO public.round_player_medals VALUES (25637, 547, 8);
INSERT INTO public.round_player_medals VALUES (25637, 546, 3);
INSERT INTO public.round_player_medals VALUES (25637, 557, 1);
INSERT INTO public.round_player_medals VALUES (25637, 566, 1);
INSERT INTO public.round_player_medals VALUES (25638, 553, 3);
INSERT INTO public.round_player_medals VALUES (25638, 570, 1);
INSERT INTO public.round_player_medals VALUES (25638, 571, 1);
INSERT INTO public.round_player_medals VALUES (25639, 547, 1);
INSERT INTO public.round_player_medals VALUES (25639, 550, 1);
INSERT INTO public.round_player_medals VALUES (25639, 546, 2);
INSERT INTO public.round_player_medals VALUES (25639, 553, 2);
INSERT INTO public.round_player_medals VALUES (25639, 554, 1);
INSERT INTO public.round_player_medals VALUES (25639, 561, 1);
INSERT INTO public.round_player_medals VALUES (25639, 552, 1);
INSERT INTO public.round_player_medals VALUES (25639, 572, 1);
INSERT INTO public.round_player_medals VALUES (25640, 550, 1);
INSERT INTO public.round_player_medals VALUES (25640, 553, 3);
INSERT INTO public.round_player_medals VALUES (25640, 547, 1);
INSERT INTO public.round_player_medals VALUES (25640, 546, 1);
INSERT INTO public.round_player_medals VALUES (25641, 547, 6);
INSERT INTO public.round_player_medals VALUES (25641, 553, 3);
INSERT INTO public.round_player_medals VALUES (25641, 554, 5);
INSERT INTO public.round_player_medals VALUES (25641, 561, 6);
INSERT INTO public.round_player_medals VALUES (25641, 549, 3);
INSERT INTO public.round_player_medals VALUES (25641, 546, 2);
INSERT INTO public.round_player_medals VALUES (25641, 555, 1);
INSERT INTO public.round_player_medals VALUES (25641, 557, 1);
INSERT INTO public.round_player_medals VALUES (25642, 553, 1);
INSERT INTO public.round_player_medals VALUES (25642, 554, 1);
INSERT INTO public.round_player_medals VALUES (25642, 556, 1);
INSERT INTO public.round_player_medals VALUES (25642, 546, 3);
INSERT INTO public.round_player_medals VALUES (25643, 554, 4);
INSERT INTO public.round_player_medals VALUES (25643, 573, 5);
INSERT INTO public.round_player_medals VALUES (25643, 550, 3);
INSERT INTO public.round_player_medals VALUES (25643, 553, 1);
INSERT INTO public.round_player_medals VALUES (25643, 562, 1);
INSERT INTO public.round_player_medals VALUES (25643, 574, 1);
INSERT INTO public.round_player_medals VALUES (25644, 547, 3);
INSERT INTO public.round_player_medals VALUES (25644, 550, 1);
INSERT INTO public.round_player_medals VALUES (25644, 554, 1);
INSERT INTO public.round_player_medals VALUES (25644, 575, 1);
INSERT INTO public.round_player_medals VALUES (25645, 555, 1);
INSERT INTO public.round_player_medals VALUES (25645, 553, 2);
INSERT INTO public.round_player_medals VALUES (25645, 576, 1);
INSERT INTO public.round_player_medals VALUES (25645, 574, 1);
INSERT INTO public.round_player_medals VALUES (25646, 551, 1);
INSERT INTO public.round_player_medals VALUES (25646, 561, 1);
INSERT INTO public.round_player_medals VALUES (25646, 568, 1);
INSERT INTO public.round_player_medals VALUES (25646, 553, 1);
INSERT INTO public.round_player_medals VALUES (25647, 553, 5);
INSERT INTO public.round_player_medals VALUES (25647, 561, 5);
INSERT INTO public.round_player_medals VALUES (25647, 562, 2);
INSERT INTO public.round_player_medals VALUES (25647, 577, 3);
INSERT INTO public.round_player_medals VALUES (25647, 578, 7);
INSERT INTO public.round_player_medals VALUES (25647, 555, 1);
INSERT INTO public.round_player_medals VALUES (25647, 554, 3);
INSERT INTO public.round_player_medals VALUES (25647, 550, 2);
INSERT INTO public.round_player_medals VALUES (25647, 546, 3);
INSERT INTO public.round_player_medals VALUES (25647, 574, 1);
INSERT INTO public.round_player_medals VALUES (25648, 554, 1);
INSERT INTO public.round_player_medals VALUES (25648, 570, 1);
INSERT INTO public.round_player_medals VALUES (25648, 553, 2);
INSERT INTO public.round_player_medals VALUES (25648, 550, 1);
INSERT INTO public.round_player_medals VALUES (25648, 555, 1);
INSERT INTO public.round_player_medals VALUES (25648, 547, 1);
INSERT INTO public.round_player_medals VALUES (25649, 578, 1);
INSERT INTO public.round_player_medals VALUES (25649, 553, 4);
INSERT INTO public.round_player_medals VALUES (25649, 548, 1);
INSERT INTO public.round_player_medals VALUES (25649, 555, 1);
INSERT INTO public.round_player_medals VALUES (25649, 554, 3);
INSERT INTO public.round_player_medals VALUES (25649, 579, 3);
INSERT INTO public.round_player_medals VALUES (25649, 573, 2);
INSERT INTO public.round_player_medals VALUES (25650, 553, 1);
INSERT INTO public.round_player_medals VALUES (25650, 554, 1);
INSERT INTO public.round_player_medals VALUES (25650, 562, 1);
INSERT INTO public.round_player_medals VALUES (25650, 580, 1);
INSERT INTO public.round_player_medals VALUES (25651, 555, 2);
INSERT INTO public.round_player_medals VALUES (25651, 554, 1);
INSERT INTO public.round_player_medals VALUES (25651, 563, 1);
INSERT INTO public.round_player_medals VALUES (25651, 548, 2);
INSERT INTO public.round_player_medals VALUES (25651, 547, 1);
INSERT INTO public.round_player_medals VALUES (25651, 549, 3);
INSERT INTO public.round_player_medals VALUES (25652, 554, 1);
INSERT INTO public.round_player_medals VALUES (25652, 562, 1);
INSERT INTO public.round_player_medals VALUES (25652, 581, 1);
INSERT INTO public.round_player_medals VALUES (25652, 574, 1);
INSERT INTO public.round_player_medals VALUES (25653, 546, 4);
INSERT INTO public.round_player_medals VALUES (25653, 554, 5);
INSERT INTO public.round_player_medals VALUES (25653, 552, 7);
INSERT INTO public.round_player_medals VALUES (25653, 553, 4);
INSERT INTO public.round_player_medals VALUES (25653, 550, 1);
INSERT INTO public.round_player_medals VALUES (25653, 547, 2);
INSERT INTO public.round_player_medals VALUES (25653, 556, 1);
INSERT INTO public.round_player_medals VALUES (25653, 574, 1);
INSERT INTO public.round_player_medals VALUES (25654, 553, 2);
INSERT INTO public.round_player_medals VALUES (25654, 554, 1);
INSERT INTO public.round_player_medals VALUES (25654, 582, 1);
INSERT INTO public.round_player_medals VALUES (25654, 547, 1);
INSERT INTO public.round_player_medals VALUES (25654, 583, 1);
INSERT INTO public.round_player_medals VALUES (25655, 550, 2);
INSERT INTO public.round_player_medals VALUES (25655, 554, 4);
INSERT INTO public.round_player_medals VALUES (25655, 573, 5);
INSERT INTO public.round_player_medals VALUES (25655, 562, 3);
INSERT INTO public.round_player_medals VALUES (25655, 546, 1);
INSERT INTO public.round_player_medals VALUES (25655, 553, 1);
INSERT INTO public.round_player_medals VALUES (25655, 574, 1);
INSERT INTO public.round_player_medals VALUES (25655, 558, 1);
INSERT INTO public.round_player_medals VALUES (25657, 550, 1);
INSERT INTO public.round_player_medals VALUES (25657, 559, 1);
INSERT INTO public.round_player_medals VALUES (25658, 546, 2);
INSERT INTO public.round_player_medals VALUES (25658, 559, 1);
INSERT INTO public.round_player_medals VALUES (25658, 584, 1);
INSERT INTO public.round_player_medals VALUES (25659, 547, 4);
INSERT INTO public.round_player_medals VALUES (25659, 554, 5);
INSERT INTO public.round_player_medals VALUES (25659, 585, 1);
INSERT INTO public.round_player_medals VALUES (25659, 586, 5);
INSERT INTO public.round_player_medals VALUES (25659, 553, 3);
INSERT INTO public.round_player_medals VALUES (25659, 550, 3);
INSERT INTO public.round_player_medals VALUES (25659, 556, 1);
INSERT INTO public.round_player_medals VALUES (25659, 587, 1);
INSERT INTO public.round_player_medals VALUES (25659, 557, 1);
INSERT INTO public.round_player_medals VALUES (25660, 554, 2);
INSERT INTO public.round_player_medals VALUES (25660, 568, 2);
INSERT INTO public.round_player_medals VALUES (25660, 559, 2);
INSERT INTO public.round_player_medals VALUES (25660, 553, 1);
INSERT INTO public.round_player_medals VALUES (25661, 554, 2);
INSERT INTO public.round_player_medals VALUES (25661, 563, 1);
INSERT INTO public.round_player_medals VALUES (25663, 547, 4);
INSERT INTO public.round_player_medals VALUES (25663, 550, 4);
INSERT INTO public.round_player_medals VALUES (25663, 553, 5);
INSERT INTO public.round_player_medals VALUES (25663, 554, 1);
INSERT INTO public.round_player_medals VALUES (25663, 588, 2);
INSERT INTO public.round_player_medals VALUES (25663, 546, 5);
INSERT INTO public.round_player_medals VALUES (25663, 557, 1);
INSERT INTO public.round_player_medals VALUES (25664, 554, 3);
INSERT INTO public.round_player_medals VALUES (25664, 552, 7);
INSERT INTO public.round_player_medals VALUES (25664, 546, 9);
INSERT INTO public.round_player_medals VALUES (25664, 547, 3);
INSERT INTO public.round_player_medals VALUES (25664, 585, 1);
INSERT INTO public.round_player_medals VALUES (25664, 553, 2);
INSERT INTO public.round_player_medals VALUES (25664, 550, 1);
INSERT INTO public.round_player_medals VALUES (25664, 557, 1);
INSERT INTO public.round_player_medals VALUES (25664, 558, 1);
INSERT INTO public.round_player_medals VALUES (25665, 553, 1);
INSERT INTO public.round_player_medals VALUES (25665, 547, 4);
INSERT INTO public.round_player_medals VALUES (25665, 554, 4);
INSERT INTO public.round_player_medals VALUES (25665, 589, 4);
INSERT INTO public.round_player_medals VALUES (25666, 590, 2);
INSERT INTO public.round_player_medals VALUES (25666, 562, 1);
INSERT INTO public.round_player_medals VALUES (25666, 554, 1);
INSERT INTO public.round_player_medals VALUES (25667, 555, 1);
INSERT INTO public.round_player_medals VALUES (25668, 548, 2);
INSERT INTO public.round_player_medals VALUES (25668, 554, 3);
INSERT INTO public.round_player_medals VALUES (25668, 591, 3);
INSERT INTO public.round_player_medals VALUES (25668, 553, 1);
INSERT INTO public.round_player_medals VALUES (25668, 550, 1);
INSERT INTO public.round_player_medals VALUES (25668, 557, 1);
INSERT INTO public.round_player_medals VALUES (25669, 554, 5);
INSERT INTO public.round_player_medals VALUES (25669, 570, 5);
INSERT INTO public.round_player_medals VALUES (25669, 546, 1);
INSERT INTO public.round_player_medals VALUES (25669, 550, 4);
INSERT INTO public.round_player_medals VALUES (25669, 553, 2);
INSERT INTO public.round_player_medals VALUES (25669, 547, 5);
INSERT INTO public.round_player_medals VALUES (25669, 562, 2);
INSERT INTO public.round_player_medals VALUES (25670, 546, 2);
INSERT INTO public.round_player_medals VALUES (25670, 554, 3);
INSERT INTO public.round_player_medals VALUES (25670, 552, 3);
INSERT INTO public.round_player_medals VALUES (25670, 561, 3);
INSERT INTO public.round_player_medals VALUES (25670, 547, 1);
INSERT INTO public.round_player_medals VALUES (25670, 555, 1);
INSERT INTO public.round_player_medals VALUES (25671, 550, 4);
INSERT INTO public.round_player_medals VALUES (25671, 547, 3);
INSERT INTO public.round_player_medals VALUES (25671, 546, 4);
INSERT INTO public.round_player_medals VALUES (25671, 551, 1);
INSERT INTO public.round_player_medals VALUES (25671, 579, 3);
INSERT INTO public.round_player_medals VALUES (25671, 562, 3);
INSERT INTO public.round_player_medals VALUES (25671, 553, 6);
INSERT INTO public.round_player_medals VALUES (25671, 554, 1);
INSERT INTO public.round_player_medals VALUES (25671, 548, 1);
INSERT INTO public.round_player_medals VALUES (25671, 583, 1);
INSERT INTO public.round_player_medals VALUES (25672, 547, 4);
INSERT INTO public.round_player_medals VALUES (25672, 553, 1);
INSERT INTO public.round_player_medals VALUES (25673, 547, 6);
INSERT INTO public.round_player_medals VALUES (25673, 553, 2);
INSERT INTO public.round_player_medals VALUES (25673, 546, 2);
INSERT INTO public.round_player_medals VALUES (25673, 550, 3);
INSERT INTO public.round_player_medals VALUES (25673, 556, 3);
INSERT INTO public.round_player_medals VALUES (25673, 562, 2);
INSERT INTO public.round_player_medals VALUES (25673, 554, 1);
INSERT INTO public.round_player_medals VALUES (25673, 557, 1);
INSERT INTO public.round_player_medals VALUES (25674, 546, 2);
INSERT INTO public.round_player_medals VALUES (25674, 554, 2);
INSERT INTO public.round_player_medals VALUES (25674, 592, 2);
INSERT INTO public.round_player_medals VALUES (25674, 563, 1);
INSERT INTO public.round_player_medals VALUES (25674, 553, 5);
INSERT INTO public.round_player_medals VALUES (25675, 547, 5);
INSERT INTO public.round_player_medals VALUES (25675, 553, 1);
INSERT INTO public.round_player_medals VALUES (25675, 550, 4);
INSERT INTO public.round_player_medals VALUES (25675, 586, 1);
INSERT INTO public.round_player_medals VALUES (25675, 556, 1);
INSERT INTO public.round_player_medals VALUES (25675, 559, 1);
INSERT INTO public.round_player_medals VALUES (25676, 553, 2);
INSERT INTO public.round_player_medals VALUES (25676, 590, 4);
INSERT INTO public.round_player_medals VALUES (25676, 562, 4);
INSERT INTO public.round_player_medals VALUES (25676, 547, 11);
INSERT INTO public.round_player_medals VALUES (25676, 546, 3);
INSERT INTO public.round_player_medals VALUES (25676, 567, 1);
INSERT INTO public.round_player_medals VALUES (25676, 554, 2);
INSERT INTO public.round_player_medals VALUES (25677, 554, 3);
INSERT INTO public.round_player_medals VALUES (25677, 548, 1);
INSERT INTO public.round_player_medals VALUES (25677, 579, 5);
INSERT INTO public.round_player_medals VALUES (25677, 562, 2);
INSERT INTO public.round_player_medals VALUES (25677, 547, 2);
INSERT INTO public.round_player_medals VALUES (25677, 546, 2);
INSERT INTO public.round_player_medals VALUES (25677, 550, 1);
INSERT INTO public.round_player_medals VALUES (25677, 553, 2);
INSERT INTO public.round_player_medals VALUES (25677, 557, 1);
INSERT INTO public.round_player_medals VALUES (25677, 558, 1);
INSERT INTO public.round_player_medals VALUES (25678, 554, 7);
INSERT INTO public.round_player_medals VALUES (25678, 552, 4);
INSERT INTO public.round_player_medals VALUES (25678, 561, 7);
INSERT INTO public.round_player_medals VALUES (25678, 562, 3);
INSERT INTO public.round_player_medals VALUES (25678, 553, 1);
INSERT INTO public.round_player_medals VALUES (25678, 577, 1);
INSERT INTO public.round_player_medals VALUES (25678, 557, 1);
INSERT INTO public.round_player_medals VALUES (25679, 554, 2);
INSERT INTO public.round_player_medals VALUES (25679, 552, 3);
INSERT INTO public.round_player_medals VALUES (25679, 547, 1);
INSERT INTO public.round_player_medals VALUES (25679, 553, 1);
INSERT INTO public.round_player_medals VALUES (25679, 593, 1);
INSERT INTO public.round_player_medals VALUES (25680, 550, 3);
INSERT INTO public.round_player_medals VALUES (25680, 553, 2);
INSERT INTO public.round_player_medals VALUES (25680, 554, 1);
INSERT INTO public.round_player_medals VALUES (25680, 589, 1);
INSERT INTO public.round_player_medals VALUES (25680, 562, 1);
INSERT INTO public.round_player_medals VALUES (25681, 554, 2);
INSERT INTO public.round_player_medals VALUES (25681, 569, 2);
INSERT INTO public.round_player_medals VALUES (25682, 554, 3);
INSERT INTO public.round_player_medals VALUES (25682, 591, 3);
INSERT INTO public.round_player_medals VALUES (25682, 547, 1);
INSERT INTO public.round_player_medals VALUES (25682, 550, 1);
INSERT INTO public.round_player_medals VALUES (25682, 557, 1);
INSERT INTO public.round_player_medals VALUES (25683, 553, 1);
INSERT INTO public.round_player_medals VALUES (25683, 554, 2);
INSERT INTO public.round_player_medals VALUES (25683, 568, 2);
INSERT INTO public.round_player_medals VALUES (25684, 593, 1);
INSERT INTO public.round_player_medals VALUES (25684, 568, 1);
INSERT INTO public.round_player_medals VALUES (25684, 561, 1);
INSERT INTO public.round_player_medals VALUES (25685, 554, 2);
INSERT INTO public.round_player_medals VALUES (25685, 568, 2);
INSERT INTO public.round_player_medals VALUES (25685, 547, 1);
INSERT INTO public.round_player_medals VALUES (25685, 559, 1);
INSERT INTO public.round_player_medals VALUES (25686, 559, 1);
INSERT INTO public.round_player_medals VALUES (25686, 554, 2);
INSERT INTO public.round_player_medals VALUES (25686, 562, 1);
INSERT INTO public.round_player_medals VALUES (25686, 556, 2);
INSERT INTO public.round_player_medals VALUES (25686, 588, 1);
INSERT INTO public.round_player_medals VALUES (25686, 594, 1);
INSERT INTO public.round_player_medals VALUES (25687, 551, 1);
INSERT INTO public.round_player_medals VALUES (25687, 568, 4);
INSERT INTO public.round_player_medals VALUES (25687, 554, 3);
INSERT INTO public.round_player_medals VALUES (25687, 562, 1);
INSERT INTO public.round_player_medals VALUES (25688, 547, 1);
INSERT INTO public.round_player_medals VALUES (25688, 553, 3);
INSERT INTO public.round_player_medals VALUES (25688, 587, 1);
INSERT INTO public.round_player_medals VALUES (25688, 571, 2);
INSERT INTO public.round_player_medals VALUES (25688, 550, 3);
INSERT INTO public.round_player_medals VALUES (25688, 554, 1);
INSERT INTO public.round_player_medals VALUES (25689, 553, 5);
INSERT INTO public.round_player_medals VALUES (25689, 554, 2);
INSERT INTO public.round_player_medals VALUES (25689, 577, 3);
INSERT INTO public.round_player_medals VALUES (25689, 595, 3);
INSERT INTO public.round_player_medals VALUES (25689, 547, 1);
INSERT INTO public.round_player_medals VALUES (25689, 587, 1);
INSERT INTO public.round_player_medals VALUES (25689, 573, 2);
INSERT INTO public.round_player_medals VALUES (25689, 550, 2);
INSERT INTO public.round_player_medals VALUES (25689, 546, 2);
INSERT INTO public.round_player_medals VALUES (25689, 562, 1);
INSERT INTO public.round_player_medals VALUES (25689, 583, 1);
INSERT INTO public.round_player_medals VALUES (25690, 554, 3);
INSERT INTO public.round_player_medals VALUES (25690, 592, 4);
INSERT INTO public.round_player_medals VALUES (25690, 563, 4);
INSERT INTO public.round_player_medals VALUES (25690, 547, 3);
INSERT INTO public.round_player_medals VALUES (25690, 550, 2);
INSERT INTO public.round_player_medals VALUES (25690, 559, 2);
INSERT INTO public.round_player_medals VALUES (25690, 562, 1);
INSERT INTO public.round_player_medals VALUES (25691, 554, 4);
INSERT INTO public.round_player_medals VALUES (25691, 586, 7);
INSERT INTO public.round_player_medals VALUES (25691, 546, 5);
INSERT INTO public.round_player_medals VALUES (25691, 550, 4);
INSERT INTO public.round_player_medals VALUES (25691, 547, 4);
INSERT INTO public.round_player_medals VALUES (25691, 553, 7);
INSERT INTO public.round_player_medals VALUES (25691, 556, 6);
INSERT INTO public.round_player_medals VALUES (25691, 555, 2);
INSERT INTO public.round_player_medals VALUES (25691, 559, 1);
INSERT INTO public.round_player_medals VALUES (25691, 587, 1);
INSERT INTO public.round_player_medals VALUES (25691, 558, 1);
INSERT INTO public.round_player_medals VALUES (25692, 578, 4);
INSERT INTO public.round_player_medals VALUES (25692, 587, 1);
INSERT INTO public.round_player_medals VALUES (25692, 568, 1);
INSERT INTO public.round_player_medals VALUES (25692, 555, 1);
INSERT INTO public.round_player_medals VALUES (25693, 559, 2);
INSERT INTO public.round_player_medals VALUES (25693, 553, 1);
INSERT INTO public.round_player_medals VALUES (25693, 554, 3);
INSERT INTO public.round_player_medals VALUES (25693, 568, 3);
INSERT INTO public.round_player_medals VALUES (25693, 562, 1);
INSERT INTO public.round_player_medals VALUES (25694, 554, 2);
INSERT INTO public.round_player_medals VALUES (25694, 568, 3);
INSERT INTO public.round_player_medals VALUES (25694, 567, 1);
INSERT INTO public.round_player_medals VALUES (25695, 574, 1);
INSERT INTO public.round_player_medals VALUES (25695, 566, 1);
INSERT INTO public.round_player_medals VALUES (25696, 554, 2);
INSERT INTO public.round_player_medals VALUES (25696, 563, 1);
INSERT INTO public.round_player_medals VALUES (25696, 562, 1);
INSERT INTO public.round_player_medals VALUES (25697, 559, 1);
INSERT INTO public.round_player_medals VALUES (25697, 554, 3);
INSERT INTO public.round_player_medals VALUES (25697, 568, 2);
INSERT INTO public.round_player_medals VALUES (25698, 547, 6);
INSERT INTO public.round_player_medals VALUES (25698, 554, 3);
INSERT INTO public.round_player_medals VALUES (25698, 556, 4);
INSERT INTO public.round_player_medals VALUES (25698, 562, 2);
INSERT INTO public.round_player_medals VALUES (25698, 549, 1);
INSERT INTO public.round_player_medals VALUES (25698, 553, 2);
INSERT INTO public.round_player_medals VALUES (25698, 559, 1);
INSERT INTO public.round_player_medals VALUES (25698, 567, 1);
INSERT INTO public.round_player_medals VALUES (25699, 547, 2);
INSERT INTO public.round_player_medals VALUES (25699, 559, 1);
INSERT INTO public.round_player_medals VALUES (25699, 553, 2);
INSERT INTO public.round_player_medals VALUES (25699, 546, 1);
INSERT INTO public.round_player_medals VALUES (25699, 569, 3);
INSERT INTO public.round_player_medals VALUES (25699, 596, 1);
INSERT INTO public.round_player_medals VALUES (25699, 554, 2);
INSERT INTO public.round_player_medals VALUES (25700, 547, 4);
INSERT INTO public.round_player_medals VALUES (25700, 546, 2);
INSERT INTO public.round_player_medals VALUES (25700, 554, 1);
INSERT INTO public.round_player_medals VALUES (25700, 569, 1);
INSERT INTO public.round_player_medals VALUES (25700, 578, 2);
INSERT INTO public.round_player_medals VALUES (25701, 559, 3);
INSERT INTO public.round_player_medals VALUES (25701, 550, 2);
INSERT INTO public.round_player_medals VALUES (25701, 546, 1);
INSERT INTO public.round_player_medals VALUES (25701, 551, 1);
INSERT INTO public.round_player_medals VALUES (25701, 565, 6);
INSERT INTO public.round_player_medals VALUES (25701, 594, 6);
INSERT INTO public.round_player_medals VALUES (25701, 597, 5);
INSERT INTO public.round_player_medals VALUES (25701, 554, 4);
INSERT INTO public.round_player_medals VALUES (25701, 578, 4);
INSERT INTO public.round_player_medals VALUES (25701, 587, 1);
INSERT INTO public.round_player_medals VALUES (25701, 553, 2);
INSERT INTO public.round_player_medals VALUES (25701, 562, 1);
INSERT INTO public.round_player_medals VALUES (25701, 574, 1);
INSERT INTO public.round_player_medals VALUES (25702, 546, 2);
INSERT INTO public.round_player_medals VALUES (25702, 547, 1);
INSERT INTO public.round_player_medals VALUES (25702, 555, 1);
INSERT INTO public.round_player_medals VALUES (25702, 550, 1);
INSERT INTO public.round_player_medals VALUES (25702, 554, 4);
INSERT INTO public.round_player_medals VALUES (25702, 561, 4);
INSERT INTO public.round_player_medals VALUES (25702, 578, 2);
INSERT INTO public.round_player_medals VALUES (25702, 559, 1);
INSERT INTO public.round_player_medals VALUES (25703, 554, 4);
INSERT INTO public.round_player_medals VALUES (25703, 598, 5);
INSERT INTO public.round_player_medals VALUES (25703, 575, 5);
INSERT INTO public.round_player_medals VALUES (25703, 567, 3);
INSERT INTO public.round_player_medals VALUES (25703, 546, 5);
INSERT INTO public.round_player_medals VALUES (25703, 553, 1);
INSERT INTO public.round_player_medals VALUES (25703, 578, 1);
INSERT INTO public.round_player_medals VALUES (25703, 547, 1);
INSERT INTO public.round_player_medals VALUES (25703, 559, 2);
INSERT INTO public.round_player_medals VALUES (25703, 548, 1);
INSERT INTO public.round_player_medals VALUES (25703, 549, 1);
INSERT INTO public.round_player_medals VALUES (25704, 554, 5);
INSERT INTO public.round_player_medals VALUES (25704, 599, 5);
INSERT INTO public.round_player_medals VALUES (25704, 553, 1);
INSERT INTO public.round_player_medals VALUES (25704, 546, 3);
INSERT INTO public.round_player_medals VALUES (25704, 547, 1);
INSERT INTO public.round_player_medals VALUES (25704, 562, 2);
INSERT INTO public.round_player_medals VALUES (25704, 567, 1);
INSERT INTO public.round_player_medals VALUES (25705, 559, 4);
INSERT INTO public.round_player_medals VALUES (25705, 553, 5);
INSERT INTO public.round_player_medals VALUES (25705, 554, 5);
INSERT INTO public.round_player_medals VALUES (25705, 575, 4);
INSERT INTO public.round_player_medals VALUES (25705, 600, 4);
INSERT INTO public.round_player_medals VALUES (25705, 601, 3);
INSERT INTO public.round_player_medals VALUES (25705, 587, 1);
INSERT INTO public.round_player_medals VALUES (25705, 562, 2);
INSERT INTO public.round_player_medals VALUES (25705, 577, 1);
INSERT INTO public.round_player_medals VALUES (25705, 550, 2);
INSERT INTO public.round_player_medals VALUES (25705, 602, 1);
INSERT INTO public.round_player_medals VALUES (25705, 574, 1);
INSERT INTO public.round_player_medals VALUES (25706, 595, 3);
INSERT INTO public.round_player_medals VALUES (25706, 573, 3);
INSERT INTO public.round_player_medals VALUES (25706, 577, 1);
INSERT INTO public.round_player_medals VALUES (25706, 554, 3);
INSERT INTO public.round_player_medals VALUES (25706, 559, 1);
INSERT INTO public.round_player_medals VALUES (25706, 562, 1);
INSERT INTO public.round_player_medals VALUES (25707, 550, 1);
INSERT INTO public.round_player_medals VALUES (25707, 553, 1);
INSERT INTO public.round_player_medals VALUES (25707, 586, 3);
INSERT INTO public.round_player_medals VALUES (25707, 554, 3);
INSERT INTO public.round_player_medals VALUES (25707, 547, 2);
INSERT INTO public.round_player_medals VALUES (25707, 556, 2);
INSERT INTO public.round_player_medals VALUES (25707, 555, 1);
INSERT INTO public.round_player_medals VALUES (25707, 557, 1);
INSERT INTO public.round_player_medals VALUES (25708, 553, 3);
INSERT INTO public.round_player_medals VALUES (25708, 550, 1);
INSERT INTO public.round_player_medals VALUES (25708, 547, 4);
INSERT INTO public.round_player_medals VALUES (25708, 559, 2);
INSERT INTO public.round_player_medals VALUES (25708, 554, 5);
INSERT INTO public.round_player_medals VALUES (25708, 556, 6);
INSERT INTO public.round_player_medals VALUES (25708, 562, 6);
INSERT INTO public.round_player_medals VALUES (25708, 555, 1);
INSERT INTO public.round_player_medals VALUES (25708, 603, 1);
INSERT INTO public.round_player_medals VALUES (25708, 557, 1);
INSERT INTO public.round_player_medals VALUES (25709, 547, 2);
INSERT INTO public.round_player_medals VALUES (25709, 553, 8);
INSERT INTO public.round_player_medals VALUES (25709, 579, 1);
INSERT INTO public.round_player_medals VALUES (25709, 562, 1);
INSERT INTO public.round_player_medals VALUES (25709, 546, 1);
INSERT INTO public.round_player_medals VALUES (25709, 548, 1);
INSERT INTO public.round_player_medals VALUES (25709, 559, 1);
INSERT INTO public.round_player_medals VALUES (25710, 550, 1);
INSERT INTO public.round_player_medals VALUES (25710, 553, 3);
INSERT INTO public.round_player_medals VALUES (25710, 554, 3);
INSERT INTO public.round_player_medals VALUES (25710, 591, 3);
INSERT INTO public.round_player_medals VALUES (25710, 562, 2);
INSERT INTO public.round_player_medals VALUES (25710, 547, 1);
INSERT INTO public.round_player_medals VALUES (25711, 559, 1);
INSERT INTO public.round_player_medals VALUES (25711, 546, 3);
INSERT INTO public.round_player_medals VALUES (25711, 547, 4);
INSERT INTO public.round_player_medals VALUES (25711, 553, 2);
INSERT INTO public.round_player_medals VALUES (25711, 600, 1);
INSERT INTO public.round_player_medals VALUES (25711, 575, 1);
INSERT INTO public.round_player_medals VALUES (25711, 601, 1);
INSERT INTO public.round_player_medals VALUES (25711, 562, 1);
INSERT INTO public.round_player_medals VALUES (25711, 577, 1);
INSERT INTO public.round_player_medals VALUES (25711, 583, 1);
INSERT INTO public.round_player_medals VALUES (25712, 559, 1);
INSERT INTO public.round_player_medals VALUES (25712, 553, 1);
INSERT INTO public.round_player_medals VALUES (25712, 547, 6);
INSERT INTO public.round_player_medals VALUES (25713, 554, 3);
INSERT INTO public.round_player_medals VALUES (25713, 579, 6);
INSERT INTO public.round_player_medals VALUES (25713, 577, 2);
INSERT INTO public.round_player_medals VALUES (25713, 547, 1);
INSERT INTO public.round_player_medals VALUES (25713, 553, 2);
INSERT INTO public.round_player_medals VALUES (25713, 546, 1);
INSERT INTO public.round_player_medals VALUES (25713, 562, 1);
INSERT INTO public.round_player_medals VALUES (25713, 550, 1);
INSERT INTO public.round_player_medals VALUES (25713, 578, 1);
INSERT INTO public.round_player_medals VALUES (25713, 603, 1);
INSERT INTO public.round_player_medals VALUES (25713, 557, 1);
INSERT INTO public.round_player_medals VALUES (25714, 553, 2);
INSERT INTO public.round_player_medals VALUES (25714, 547, 4);
INSERT INTO public.round_player_medals VALUES (25714, 551, 1);
INSERT INTO public.round_player_medals VALUES (25714, 569, 3);
INSERT INTO public.round_player_medals VALUES (25714, 554, 2);
INSERT INTO public.round_player_medals VALUES (25714, 559, 1);
INSERT INTO public.round_player_medals VALUES (25714, 555, 1);
INSERT INTO public.round_player_medals VALUES (25714, 578, 2);
INSERT INTO public.round_player_medals VALUES (25714, 603, 1);
INSERT INTO public.round_player_medals VALUES (25714, 558, 1);
INSERT INTO public.round_player_medals VALUES (25715, 546, 1);
INSERT INTO public.round_player_medals VALUES (25715, 554, 1);
INSERT INTO public.round_player_medals VALUES (25715, 604, 1);
INSERT INTO public.round_player_medals VALUES (25715, 605, 1);
INSERT INTO public.round_player_medals VALUES (25716, 546, 1);
INSERT INTO public.round_player_medals VALUES (25716, 547, 5);
INSERT INTO public.round_player_medals VALUES (25718, 553, 1);
INSERT INTO public.round_player_medals VALUES (25718, 554, 2);
INSERT INTO public.round_player_medals VALUES (25718, 564, 1);
INSERT INTO public.round_player_medals VALUES (25718, 565, 1);
INSERT INTO public.round_player_medals VALUES (25718, 557, 1);
INSERT INTO public.round_player_medals VALUES (25720, 554, 3);
INSERT INTO public.round_player_medals VALUES (25720, 556, 4);
INSERT INTO public.round_player_medals VALUES (25720, 562, 1);
INSERT INTO public.round_player_medals VALUES (25720, 553, 5);
INSERT INTO public.round_player_medals VALUES (25720, 546, 1);
INSERT INTO public.round_player_medals VALUES (25720, 577, 2);
INSERT INTO public.round_player_medals VALUES (25720, 548, 1);
INSERT INTO public.round_player_medals VALUES (25720, 557, 1);
INSERT INTO public.round_player_medals VALUES (25721, 546, 2);
INSERT INTO public.round_player_medals VALUES (25721, 559, 1);
INSERT INTO public.round_player_medals VALUES (25722, 553, 2);
INSERT INTO public.round_player_medals VALUES (25722, 554, 6);
INSERT INTO public.round_player_medals VALUES (25722, 561, 7);
INSERT INTO public.round_player_medals VALUES (25722, 552, 6);
INSERT INTO public.round_player_medals VALUES (25722, 594, 3);
INSERT INTO public.round_player_medals VALUES (25722, 548, 1);
INSERT INTO public.round_player_medals VALUES (25722, 547, 1);
INSERT INTO public.round_player_medals VALUES (25722, 562, 1);
INSERT INTO public.round_player_medals VALUES (25722, 603, 1);
INSERT INTO public.round_player_medals VALUES (25722, 557, 1);
INSERT INTO public.round_player_medals VALUES (25723, 547, 3);
INSERT INTO public.round_player_medals VALUES (25723, 555, 1);
INSERT INTO public.round_player_medals VALUES (25723, 554, 3);
INSERT INTO public.round_player_medals VALUES (25723, 586, 5);
INSERT INTO public.round_player_medals VALUES (25723, 550, 5);
INSERT INTO public.round_player_medals VALUES (25723, 553, 9);
INSERT INTO public.round_player_medals VALUES (25723, 556, 1);
INSERT INTO public.round_player_medals VALUES (25723, 603, 1);
INSERT INTO public.round_player_medals VALUES (25723, 606, 1);
INSERT INTO public.round_player_medals VALUES (25723, 558, 1);
INSERT INTO public.round_player_medals VALUES (25724, 567, 1);
INSERT INTO public.round_player_medals VALUES (25724, 551, 1);
INSERT INTO public.round_player_medals VALUES (25724, 556, 2);
INSERT INTO public.round_player_medals VALUES (25724, 559, 1);
INSERT INTO public.round_player_medals VALUES (25724, 583, 1);
INSERT INTO public.round_player_medals VALUES (25725, 546, 3);
INSERT INTO public.round_player_medals VALUES (25725, 547, 5);
INSERT INTO public.round_player_medals VALUES (25725, 548, 1);
INSERT INTO public.round_player_medals VALUES (25725, 554, 5);
INSERT INTO public.round_player_medals VALUES (25725, 552, 5);
INSERT INTO public.round_player_medals VALUES (25725, 598, 4);
INSERT INTO public.round_player_medals VALUES (25725, 607, 2);
INSERT INTO public.round_player_medals VALUES (25725, 562, 2);
INSERT INTO public.round_player_medals VALUES (25725, 578, 3);
INSERT INTO public.round_player_medals VALUES (25725, 603, 1);
INSERT INTO public.round_player_medals VALUES (25725, 602, 1);
INSERT INTO public.round_player_medals VALUES (25725, 606, 1);
INSERT INTO public.round_player_medals VALUES (25726, 553, 1);
INSERT INTO public.round_player_medals VALUES (25727, 547, 1);
INSERT INTO public.round_player_medals VALUES (25727, 554, 2);
INSERT INTO public.round_player_medals VALUES (25727, 565, 2);
INSERT INTO public.round_player_medals VALUES (25727, 564, 1);
INSERT INTO public.round_player_medals VALUES (25728, 547, 1);
INSERT INTO public.round_player_medals VALUES (25728, 554, 5);
INSERT INTO public.round_player_medals VALUES (25728, 568, 6);
INSERT INTO public.round_player_medals VALUES (25728, 546, 1);
INSERT INTO public.round_player_medals VALUES (25728, 603, 1);
INSERT INTO public.round_player_medals VALUES (25728, 606, 1);
INSERT INTO public.round_player_medals VALUES (25729, 553, 1);
INSERT INTO public.round_player_medals VALUES (25729, 547, 1);
INSERT INTO public.round_player_medals VALUES (25729, 554, 1);
INSERT INTO public.round_player_medals VALUES (25729, 568, 1);
INSERT INTO public.round_player_medals VALUES (25730, 550, 2);
INSERT INTO public.round_player_medals VALUES (25730, 553, 7);
INSERT INTO public.round_player_medals VALUES (25730, 547, 2);
INSERT INTO public.round_player_medals VALUES (25730, 571, 4);
INSERT INTO public.round_player_medals VALUES (25730, 546, 1);
INSERT INTO public.round_player_medals VALUES (25730, 554, 4);
INSERT INTO public.round_player_medals VALUES (25730, 562, 1);
INSERT INTO public.round_player_medals VALUES (25730, 603, 1);
INSERT INTO public.round_player_medals VALUES (25730, 606, 1);
INSERT INTO public.round_player_medals VALUES (25731, 546, 2);
INSERT INTO public.round_player_medals VALUES (25731, 554, 2);
INSERT INTO public.round_player_medals VALUES (25731, 568, 2);
INSERT INTO public.round_player_medals VALUES (25732, 547, 2);
INSERT INTO public.round_player_medals VALUES (25732, 553, 1);
INSERT INTO public.round_player_medals VALUES (25732, 548, 1);
INSERT INTO public.round_player_medals VALUES (25732, 550, 2);
INSERT INTO public.round_player_medals VALUES (25732, 554, 5);
INSERT INTO public.round_player_medals VALUES (25732, 600, 3);
INSERT INTO public.round_player_medals VALUES (25732, 575, 5);
INSERT INTO public.round_player_medals VALUES (25732, 601, 4);
INSERT INTO public.round_player_medals VALUES (25732, 603, 1);
INSERT INTO public.round_player_medals VALUES (25732, 606, 1);
INSERT INTO public.round_player_medals VALUES (25733, 550, 2);
INSERT INTO public.round_player_medals VALUES (25733, 547, 2);
INSERT INTO public.round_player_medals VALUES (25733, 559, 1);
INSERT INTO public.round_player_medals VALUES (25733, 553, 2);
INSERT INTO public.round_player_medals VALUES (25734, 547, 1);
INSERT INTO public.round_player_medals VALUES (25734, 553, 2);
INSERT INTO public.round_player_medals VALUES (25734, 578, 1);
INSERT INTO public.round_player_medals VALUES (25735, 550, 3);
INSERT INTO public.round_player_medals VALUES (25735, 553, 2);
INSERT INTO public.round_player_medals VALUES (25735, 546, 2);
INSERT INTO public.round_player_medals VALUES (25735, 559, 1);
INSERT INTO public.round_player_medals VALUES (25736, 553, 2);
INSERT INTO public.round_player_medals VALUES (25737, 553, 4);
INSERT INTO public.round_player_medals VALUES (25737, 547, 1);
INSERT INTO public.round_player_medals VALUES (25737, 548, 2);
INSERT INTO public.round_player_medals VALUES (25737, 550, 2);
INSERT INTO public.round_player_medals VALUES (25737, 556, 4);
INSERT INTO public.round_player_medals VALUES (25737, 554, 2);
INSERT INTO public.round_player_medals VALUES (25737, 562, 3);
INSERT INTO public.round_player_medals VALUES (25737, 587, 1);
INSERT INTO public.round_player_medals VALUES (25737, 603, 1);
INSERT INTO public.round_player_medals VALUES (25737, 606, 1);
INSERT INTO public.round_player_medals VALUES (25738, 553, 2);
INSERT INTO public.round_player_medals VALUES (25738, 547, 2);
INSERT INTO public.round_player_medals VALUES (25738, 550, 3);
INSERT INTO public.round_player_medals VALUES (25738, 579, 4);
INSERT INTO public.round_player_medals VALUES (25738, 573, 3);
INSERT INTO public.round_player_medals VALUES (25738, 562, 2);
INSERT INTO public.round_player_medals VALUES (25738, 554, 3);
INSERT INTO public.round_player_medals VALUES (25739, 553, 7);
INSERT INTO public.round_player_medals VALUES (25739, 554, 4);
INSERT INTO public.round_player_medals VALUES (25739, 586, 6);
INSERT INTO public.round_player_medals VALUES (25739, 546, 4);
INSERT INTO public.round_player_medals VALUES (25739, 547, 3);
INSERT INTO public.round_player_medals VALUES (25739, 549, 2);
INSERT INTO public.round_player_medals VALUES (25739, 585, 1);
INSERT INTO public.round_player_medals VALUES (25739, 550, 2);
INSERT INTO public.round_player_medals VALUES (25739, 556, 1);
INSERT INTO public.round_player_medals VALUES (25739, 606, 1);
INSERT INTO public.round_player_medals VALUES (25739, 558, 1);
INSERT INTO public.round_player_medals VALUES (25740, 559, 2);
INSERT INTO public.round_player_medals VALUES (25740, 553, 4);
INSERT INTO public.round_player_medals VALUES (25740, 547, 4);
INSERT INTO public.round_player_medals VALUES (25740, 577, 1);
INSERT INTO public.round_player_medals VALUES (25740, 546, 2);
INSERT INTO public.round_player_medals VALUES (25741, 554, 3);
INSERT INTO public.round_player_medals VALUES (25741, 564, 3);
INSERT INTO public.round_player_medals VALUES (25741, 565, 1);
INSERT INTO public.round_player_medals VALUES (25741, 606, 1);
INSERT INTO public.round_player_medals VALUES (25742, 553, 4);
INSERT INTO public.round_player_medals VALUES (25742, 555, 1);
INSERT INTO public.round_player_medals VALUES (25742, 548, 7);
INSERT INTO public.round_player_medals VALUES (25742, 554, 3);
INSERT INTO public.round_player_medals VALUES (25742, 565, 1);
INSERT INTO public.round_player_medals VALUES (25742, 564, 2);
INSERT INTO public.round_player_medals VALUES (25743, 554, 5);
INSERT INTO public.round_player_medals VALUES (25743, 608, 4);
INSERT INTO public.round_player_medals VALUES (25743, 585, 1);
INSERT INTO public.round_player_medals VALUES (25743, 562, 1);
INSERT INTO public.round_player_medals VALUES (25744, 554, 1);
INSERT INTO public.round_player_medals VALUES (25744, 571, 1);
INSERT INTO public.round_player_medals VALUES (25745, 554, 2);
INSERT INTO public.round_player_medals VALUES (25745, 568, 2);
INSERT INTO public.round_player_medals VALUES (25746, 555, 1);
INSERT INTO public.round_player_medals VALUES (25746, 554, 2);
INSERT INTO public.round_player_medals VALUES (25746, 571, 2);
INSERT INTO public.round_player_medals VALUES (25746, 553, 2);
INSERT INTO public.round_player_medals VALUES (25746, 562, 1);
INSERT INTO public.round_player_medals VALUES (25747, 547, 2);
INSERT INTO public.round_player_medals VALUES (25747, 553, 1);
INSERT INTO public.round_player_medals VALUES (25747, 546, 3);
INSERT INTO public.round_player_medals VALUES (25747, 551, 1);
INSERT INTO public.round_player_medals VALUES (25747, 561, 3);
INSERT INTO public.round_player_medals VALUES (25747, 554, 2);
INSERT INTO public.round_player_medals VALUES (25747, 555, 1);
INSERT INTO public.round_player_medals VALUES (25749, 547, 2);
INSERT INTO public.round_player_medals VALUES (25749, 554, 2);
INSERT INTO public.round_player_medals VALUES (25749, 561, 3);
INSERT INTO public.round_player_medals VALUES (25749, 560, 3);
INSERT INTO public.round_player_medals VALUES (25749, 553, 2);
INSERT INTO public.round_player_medals VALUES (25749, 548, 1);
INSERT INTO public.round_player_medals VALUES (25750, 567, 2);
INSERT INTO public.round_player_medals VALUES (25750, 554, 4);
INSERT INTO public.round_player_medals VALUES (25750, 605, 6);
INSERT INTO public.round_player_medals VALUES (25750, 553, 4);
INSERT INTO public.round_player_medals VALUES (25750, 548, 1);
INSERT INTO public.round_player_medals VALUES (25750, 585, 1);
INSERT INTO public.round_player_medals VALUES (25750, 606, 1);
INSERT INTO public.round_player_medals VALUES (25751, 547, 1);
INSERT INTO public.round_player_medals VALUES (25751, 554, 4);
INSERT INTO public.round_player_medals VALUES (25751, 562, 1);
INSERT INTO public.round_player_medals VALUES (25751, 579, 3);
INSERT INTO public.round_player_medals VALUES (25752, 559, 22);
INSERT INTO public.round_player_medals VALUES (25752, 547, 3);
INSERT INTO public.round_player_medals VALUES (25752, 546, 1);
INSERT INTO public.round_player_medals VALUES (25752, 548, 4);
INSERT INTO public.round_player_medals VALUES (25752, 554, 3);
INSERT INTO public.round_player_medals VALUES (25752, 561, 3);
INSERT INTO public.round_player_medals VALUES (25752, 553, 4);
INSERT INTO public.round_player_medals VALUES (25752, 567, 1);
INSERT INTO public.round_player_medals VALUES (25752, 555, 1);
INSERT INTO public.round_player_medals VALUES (25753, 546, 2);
INSERT INTO public.round_player_medals VALUES (25753, 553, 5);
INSERT INTO public.round_player_medals VALUES (25753, 550, 1);
INSERT INTO public.round_player_medals VALUES (25753, 591, 5);
INSERT INTO public.round_player_medals VALUES (25753, 547, 1);
INSERT INTO public.round_player_medals VALUES (25753, 554, 4);
INSERT INTO public.round_player_medals VALUES (25753, 585, 1);
INSERT INTO public.round_player_medals VALUES (25753, 549, 1);
INSERT INTO public.round_player_medals VALUES (25753, 548, 1);
INSERT INTO public.round_player_medals VALUES (25753, 606, 1);
INSERT INTO public.round_player_medals VALUES (25754, 589, 4);
INSERT INTO public.round_player_medals VALUES (25754, 562, 3);
INSERT INTO public.round_player_medals VALUES (25754, 554, 2);
INSERT INTO public.round_player_medals VALUES (25754, 553, 2);
INSERT INTO public.round_player_medals VALUES (25754, 606, 1);
INSERT INTO public.round_player_medals VALUES (25754, 609, 1);
INSERT INTO public.round_player_medals VALUES (25755, 546, 4);
INSERT INTO public.round_player_medals VALUES (25755, 553, 12);
INSERT INTO public.round_player_medals VALUES (25755, 547, 17);
INSERT INTO public.round_player_medals VALUES (25755, 555, 1);
INSERT INTO public.round_player_medals VALUES (25755, 550, 2);
INSERT INTO public.round_player_medals VALUES (25755, 548, 2);
INSERT INTO public.round_player_medals VALUES (25755, 554, 3);
INSERT INTO public.round_player_medals VALUES (25755, 586, 7);
INSERT INTO public.round_player_medals VALUES (25755, 556, 1);
INSERT INTO public.round_player_medals VALUES (25755, 587, 2);
INSERT INTO public.round_player_medals VALUES (25755, 549, 1);
INSERT INTO public.round_player_medals VALUES (25755, 559, 1);
INSERT INTO public.round_player_medals VALUES (25755, 557, 1);
INSERT INTO public.round_player_medals VALUES (25755, 558, 1);
INSERT INTO public.round_player_medals VALUES (25756, 553, 1);
INSERT INTO public.round_player_medals VALUES (25756, 548, 1);
INSERT INTO public.round_player_medals VALUES (25756, 550, 1);
INSERT INTO public.round_player_medals VALUES (25756, 554, 2);
INSERT INTO public.round_player_medals VALUES (25756, 560, 2);
INSERT INTO public.round_player_medals VALUES (25757, 567, 1);
INSERT INTO public.round_player_medals VALUES (25757, 549, 3);
INSERT INTO public.round_player_medals VALUES (25758, 547, 1);
INSERT INTO public.round_player_medals VALUES (25758, 548, 1);
INSERT INTO public.round_player_medals VALUES (25758, 553, 7);
INSERT INTO public.round_player_medals VALUES (25758, 554, 5);
INSERT INTO public.round_player_medals VALUES (25758, 565, 3);
INSERT INTO public.round_player_medals VALUES (25758, 564, 4);
INSERT INTO public.round_player_medals VALUES (25758, 546, 1);
INSERT INTO public.round_player_medals VALUES (25758, 557, 1);
INSERT INTO public.round_player_medals VALUES (25759, 567, 2);
INSERT INTO public.round_player_medals VALUES (25759, 546, 1);
INSERT INTO public.round_player_medals VALUES (25759, 553, 1);
INSERT INTO public.round_player_medals VALUES (25759, 554, 3);
INSERT INTO public.round_player_medals VALUES (25759, 608, 1);
INSERT INTO public.round_player_medals VALUES (25760, 554, 3);
INSERT INTO public.round_player_medals VALUES (25760, 565, 1);
INSERT INTO public.round_player_medals VALUES (25760, 547, 1);
INSERT INTO public.round_player_medals VALUES (25760, 564, 2);
INSERT INTO public.round_player_medals VALUES (25761, 547, 5);
INSERT INTO public.round_player_medals VALUES (25761, 546, 3);
INSERT INTO public.round_player_medals VALUES (25761, 553, 1);
INSERT INTO public.round_player_medals VALUES (25761, 554, 3);
INSERT INTO public.round_player_medals VALUES (25761, 565, 1);
INSERT INTO public.round_player_medals VALUES (25761, 564, 1);
INSERT INTO public.round_player_medals VALUES (25762, 553, 1);
INSERT INTO public.round_player_medals VALUES (25762, 546, 1);
INSERT INTO public.round_player_medals VALUES (25762, 547, 3);
INSERT INTO public.round_player_medals VALUES (25762, 581, 4);
INSERT INTO public.round_player_medals VALUES (25762, 562, 3);
INSERT INTO public.round_player_medals VALUES (25762, 549, 1);
INSERT INTO public.round_player_medals VALUES (25762, 554, 6);
INSERT INTO public.round_player_medals VALUES (25762, 577, 3);
INSERT INTO public.round_player_medals VALUES (25762, 559, 1);
INSERT INTO public.round_player_medals VALUES (25763, 546, 2);
INSERT INTO public.round_player_medals VALUES (25763, 554, 4);
INSERT INTO public.round_player_medals VALUES (25763, 597, 4);
INSERT INTO public.round_player_medals VALUES (25763, 598, 5);
INSERT INTO public.round_player_medals VALUES (25763, 587, 1);
INSERT INTO public.round_player_medals VALUES (25763, 581, 6);
INSERT INTO public.round_player_medals VALUES (25763, 553, 3);
INSERT INTO public.round_player_medals VALUES (25763, 578, 1);
INSERT INTO public.round_player_medals VALUES (25763, 548, 1);
INSERT INTO public.round_player_medals VALUES (25763, 562, 1);
INSERT INTO public.round_player_medals VALUES (25763, 559, 1);
INSERT INTO public.round_player_medals VALUES (25763, 557, 1);
INSERT INTO public.round_player_medals VALUES (25764, 547, 3);
INSERT INTO public.round_player_medals VALUES (25764, 567, 1);
INSERT INTO public.round_player_medals VALUES (25764, 548, 1);
INSERT INTO public.round_player_medals VALUES (25764, 553, 1);
INSERT INTO public.round_player_medals VALUES (25764, 546, 2);
INSERT INTO public.round_player_medals VALUES (25764, 554, 1);
INSERT INTO public.round_player_medals VALUES (25764, 561, 1);
INSERT INTO public.round_player_medals VALUES (25764, 568, 1);
INSERT INTO public.round_player_medals VALUES (25764, 562, 1);
INSERT INTO public.round_player_medals VALUES (25765, 555, 1);
INSERT INTO public.round_player_medals VALUES (25765, 547, 3);
INSERT INTO public.round_player_medals VALUES (25765, 554, 1);
INSERT INTO public.round_player_medals VALUES (25765, 568, 1);
INSERT INTO public.round_player_medals VALUES (25766, 551, 1);
INSERT INTO public.round_player_medals VALUES (25766, 598, 4);
INSERT INTO public.round_player_medals VALUES (25766, 575, 4);
INSERT INTO public.round_player_medals VALUES (25766, 547, 1);
INSERT INTO public.round_player_medals VALUES (25766, 549, 3);
INSERT INTO public.round_player_medals VALUES (25766, 559, 2);
INSERT INTO public.round_player_medals VALUES (25766, 553, 1);
INSERT INTO public.round_player_medals VALUES (25766, 554, 3);
INSERT INTO public.round_player_medals VALUES (25766, 567, 1);
INSERT INTO public.round_player_medals VALUES (25766, 555, 1);
INSERT INTO public.round_player_medals VALUES (25766, 546, 2);
INSERT INTO public.round_player_medals VALUES (25767, 546, 1);
INSERT INTO public.round_player_medals VALUES (25767, 549, 4);
INSERT INTO public.round_player_medals VALUES (25767, 554, 5);
INSERT INTO public.round_player_medals VALUES (25767, 561, 5);
INSERT INTO public.round_player_medals VALUES (25767, 560, 5);
INSERT INTO public.round_player_medals VALUES (25767, 547, 10);
INSERT INTO public.round_player_medals VALUES (25767, 548, 2);
INSERT INTO public.round_player_medals VALUES (25767, 553, 2);
INSERT INTO public.round_player_medals VALUES (25767, 578, 1);
INSERT INTO public.round_player_medals VALUES (25768, 559, 28);
INSERT INTO public.round_player_medals VALUES (25768, 547, 9);
INSERT INTO public.round_player_medals VALUES (25768, 554, 2);
INSERT INTO public.round_player_medals VALUES (25768, 561, 5);
INSERT INTO public.round_player_medals VALUES (25768, 549, 5);
INSERT INTO public.round_player_medals VALUES (25768, 548, 3);
INSERT INTO public.round_player_medals VALUES (25768, 555, 1);
INSERT INTO public.round_player_medals VALUES (25768, 553, 2);
INSERT INTO public.round_player_medals VALUES (25768, 610, 2);
INSERT INTO public.round_player_medals VALUES (25768, 567, 1);
INSERT INTO public.round_player_medals VALUES (25768, 546, 1);
INSERT INTO public.round_player_medals VALUES (25769, 550, 1);
INSERT INTO public.round_player_medals VALUES (25769, 554, 4);
INSERT INTO public.round_player_medals VALUES (25769, 607, 3);
INSERT INTO public.round_player_medals VALUES (25769, 561, 4);
INSERT INTO public.round_player_medals VALUES (25769, 611, 4);
INSERT INTO public.round_player_medals VALUES (25769, 547, 2);
INSERT INTO public.round_player_medals VALUES (25769, 592, 1);
INSERT INTO public.round_player_medals VALUES (25770, 547, 4);
INSERT INTO public.round_player_medals VALUES (25770, 550, 2);
INSERT INTO public.round_player_medals VALUES (25770, 554, 2);
INSERT INTO public.round_player_medals VALUES (25770, 556, 2);
INSERT INTO public.round_player_medals VALUES (25770, 577, 1);
INSERT INTO public.round_player_medals VALUES (25771, 547, 5);
INSERT INTO public.round_player_medals VALUES (25771, 546, 2);
INSERT INTO public.round_player_medals VALUES (25771, 554, 2);
INSERT INTO public.round_player_medals VALUES (25771, 586, 3);
INSERT INTO public.round_player_medals VALUES (25771, 555, 1);
INSERT INTO public.round_player_medals VALUES (25771, 550, 1);
INSERT INTO public.round_player_medals VALUES (25771, 549, 1);
INSERT INTO public.round_player_medals VALUES (25771, 587, 1);
INSERT INTO public.round_player_medals VALUES (25771, 553, 2);
INSERT INTO public.round_player_medals VALUES (25772, 567, 1);
INSERT INTO public.round_player_medals VALUES (25772, 554, 7);
INSERT INTO public.round_player_medals VALUES (25772, 600, 7);
INSERT INTO public.round_player_medals VALUES (25772, 578, 1);
INSERT INTO public.round_player_medals VALUES (25772, 585, 1);
INSERT INTO public.round_player_medals VALUES (25772, 549, 3);
INSERT INTO public.round_player_medals VALUES (25772, 562, 2);
INSERT INTO public.round_player_medals VALUES (25772, 612, 2);
INSERT INTO public.round_player_medals VALUES (25772, 557, 1);
INSERT INTO public.round_player_medals VALUES (25773, 548, 1);
INSERT INTO public.round_player_medals VALUES (25773, 581, 3);
INSERT INTO public.round_player_medals VALUES (25773, 559, 3);
INSERT INTO public.round_player_medals VALUES (25773, 578, 3);
INSERT INTO public.round_player_medals VALUES (25773, 547, 5);
INSERT INTO public.round_player_medals VALUES (25773, 555, 2);
INSERT INTO public.round_player_medals VALUES (25773, 554, 1);
INSERT INTO public.round_player_medals VALUES (25773, 562, 1);
INSERT INTO public.round_player_medals VALUES (25773, 577, 1);
INSERT INTO public.round_player_medals VALUES (25773, 602, 1);
INSERT INTO public.round_player_medals VALUES (25773, 553, 1);
INSERT INTO public.round_player_medals VALUES (25774, 547, 2);
INSERT INTO public.round_player_medals VALUES (25774, 567, 1);
INSERT INTO public.round_player_medals VALUES (25774, 578, 3);
INSERT INTO public.round_player_medals VALUES (25774, 554, 3);
INSERT INTO public.round_player_medals VALUES (25774, 562, 2);
INSERT INTO public.round_player_medals VALUES (25774, 598, 2);
INSERT INTO public.round_player_medals VALUES (25774, 581, 3);
INSERT INTO public.round_player_medals VALUES (25774, 550, 1);
INSERT INTO public.round_player_medals VALUES (25774, 555, 1);
INSERT INTO public.round_player_medals VALUES (25774, 549, 1);
INSERT INTO public.round_player_medals VALUES (25775, 559, 17);
INSERT INTO public.round_player_medals VALUES (25775, 547, 2);
INSERT INTO public.round_player_medals VALUES (25775, 548, 3);
INSERT INTO public.round_player_medals VALUES (25775, 549, 7);
INSERT INTO public.round_player_medals VALUES (25775, 554, 4);
INSERT INTO public.round_player_medals VALUES (25775, 585, 1);
INSERT INTO public.round_player_medals VALUES (25775, 561, 6);
INSERT INTO public.round_player_medals VALUES (25775, 578, 1);
INSERT INTO public.round_player_medals VALUES (25775, 610, 2);
INSERT INTO public.round_player_medals VALUES (25775, 612, 2);
INSERT INTO public.round_player_medals VALUES (25775, 546, 1);
INSERT INTO public.round_player_medals VALUES (25775, 557, 1);
INSERT INTO public.round_player_medals VALUES (25776, 553, 4);
INSERT INTO public.round_player_medals VALUES (25776, 548, 1);
INSERT INTO public.round_player_medals VALUES (25776, 546, 3);
INSERT INTO public.round_player_medals VALUES (25776, 554, 5);
INSERT INTO public.round_player_medals VALUES (25776, 585, 1);
INSERT INTO public.round_player_medals VALUES (25776, 560, 6);
INSERT INTO public.round_player_medals VALUES (25776, 561, 6);
INSERT INTO public.round_player_medals VALUES (25776, 549, 3);
INSERT INTO public.round_player_medals VALUES (25776, 612, 2);
INSERT INTO public.round_player_medals VALUES (25776, 557, 1);
INSERT INTO public.round_player_medals VALUES (25777, 546, 2);
INSERT INTO public.round_player_medals VALUES (25777, 547, 3);
INSERT INTO public.round_player_medals VALUES (25777, 553, 1);
INSERT INTO public.round_player_medals VALUES (25777, 554, 3);
INSERT INTO public.round_player_medals VALUES (25777, 569, 3);
INSERT INTO public.round_player_medals VALUES (25779, 559, 1);
INSERT INTO public.round_player_medals VALUES (25779, 585, 1);
INSERT INTO public.round_player_medals VALUES (25779, 577, 4);
INSERT INTO public.round_player_medals VALUES (25779, 553, 3);
INSERT INTO public.round_player_medals VALUES (25779, 547, 2);
INSERT INTO public.round_player_medals VALUES (25779, 546, 1);
INSERT INTO public.round_player_medals VALUES (25779, 549, 4);
INSERT INTO public.round_player_medals VALUES (25779, 554, 2);
INSERT INTO public.round_player_medals VALUES (25779, 612, 2);
INSERT INTO public.round_player_medals VALUES (25779, 562, 2);
INSERT INTO public.round_player_medals VALUES (25780, 547, 2);
INSERT INTO public.round_player_medals VALUES (25780, 546, 4);
INSERT INTO public.round_player_medals VALUES (25780, 548, 2);
INSERT INTO public.round_player_medals VALUES (25780, 555, 1);
INSERT INTO public.round_player_medals VALUES (25780, 553, 1);
INSERT INTO public.round_player_medals VALUES (25780, 568, 1);
INSERT INTO public.round_player_medals VALUES (25780, 578, 3);
INSERT INTO public.round_player_medals VALUES (25780, 583, 1);
INSERT INTO public.round_player_medals VALUES (25781, 554, 1);
INSERT INTO public.round_player_medals VALUES (25781, 608, 1);
INSERT INTO public.round_player_medals VALUES (25782, 578, 3);
INSERT INTO public.round_player_medals VALUES (25782, 553, 2);
INSERT INTO public.round_player_medals VALUES (25782, 554, 1);
INSERT INTO public.round_player_medals VALUES (25782, 568, 1);
INSERT INTO public.round_player_medals VALUES (25783, 547, 4);
INSERT INTO public.round_player_medals VALUES (25783, 546, 2);
INSERT INTO public.round_player_medals VALUES (25783, 553, 3);
INSERT INTO public.round_player_medals VALUES (25783, 551, 1);
INSERT INTO public.round_player_medals VALUES (25783, 571, 3);
INSERT INTO public.round_player_medals VALUES (25783, 562, 1);
INSERT INTO public.round_player_medals VALUES (25783, 554, 2);
INSERT INTO public.round_player_medals VALUES (25783, 612, 1);
INSERT INTO public.round_player_medals VALUES (25784, 578, 1);
INSERT INTO public.round_player_medals VALUES (25784, 554, 2);
INSERT INTO public.round_player_medals VALUES (25784, 564, 1);
INSERT INTO public.round_player_medals VALUES (25785, 559, 1);
INSERT INTO public.round_player_medals VALUES (25785, 554, 4);
INSERT INTO public.round_player_medals VALUES (25785, 565, 2);
INSERT INTO public.round_player_medals VALUES (25785, 585, 1);
INSERT INTO public.round_player_medals VALUES (25785, 564, 1);
INSERT INTO public.round_player_medals VALUES (25785, 612, 1);
INSERT INTO public.round_player_medals VALUES (25786, 546, 2);
INSERT INTO public.round_player_medals VALUES (25786, 554, 4);
INSERT INTO public.round_player_medals VALUES (25786, 598, 5);
INSERT INTO public.round_player_medals VALUES (25786, 547, 8);
INSERT INTO public.round_player_medals VALUES (25786, 567, 1);
INSERT INTO public.round_player_medals VALUES (25786, 585, 1);
INSERT INTO public.round_player_medals VALUES (25786, 575, 5);
INSERT INTO public.round_player_medals VALUES (25786, 549, 7);
INSERT INTO public.round_player_medals VALUES (25786, 613, 1);
INSERT INTO public.round_player_medals VALUES (25786, 559, 1);
INSERT INTO public.round_player_medals VALUES (25786, 555, 1);
INSERT INTO public.round_player_medals VALUES (25786, 612, 2);
INSERT INTO public.round_player_medals VALUES (25786, 587, 1);
INSERT INTO public.round_player_medals VALUES (25786, 562, 1);
INSERT INTO public.round_player_medals VALUES (25786, 557, 1);
INSERT INTO public.round_player_medals VALUES (25786, 558, 1);
INSERT INTO public.round_player_medals VALUES (25787, 553, 7);
INSERT INTO public.round_player_medals VALUES (25787, 551, 1);
INSERT INTO public.round_player_medals VALUES (25787, 586, 8);
INSERT INTO public.round_player_medals VALUES (25787, 547, 1);
INSERT INTO public.round_player_medals VALUES (25787, 550, 7);
INSERT INTO public.round_player_medals VALUES (25787, 554, 6);
INSERT INTO public.round_player_medals VALUES (25787, 549, 1);
INSERT INTO public.round_player_medals VALUES (25787, 546, 1);
INSERT INTO public.round_player_medals VALUES (25787, 606, 1);
INSERT INTO public.round_player_medals VALUES (25788, 547, 1);
INSERT INTO public.round_player_medals VALUES (25788, 553, 1);
INSERT INTO public.round_player_medals VALUES (25788, 554, 2);
INSERT INTO public.round_player_medals VALUES (25788, 560, 3);
INSERT INTO public.round_player_medals VALUES (25788, 613, 1);
INSERT INTO public.round_player_medals VALUES (25789, 553, 2);
INSERT INTO public.round_player_medals VALUES (25789, 546, 1);
INSERT INTO public.round_player_medals VALUES (25789, 554, 5);
INSERT INTO public.round_player_medals VALUES (25789, 562, 1);
INSERT INTO public.round_player_medals VALUES (25789, 575, 5);
INSERT INTO public.round_player_medals VALUES (25789, 584, 2);
INSERT INTO public.round_player_medals VALUES (25790, 553, 2);
INSERT INTO public.round_player_medals VALUES (25790, 554, 2);
INSERT INTO public.round_player_medals VALUES (25790, 568, 1);
INSERT INTO public.round_player_medals VALUES (25791, 550, 1);
INSERT INTO public.round_player_medals VALUES (25791, 554, 5);
INSERT INTO public.round_player_medals VALUES (25791, 562, 3);
INSERT INTO public.round_player_medals VALUES (25791, 568, 3);
INSERT INTO public.round_player_medals VALUES (25792, 578, 1);
INSERT INTO public.round_player_medals VALUES (25792, 554, 4);
INSERT INTO public.round_player_medals VALUES (25792, 568, 4);
INSERT INTO public.round_player_medals VALUES (25792, 567, 1);
INSERT INTO public.round_player_medals VALUES (25792, 555, 1);
INSERT INTO public.round_player_medals VALUES (25793, 553, 4);
INSERT INTO public.round_player_medals VALUES (25793, 550, 1);
INSERT INTO public.round_player_medals VALUES (25793, 554, 2);
INSERT INTO public.round_player_medals VALUES (25793, 588, 2);
INSERT INTO public.round_player_medals VALUES (25793, 559, 1);
INSERT INTO public.round_player_medals VALUES (25794, 547, 2);
INSERT INTO public.round_player_medals VALUES (25794, 554, 4);
INSERT INTO public.round_player_medals VALUES (25794, 561, 1);
INSERT INTO public.round_player_medals VALUES (25794, 568, 4);
INSERT INTO public.round_player_medals VALUES (25795, 554, 1);
INSERT INTO public.round_player_medals VALUES (25795, 568, 1);
INSERT INTO public.round_player_medals VALUES (25796, 554, 5);
INSERT INTO public.round_player_medals VALUES (25796, 571, 7);
INSERT INTO public.round_player_medals VALUES (25796, 547, 1);
INSERT INTO public.round_player_medals VALUES (25796, 553, 6);
INSERT INTO public.round_player_medals VALUES (25796, 550, 3);
INSERT INTO public.round_player_medals VALUES (25796, 578, 1);
INSERT INTO public.round_player_medals VALUES (25796, 562, 1);
INSERT INTO public.round_player_medals VALUES (25796, 548, 1);
INSERT INTO public.round_player_medals VALUES (25796, 606, 1);
INSERT INTO public.round_player_medals VALUES (25796, 558, 1);
INSERT INTO public.round_player_medals VALUES (25797, 553, 3);
INSERT INTO public.round_player_medals VALUES (25797, 589, 4);
INSERT INTO public.round_player_medals VALUES (25797, 554, 2);
INSERT INTO public.round_player_medals VALUES (25797, 562, 1);
INSERT INTO public.round_player_medals VALUES (25797, 559, 1);
INSERT INTO public.round_player_medals VALUES (25797, 550, 1);
INSERT INTO public.round_player_medals VALUES (25798, 554, 4);
INSERT INTO public.round_player_medals VALUES (25798, 599, 6);
INSERT INTO public.round_player_medals VALUES (25798, 553, 5);
INSERT INTO public.round_player_medals VALUES (25798, 555, 1);
INSERT INTO public.round_player_medals VALUES (25798, 550, 2);
INSERT INTO public.round_player_medals VALUES (25798, 587, 2);
INSERT INTO public.round_player_medals VALUES (25798, 606, 1);
INSERT INTO public.round_player_medals VALUES (25799, 547, 3);
INSERT INTO public.round_player_medals VALUES (25799, 546, 4);
INSERT INTO public.round_player_medals VALUES (25799, 553, 1);
INSERT INTO public.round_player_medals VALUES (25799, 554, 1);
INSERT INTO public.round_player_medals VALUES (25799, 579, 1);
INSERT INTO public.round_player_medals VALUES (25799, 573, 1);
INSERT INTO public.round_player_medals VALUES (25799, 562, 1);
INSERT INTO public.round_player_medals VALUES (25800, 550, 2);
INSERT INTO public.round_player_medals VALUES (25800, 547, 1);
INSERT INTO public.round_player_medals VALUES (25800, 556, 4);
INSERT INTO public.round_player_medals VALUES (25800, 569, 3);
INSERT INTO public.round_player_medals VALUES (25800, 562, 4);
INSERT INTO public.round_player_medals VALUES (25800, 554, 4);
INSERT INTO public.round_player_medals VALUES (25801, 554, 2);
INSERT INTO public.round_player_medals VALUES (25801, 561, 3);
INSERT INTO public.round_player_medals VALUES (25801, 560, 3);
INSERT INTO public.round_player_medals VALUES (25801, 555, 1);
INSERT INTO public.round_player_medals VALUES (25802, 559, 11);
INSERT INTO public.round_player_medals VALUES (25802, 546, 4);
INSERT INTO public.round_player_medals VALUES (25802, 554, 3);
INSERT INTO public.round_player_medals VALUES (25802, 561, 5);
INSERT INTO public.round_player_medals VALUES (25802, 555, 1);
INSERT INTO public.round_player_medals VALUES (25802, 550, 2);
INSERT INTO public.round_player_medals VALUES (25802, 553, 3);
INSERT INTO public.round_player_medals VALUES (25802, 547, 2);
INSERT INTO public.round_player_medals VALUES (25802, 610, 1);
INSERT INTO public.round_player_medals VALUES (25802, 583, 1);
INSERT INTO public.round_player_medals VALUES (25803, 546, 3);
INSERT INTO public.round_player_medals VALUES (25803, 547, 1);
INSERT INTO public.round_player_medals VALUES (25803, 553, 5);
INSERT INTO public.round_player_medals VALUES (25803, 551, 1);
INSERT INTO public.round_player_medals VALUES (25803, 586, 3);
INSERT INTO public.round_player_medals VALUES (25803, 554, 1);
INSERT INTO public.round_player_medals VALUES (25803, 583, 1);
INSERT INTO public.round_player_medals VALUES (25804, 547, 3);
INSERT INTO public.round_player_medals VALUES (25804, 554, 3);
INSERT INTO public.round_player_medals VALUES (25804, 571, 3);
INSERT INTO public.round_player_medals VALUES (25804, 553, 2);
INSERT INTO public.round_player_medals VALUES (25806, 559, 14);
INSERT INTO public.round_player_medals VALUES (25806, 550, 1);
INSERT INTO public.round_player_medals VALUES (25806, 554, 4);
INSERT INTO public.round_player_medals VALUES (25806, 603, 1);
INSERT INTO public.round_player_medals VALUES (25806, 561, 6);
INSERT INTO public.round_player_medals VALUES (25806, 610, 3);
INSERT INTO public.round_player_medals VALUES (25806, 553, 6);
INSERT INTO public.round_player_medals VALUES (25806, 587, 1);
INSERT INTO public.round_player_medals VALUES (25806, 574, 1);
INSERT INTO public.round_player_medals VALUES (25807, 553, 3);
INSERT INTO public.round_player_medals VALUES (25807, 554, 8);
INSERT INTO public.round_player_medals VALUES (25807, 603, 1);
INSERT INTO public.round_player_medals VALUES (25807, 561, 8);
INSERT INTO public.round_player_medals VALUES (25807, 560, 8);
INSERT INTO public.round_player_medals VALUES (25807, 550, 1);
INSERT INTO public.round_player_medals VALUES (25807, 574, 1);
INSERT INTO public.round_player_medals VALUES (25808, 547, 2);
INSERT INTO public.round_player_medals VALUES (25808, 553, 3);
INSERT INTO public.round_player_medals VALUES (25808, 546, 4);
INSERT INTO public.round_player_medals VALUES (25808, 554, 1);
INSERT INTO public.round_player_medals VALUES (25808, 573, 2);
INSERT INTO public.round_player_medals VALUES (25808, 550, 1);
INSERT INTO public.round_player_medals VALUES (25808, 559, 1);
INSERT INTO public.round_player_medals VALUES (25809, 554, 2);
INSERT INTO public.round_player_medals VALUES (25809, 595, 2);
INSERT INTO public.round_player_medals VALUES (25809, 573, 2);
INSERT INTO public.round_player_medals VALUES (25809, 577, 1);
INSERT INTO public.round_player_medals VALUES (25810, 554, 3);
INSERT INTO public.round_player_medals VALUES (25810, 589, 2);
INSERT INTO public.round_player_medals VALUES (25810, 553, 1);
INSERT INTO public.round_player_medals VALUES (25811, 546, 3);
INSERT INTO public.round_player_medals VALUES (25811, 553, 1);
INSERT INTO public.round_player_medals VALUES (25811, 554, 3);
INSERT INTO public.round_player_medals VALUES (25811, 599, 3);
INSERT INTO public.round_player_medals VALUES (25812, 553, 4);
INSERT INTO public.round_player_medals VALUES (25812, 550, 2);
INSERT INTO public.round_player_medals VALUES (25812, 571, 2);
INSERT INTO public.round_player_medals VALUES (25812, 554, 1);
INSERT INTO public.round_player_medals VALUES (25813, 555, 1);
INSERT INTO public.round_player_medals VALUES (25813, 559, 1);
INSERT INTO public.round_player_medals VALUES (25813, 554, 3);
INSERT INTO public.round_player_medals VALUES (25813, 568, 3);
INSERT INTO public.round_player_medals VALUES (25813, 562, 1);
INSERT INTO public.round_player_medals VALUES (25814, 553, 1);
INSERT INTO public.round_player_medals VALUES (25815, 553, 1);
INSERT INTO public.round_player_medals VALUES (25815, 554, 4);
INSERT INTO public.round_player_medals VALUES (25815, 571, 3);
INSERT INTO public.round_player_medals VALUES (25816, 553, 5);
INSERT INTO public.round_player_medals VALUES (25816, 559, 1);
INSERT INTO public.round_player_medals VALUES (25816, 554, 2);
INSERT INTO public.round_player_medals VALUES (25816, 568, 2);
INSERT INTO public.round_player_medals VALUES (25816, 562, 1);
INSERT INTO public.round_player_medals VALUES (25816, 547, 3);
INSERT INTO public.round_player_medals VALUES (25816, 550, 2);
INSERT INTO public.round_player_medals VALUES (25817, 550, 2);
INSERT INTO public.round_player_medals VALUES (25817, 554, 1);
INSERT INTO public.round_player_medals VALUES (25817, 603, 1);
INSERT INTO public.round_player_medals VALUES (25817, 570, 6);
INSERT INTO public.round_player_medals VALUES (25817, 562, 2);
INSERT INTO public.round_player_medals VALUES (25817, 553, 7);
INSERT INTO public.round_player_medals VALUES (25817, 548, 1);
INSERT INTO public.round_player_medals VALUES (25817, 547, 3);
INSERT INTO public.round_player_medals VALUES (25817, 574, 1);
INSERT INTO public.round_player_medals VALUES (25817, 558, 1);
INSERT INTO public.round_player_medals VALUES (25818, 550, 5);
INSERT INTO public.round_player_medals VALUES (25818, 603, 1);
INSERT INTO public.round_player_medals VALUES (25818, 586, 5);
INSERT INTO public.round_player_medals VALUES (25818, 554, 4);
INSERT INTO public.round_player_medals VALUES (25818, 546, 3);
INSERT INTO public.round_player_medals VALUES (25818, 553, 4);
INSERT INTO public.round_player_medals VALUES (25818, 574, 1);
INSERT INTO public.round_player_medals VALUES (25818, 609, 1);
INSERT INTO public.round_player_medals VALUES (25819, 547, 3);
INSERT INTO public.round_player_medals VALUES (25819, 553, 11);
INSERT INTO public.round_player_medals VALUES (25819, 554, 2);
INSERT INTO public.round_player_medals VALUES (25819, 586, 2);
INSERT INTO public.round_player_medals VALUES (25819, 549, 1);
INSERT INTO public.round_player_medals VALUES (25819, 559, 1);
INSERT INTO public.round_player_medals VALUES (25819, 583, 1);
INSERT INTO public.round_player_medals VALUES (25820, 602, 1);
INSERT INTO public.round_player_medals VALUES (25820, 546, 1);
INSERT INTO public.round_player_medals VALUES (25820, 554, 2);
INSERT INTO public.round_player_medals VALUES (25820, 581, 2);
INSERT INTO public.round_player_medals VALUES (25820, 553, 1);
INSERT INTO public.round_player_medals VALUES (25820, 559, 1);
INSERT INTO public.round_player_medals VALUES (25821, 559, 1);
INSERT INTO public.round_player_medals VALUES (25821, 547, 1);
INSERT INTO public.round_player_medals VALUES (25821, 554, 1);
INSERT INTO public.round_player_medals VALUES (25821, 569, 1);
INSERT INTO public.round_player_medals VALUES (25822, 559, 17);
INSERT INTO public.round_player_medals VALUES (25822, 547, 3);
INSERT INTO public.round_player_medals VALUES (25822, 561, 5);
INSERT INTO public.round_player_medals VALUES (25822, 554, 3);
INSERT INTO public.round_player_medals VALUES (25822, 567, 1);
INSERT INTO public.round_player_medals VALUES (25822, 550, 1);
INSERT INTO public.round_player_medals VALUES (25822, 553, 3);
INSERT INTO public.round_player_medals VALUES (25822, 546, 3);
INSERT INTO public.round_player_medals VALUES (25822, 549, 2);
INSERT INTO public.round_player_medals VALUES (25822, 610, 2);
INSERT INTO public.round_player_medals VALUES (25822, 606, 1);
INSERT INTO public.round_player_medals VALUES (25823, 547, 5);
INSERT INTO public.round_player_medals VALUES (25823, 554, 4);
INSERT INTO public.round_player_medals VALUES (25823, 561, 5);
INSERT INTO public.round_player_medals VALUES (25823, 560, 5);
INSERT INTO public.round_player_medals VALUES (25823, 549, 2);
INSERT INTO public.round_player_medals VALUES (25823, 553, 1);
INSERT INTO public.round_player_medals VALUES (25823, 606, 1);
INSERT INTO public.round_player_medals VALUES (25824, 546, 3);
INSERT INTO public.round_player_medals VALUES (25824, 553, 2);
INSERT INTO public.round_player_medals VALUES (25824, 547, 3);
INSERT INTO public.round_player_medals VALUES (25824, 554, 2);
INSERT INTO public.round_player_medals VALUES (25824, 552, 3);
INSERT INTO public.round_player_medals VALUES (25824, 568, 3);
INSERT INTO public.round_player_medals VALUES (25824, 560, 3);
INSERT INTO public.round_player_medals VALUES (25824, 562, 1);
INSERT INTO public.round_player_medals VALUES (25825, 547, 12);
INSERT INTO public.round_player_medals VALUES (25825, 553, 3);
INSERT INTO public.round_player_medals VALUES (25825, 550, 2);
INSERT INTO public.round_player_medals VALUES (25825, 554, 4);
INSERT INTO public.round_player_medals VALUES (25825, 576, 6);
INSERT INTO public.round_player_medals VALUES (25825, 606, 1);
INSERT INTO public.round_player_medals VALUES (25825, 558, 1);
INSERT INTO public.round_player_medals VALUES (25826, 546, 1);
INSERT INTO public.round_player_medals VALUES (25826, 548, 3);
INSERT INTO public.round_player_medals VALUES (25826, 553, 2);
INSERT INTO public.round_player_medals VALUES (25826, 547, 1);
INSERT INTO public.round_player_medals VALUES (25826, 550, 1);
INSERT INTO public.round_player_medals VALUES (25826, 599, 4);
INSERT INTO public.round_player_medals VALUES (25826, 587, 1);
INSERT INTO public.round_player_medals VALUES (25826, 554, 2);
INSERT INTO public.round_player_medals VALUES (25826, 606, 1);
INSERT INTO public.round_player_medals VALUES (25826, 609, 1);
INSERT INTO public.round_player_medals VALUES (25827, 547, 1);
INSERT INTO public.round_player_medals VALUES (25827, 586, 3);
INSERT INTO public.round_player_medals VALUES (25827, 554, 1);
INSERT INTO public.round_player_medals VALUES (25828, 553, 1);
INSERT INTO public.round_player_medals VALUES (25828, 546, 1);
INSERT INTO public.round_player_medals VALUES (25828, 550, 1);
INSERT INTO public.round_player_medals VALUES (25828, 548, 1);
INSERT INTO public.round_player_medals VALUES (25828, 554, 2);
INSERT INTO public.round_player_medals VALUES (25828, 588, 2);
INSERT INTO public.round_player_medals VALUES (25828, 606, 1);
INSERT INTO public.round_player_medals VALUES (25830, 553, 1);
INSERT INTO public.round_player_medals VALUES (25830, 554, 4);
INSERT INTO public.round_player_medals VALUES (25830, 561, 4);
INSERT INTO public.round_player_medals VALUES (25830, 568, 4);
INSERT INTO public.round_player_medals VALUES (25830, 547, 1);
INSERT INTO public.round_player_medals VALUES (25831, 553, 1);
INSERT INTO public.round_player_medals VALUES (25831, 554, 1);
INSERT INTO public.round_player_medals VALUES (25831, 568, 1);
INSERT INTO public.round_player_medals VALUES (25831, 561, 1);
INSERT INTO public.round_player_medals VALUES (25832, 547, 1);
INSERT INTO public.round_player_medals VALUES (25832, 553, 1);
INSERT INTO public.round_player_medals VALUES (25832, 546, 2);
INSERT INTO public.round_player_medals VALUES (25832, 551, 1);
INSERT INTO public.round_player_medals VALUES (25832, 568, 3);
INSERT INTO public.round_player_medals VALUES (25832, 554, 3);
INSERT INTO public.round_player_medals VALUES (25832, 562, 1);
INSERT INTO public.round_player_medals VALUES (25834, 546, 1);
INSERT INTO public.round_player_medals VALUES (25834, 554, 5);
INSERT INTO public.round_player_medals VALUES (25834, 579, 4);
INSERT INTO public.round_player_medals VALUES (25834, 553, 1);
INSERT INTO public.round_player_medals VALUES (25834, 562, 1);
INSERT INTO public.round_player_medals VALUES (25835, 546, 2);
INSERT INTO public.round_player_medals VALUES (25835, 553, 10);
INSERT INTO public.round_player_medals VALUES (25835, 547, 2);
INSERT INTO public.round_player_medals VALUES (25835, 550, 3);
INSERT INTO public.round_player_medals VALUES (25835, 551, 1);
INSERT INTO public.round_player_medals VALUES (25835, 586, 5);
INSERT INTO public.round_player_medals VALUES (25835, 556, 2);
INSERT INTO public.round_player_medals VALUES (25835, 554, 2);
INSERT INTO public.round_player_medals VALUES (25835, 548, 1);
INSERT INTO public.round_player_medals VALUES (25835, 574, 1);
INSERT INTO public.round_player_medals VALUES (25836, 553, 2);
INSERT INTO public.round_player_medals VALUES (25836, 554, 1);
INSERT INTO public.round_player_medals VALUES (25836, 571, 1);
INSERT INTO public.round_player_medals VALUES (25836, 550, 1);
INSERT INTO public.round_player_medals VALUES (25837, 613, 1);
INSERT INTO public.round_player_medals VALUES (25837, 556, 1);
INSERT INTO public.round_player_medals VALUES (25837, 562, 1);
INSERT INTO public.round_player_medals VALUES (25837, 550, 1);
INSERT INTO public.round_player_medals VALUES (25837, 549, 2);
INSERT INTO public.round_player_medals VALUES (25838, 559, 17);
INSERT INTO public.round_player_medals VALUES (25838, 548, 2);
INSERT INTO public.round_player_medals VALUES (25838, 561, 7);
INSERT INTO public.round_player_medals VALUES (25838, 567, 2);
INSERT INTO public.round_player_medals VALUES (25838, 550, 1);
INSERT INTO public.round_player_medals VALUES (25838, 553, 5);
INSERT INTO public.round_player_medals VALUES (25838, 547, 5);
INSERT INTO public.round_player_medals VALUES (25838, 554, 4);
INSERT INTO public.round_player_medals VALUES (25838, 610, 2);
INSERT INTO public.round_player_medals VALUES (25838, 574, 1);
INSERT INTO public.round_player_medals VALUES (25838, 558, 1);
INSERT INTO public.round_player_medals VALUES (25839, 547, 5);
INSERT INTO public.round_player_medals VALUES (25839, 554, 7);
INSERT INTO public.round_player_medals VALUES (25839, 561, 7);
INSERT INTO public.round_player_medals VALUES (25839, 560, 7);
INSERT INTO public.round_player_medals VALUES (25839, 546, 1);
INSERT INTO public.round_player_medals VALUES (25839, 550, 1);
INSERT INTO public.round_player_medals VALUES (25839, 553, 1);
INSERT INTO public.round_player_medals VALUES (25839, 574, 1);
INSERT INTO public.round_player_medals VALUES (25840, 546, 1);
INSERT INTO public.round_player_medals VALUES (25840, 547, 2);
INSERT INTO public.round_player_medals VALUES (25840, 553, 2);
INSERT INTO public.round_player_medals VALUES (25840, 554, 1);
INSERT INTO public.round_player_medals VALUES (25840, 591, 1);
INSERT INTO public.round_player_medals VALUES (25841, 554, 4);
INSERT INTO public.round_player_medals VALUES (25841, 569, 4);
INSERT INTO public.round_player_medals VALUES (25841, 553, 3);
INSERT INTO public.round_player_medals VALUES (25841, 547, 1);
INSERT INTO public.round_player_medals VALUES (25841, 574, 1);
INSERT INTO public.round_player_medals VALUES (25842, 554, 7);
INSERT INTO public.round_player_medals VALUES (25842, 552, 6);
INSERT INTO public.round_player_medals VALUES (25842, 561, 6);
INSERT INTO public.round_player_medals VALUES (25842, 594, 3);
INSERT INTO public.round_player_medals VALUES (25842, 577, 1);
INSERT INTO public.round_player_medals VALUES (25842, 562, 1);
INSERT INTO public.round_player_medals VALUES (25842, 547, 2);
INSERT INTO public.round_player_medals VALUES (25842, 553, 1);
INSERT INTO public.round_player_medals VALUES (25842, 550, 1);
INSERT INTO public.round_player_medals VALUES (25842, 559, 1);
INSERT INTO public.round_player_medals VALUES (25842, 555, 1);
INSERT INTO public.round_player_medals VALUES (25842, 574, 1);
INSERT INTO public.round_player_medals VALUES (25843, 547, 1);
INSERT INTO public.round_player_medals VALUES (25843, 554, 3);
INSERT INTO public.round_player_medals VALUES (25843, 599, 3);
INSERT INTO public.round_player_medals VALUES (25843, 574, 1);
INSERT INTO public.round_player_medals VALUES (25844, 547, 1);
INSERT INTO public.round_player_medals VALUES (25844, 554, 1);
INSERT INTO public.round_player_medals VALUES (25844, 592, 1);
INSERT INTO public.round_player_medals VALUES (25844, 569, 1);
INSERT INTO public.round_player_medals VALUES (25844, 562, 1);
INSERT INTO public.round_player_medals VALUES (25845, 554, 5);
INSERT INTO public.round_player_medals VALUES (25845, 561, 1);
INSERT INTO public.round_player_medals VALUES (25845, 568, 4);
INSERT INTO public.round_player_medals VALUES (25847, 602, 1);
INSERT INTO public.round_player_medals VALUES (25849, 547, 3);
INSERT INTO public.round_player_medals VALUES (25849, 554, 4);
INSERT INTO public.round_player_medals VALUES (25849, 576, 6);
INSERT INTO public.round_player_medals VALUES (25849, 553, 6);
INSERT INTO public.round_player_medals VALUES (25849, 574, 1);
INSERT INTO public.round_player_medals VALUES (25850, 567, 1);
INSERT INTO public.round_player_medals VALUES (25850, 553, 4);
INSERT INTO public.round_player_medals VALUES (25850, 546, 1);
INSERT INTO public.round_player_medals VALUES (25850, 559, 1);
INSERT INTO public.round_player_medals VALUES (25851, 554, 6);
INSERT INTO public.round_player_medals VALUES (25851, 605, 5);
INSERT INTO public.round_player_medals VALUES (25851, 563, 4);
INSERT INTO public.round_player_medals VALUES (25851, 552, 5);
INSERT INTO public.round_player_medals VALUES (25851, 546, 4);
INSERT INTO public.round_player_medals VALUES (25851, 547, 3);
INSERT INTO public.round_player_medals VALUES (25851, 553, 1);
INSERT INTO public.round_player_medals VALUES (25851, 562, 1);
INSERT INTO public.round_player_medals VALUES (25852, 546, 3);
INSERT INTO public.round_player_medals VALUES (25852, 553, 7);
INSERT INTO public.round_player_medals VALUES (25852, 579, 8);
INSERT INTO public.round_player_medals VALUES (25852, 547, 1);
INSERT INTO public.round_player_medals VALUES (25852, 587, 1);
INSERT INTO public.round_player_medals VALUES (25852, 567, 1);
INSERT INTO public.round_player_medals VALUES (25852, 554, 4);
INSERT INTO public.round_player_medals VALUES (25852, 562, 1);
INSERT INTO public.round_player_medals VALUES (25852, 594, 1);
INSERT INTO public.round_player_medals VALUES (25853, 546, 1);
INSERT INTO public.round_player_medals VALUES (25853, 553, 2);
INSERT INTO public.round_player_medals VALUES (25853, 554, 1);
INSERT INTO public.round_player_medals VALUES (25853, 614, 1);
INSERT INTO public.round_player_medals VALUES (25853, 576, 1);
INSERT INTO public.round_player_medals VALUES (25854, 546, 1);
INSERT INTO public.round_player_medals VALUES (25854, 554, 1);
INSERT INTO public.round_player_medals VALUES (25855, 554, 1);
INSERT INTO public.round_player_medals VALUES (25855, 614, 1);
INSERT INTO public.round_player_medals VALUES (25855, 576, 1);
INSERT INTO public.round_player_medals VALUES (25856, 554, 2);
INSERT INTO public.round_player_medals VALUES (25856, 565, 2);
INSERT INTO public.round_player_medals VALUES (25857, 547, 1);
INSERT INTO public.round_player_medals VALUES (25857, 554, 3);
INSERT INTO public.round_player_medals VALUES (25857, 564, 1);
INSERT INTO public.round_player_medals VALUES (25857, 565, 1);
INSERT INTO public.round_player_medals VALUES (25858, 559, 1);
INSERT INTO public.round_player_medals VALUES (25858, 553, 1);
INSERT INTO public.round_player_medals VALUES (25858, 547, 2);
INSERT INTO public.round_player_medals VALUES (25858, 554, 2);
INSERT INTO public.round_player_medals VALUES (25858, 568, 2);
INSERT INTO public.round_player_medals VALUES (25859, 554, 1);
INSERT INTO public.round_player_medals VALUES (25860, 553, 2);
INSERT INTO public.round_player_medals VALUES (25860, 546, 1);
INSERT INTO public.round_player_medals VALUES (25860, 547, 1);
INSERT INTO public.round_player_medals VALUES (25860, 551, 1);
INSERT INTO public.round_player_medals VALUES (25860, 568, 2);
INSERT INTO public.round_player_medals VALUES (25860, 561, 2);
INSERT INTO public.round_player_medals VALUES (25860, 554, 1);
INSERT INTO public.round_player_medals VALUES (25861, 550, 2);
INSERT INTO public.round_player_medals VALUES (25861, 554, 3);
INSERT INTO public.round_player_medals VALUES (25861, 586, 4);
INSERT INTO public.round_player_medals VALUES (25861, 553, 5);
INSERT INTO public.round_player_medals VALUES (25861, 546, 2);
INSERT INTO public.round_player_medals VALUES (25861, 547, 5);
INSERT INTO public.round_player_medals VALUES (25861, 567, 1);
INSERT INTO public.round_player_medals VALUES (25862, 559, 27);
INSERT INTO public.round_player_medals VALUES (25862, 550, 2);
INSERT INTO public.round_player_medals VALUES (25862, 553, 6);
INSERT INTO public.round_player_medals VALUES (25862, 554, 3);
INSERT INTO public.round_player_medals VALUES (25862, 561, 5);
INSERT INTO public.round_player_medals VALUES (25862, 546, 2);
INSERT INTO public.round_player_medals VALUES (25862, 610, 1);
INSERT INTO public.round_player_medals VALUES (25862, 606, 1);
INSERT INTO public.round_player_medals VALUES (25862, 558, 1);
INSERT INTO public.round_player_medals VALUES (25863, 553, 4);
INSERT INTO public.round_player_medals VALUES (25863, 554, 4);
INSERT INTO public.round_player_medals VALUES (25863, 561, 6);
INSERT INTO public.round_player_medals VALUES (25863, 560, 6);
INSERT INTO public.round_player_medals VALUES (25863, 547, 1);
INSERT INTO public.round_player_medals VALUES (25863, 606, 1);
INSERT INTO public.round_player_medals VALUES (25864, 548, 1);
INSERT INTO public.round_player_medals VALUES (25864, 553, 2);
INSERT INTO public.round_player_medals VALUES (25864, 550, 2);
INSERT INTO public.round_player_medals VALUES (25864, 554, 3);
INSERT INTO public.round_player_medals VALUES (25864, 571, 4);
INSERT INTO public.round_player_medals VALUES (25864, 587, 1);
INSERT INTO public.round_player_medals VALUES (25865, 546, 2);
INSERT INTO public.round_player_medals VALUES (25865, 547, 1);
INSERT INTO public.round_player_medals VALUES (25865, 561, 4);
INSERT INTO public.round_player_medals VALUES (25865, 562, 2);
INSERT INTO public.round_player_medals VALUES (25865, 548, 2);
INSERT INTO public.round_player_medals VALUES (25865, 550, 1);
INSERT INTO public.round_player_medals VALUES (25865, 553, 2);
INSERT INTO public.round_player_medals VALUES (25865, 554, 2);
INSERT INTO public.round_player_medals VALUES (25866, 547, 7);
INSERT INTO public.round_player_medals VALUES (25866, 553, 4);
INSERT INTO public.round_player_medals VALUES (25866, 554, 2);
INSERT INTO public.round_player_medals VALUES (25866, 556, 3);
INSERT INTO public.round_player_medals VALUES (25866, 569, 3);
INSERT INTO public.round_player_medals VALUES (25866, 562, 2);
INSERT INTO public.round_player_medals VALUES (25866, 549, 1);
INSERT INTO public.round_player_medals VALUES (25867, 550, 1);
INSERT INTO public.round_player_medals VALUES (25867, 554, 5);
INSERT INTO public.round_player_medals VALUES (25867, 586, 5);
INSERT INTO public.round_player_medals VALUES (25868, 550, 1);
INSERT INTO public.round_player_medals VALUES (25868, 553, 9);
INSERT INTO public.round_player_medals VALUES (25868, 554, 5);
INSERT INTO public.round_player_medals VALUES (25868, 576, 6);
INSERT INTO public.round_player_medals VALUES (25868, 547, 3);
INSERT INTO public.round_player_medals VALUES (25868, 548, 1);
INSERT INTO public.round_player_medals VALUES (25868, 546, 1);
INSERT INTO public.round_player_medals VALUES (25868, 555, 2);
INSERT INTO public.round_player_medals VALUES (25868, 587, 1);
INSERT INTO public.round_player_medals VALUES (25868, 613, 1);
INSERT INTO public.round_player_medals VALUES (25868, 583, 1);
INSERT INTO public.round_player_medals VALUES (25869, 553, 17);
INSERT INTO public.round_player_medals VALUES (25869, 576, 7);
INSERT INTO public.round_player_medals VALUES (25869, 554, 2);
INSERT INTO public.round_player_medals VALUES (25869, 550, 3);
INSERT INTO public.round_player_medals VALUES (25869, 559, 1);
INSERT INTO public.round_player_medals VALUES (25869, 555, 1);
INSERT INTO public.round_player_medals VALUES (25869, 547, 2);
INSERT INTO public.round_player_medals VALUES (25869, 557, 1);
INSERT INTO public.round_player_medals VALUES (25869, 558, 1);
INSERT INTO public.round_player_medals VALUES (25870, 554, 3);
INSERT INTO public.round_player_medals VALUES (25870, 561, 4);
INSERT INTO public.round_player_medals VALUES (25870, 555, 1);
INSERT INTO public.round_player_medals VALUES (25870, 553, 2);
INSERT INTO public.round_player_medals VALUES (25870, 559, 1);
INSERT INTO public.round_player_medals VALUES (25870, 546, 1);
INSERT INTO public.round_player_medals VALUES (25870, 562, 3);
INSERT INTO public.round_player_medals VALUES (25870, 548, 1);
INSERT INTO public.round_player_medals VALUES (25870, 602, 1);
INSERT INTO public.round_player_medals VALUES (25871, 550, 2);
INSERT INTO public.round_player_medals VALUES (25871, 553, 8);
INSERT INTO public.round_player_medals VALUES (25871, 546, 1);
INSERT INTO public.round_player_medals VALUES (25871, 555, 2);
INSERT INTO public.round_player_medals VALUES (25871, 561, 6);
INSERT INTO public.round_player_medals VALUES (25871, 560, 6);
INSERT INTO public.round_player_medals VALUES (25871, 562, 2);
INSERT INTO public.round_player_medals VALUES (25871, 554, 5);
INSERT INTO public.round_player_medals VALUES (25871, 548, 1);
INSERT INTO public.round_player_medals VALUES (25872, 550, 1);
INSERT INTO public.round_player_medals VALUES (25872, 554, 1);
INSERT INTO public.round_player_medals VALUES (25872, 568, 1);
INSERT INTO public.round_player_medals VALUES (25873, 571, 3);
INSERT INTO public.round_player_medals VALUES (25873, 553, 3);
INSERT INTO public.round_player_medals VALUES (25873, 546, 1);
INSERT INTO public.round_player_medals VALUES (25873, 554, 1);
INSERT INTO public.round_player_medals VALUES (25874, 555, 1);
INSERT INTO public.round_player_medals VALUES (25874, 553, 1);
INSERT INTO public.round_player_medals VALUES (25874, 559, 1);
INSERT INTO public.round_player_medals VALUES (25874, 554, 3);
INSERT INTO public.round_player_medals VALUES (25874, 562, 1);
INSERT INTO public.round_player_medals VALUES (25874, 608, 2);
INSERT INTO public.round_player_medals VALUES (25875, 550, 1);
INSERT INTO public.round_player_medals VALUES (25875, 553, 1);
INSERT INTO public.round_player_medals VALUES (25875, 551, 1);
INSERT INTO public.round_player_medals VALUES (25875, 571, 4);
INSERT INTO public.round_player_medals VALUES (25875, 554, 3);
INSERT INTO public.round_player_medals VALUES (25876, 554, 2);
INSERT INTO public.round_player_medals VALUES (25876, 568, 2);
INSERT INTO public.round_player_medals VALUES (25877, 554, 5);
INSERT INTO public.round_player_medals VALUES (25877, 568, 5);
INSERT INTO public.round_player_medals VALUES (25877, 553, 1);
INSERT INTO public.round_player_medals VALUES (25877, 546, 1);
INSERT INTO public.round_player_medals VALUES (25878, 547, 2);
INSERT INTO public.round_player_medals VALUES (25878, 553, 4);
INSERT INTO public.round_player_medals VALUES (25878, 554, 2);
INSERT INTO public.round_player_medals VALUES (25878, 568, 4);
INSERT INTO public.round_player_medals VALUES (25878, 550, 5);
INSERT INTO public.round_player_medals VALUES (25878, 587, 1);
INSERT INTO public.round_player_medals VALUES (25878, 555, 1);
INSERT INTO public.round_player_medals VALUES (25878, 577, 1);
INSERT INTO public.round_player_medals VALUES (25878, 582, 1);
INSERT INTO public.round_player_medals VALUES (25880, 547, 1);
INSERT INTO public.round_player_medals VALUES (25880, 550, 1);
INSERT INTO public.round_player_medals VALUES (25880, 562, 1);
INSERT INTO public.round_player_medals VALUES (25880, 570, 1);
INSERT INTO public.round_player_medals VALUES (25881, 553, 1);
INSERT INTO public.round_player_medals VALUES (25881, 547, 1);
INSERT INTO public.round_player_medals VALUES (25881, 554, 5);
INSERT INTO public.round_player_medals VALUES (25881, 615, 5);
INSERT INTO public.round_player_medals VALUES (25881, 550, 1);
INSERT INTO public.round_player_medals VALUES (25882, 547, 1);
INSERT INTO public.round_player_medals VALUES (25882, 554, 2);
INSERT INTO public.round_player_medals VALUES (25882, 569, 3);
INSERT INTO public.round_player_medals VALUES (25882, 553, 4);
INSERT INTO public.round_player_medals VALUES (25882, 548, 2);
INSERT INTO public.round_player_medals VALUES (25882, 602, 1);
INSERT INTO public.round_player_medals VALUES (25882, 555, 1);
INSERT INTO public.round_player_medals VALUES (25883, 553, 3);
INSERT INTO public.round_player_medals VALUES (25883, 550, 3);
INSERT INTO public.round_player_medals VALUES (25883, 555, 3);
INSERT INTO public.round_player_medals VALUES (25883, 567, 4);
INSERT INTO public.round_player_medals VALUES (25883, 554, 6);
INSERT INTO public.round_player_medals VALUES (25883, 586, 6);
INSERT INTO public.round_player_medals VALUES (25883, 547, 4);
INSERT INTO public.round_player_medals VALUES (25883, 548, 1);
INSERT INTO public.round_player_medals VALUES (25883, 557, 1);
INSERT INTO public.round_player_medals VALUES (25884, 548, 1);
INSERT INTO public.round_player_medals VALUES (25884, 592, 6);
INSERT INTO public.round_player_medals VALUES (25884, 608, 4);
INSERT INTO public.round_player_medals VALUES (25884, 595, 5);
INSERT INTO public.round_player_medals VALUES (25884, 555, 1);
INSERT INTO public.round_player_medals VALUES (25884, 553, 1);
INSERT INTO public.round_player_medals VALUES (25884, 554, 5);
INSERT INTO public.round_player_medals VALUES (25884, 562, 2);
INSERT INTO public.round_player_medals VALUES (25884, 567, 1);
INSERT INTO public.round_player_medals VALUES (25884, 547, 1);
INSERT INTO public.round_player_medals VALUES (25884, 557, 1);
INSERT INTO public.round_player_medals VALUES (25885, 554, 1);
INSERT INTO public.round_player_medals VALUES (25885, 594, 1);
INSERT INTO public.round_player_medals VALUES (25885, 548, 1);
INSERT INTO public.round_player_medals VALUES (25885, 546, 1);
INSERT INTO public.round_player_medals VALUES (25885, 559, 1);
INSERT INTO public.round_player_medals VALUES (25886, 547, 2);
INSERT INTO public.round_player_medals VALUES (25886, 548, 2);
INSERT INTO public.round_player_medals VALUES (25886, 554, 1);
INSERT INTO public.round_player_medals VALUES (25886, 571, 2);
INSERT INTO public.round_player_medals VALUES (25886, 567, 2);
INSERT INTO public.round_player_medals VALUES (25886, 559, 1);
INSERT INTO public.round_player_medals VALUES (25886, 553, 1);
INSERT INTO public.round_player_medals VALUES (25886, 557, 1);
INSERT INTO public.round_player_medals VALUES (25887, 547, 1);
INSERT INTO public.round_player_medals VALUES (25887, 587, 1);
INSERT INTO public.round_player_medals VALUES (25887, 551, 1);
INSERT INTO public.round_player_medals VALUES (25887, 613, 1);
INSERT INTO public.round_player_medals VALUES (25887, 594, 2);
INSERT INTO public.round_player_medals VALUES (25887, 546, 1);
INSERT INTO public.round_player_medals VALUES (25887, 554, 1);
INSERT INTO public.round_player_medals VALUES (25887, 550, 1);
INSERT INTO public.round_player_medals VALUES (25888, 567, 2);
INSERT INTO public.round_player_medals VALUES (25888, 548, 1);
INSERT INTO public.round_player_medals VALUES (25888, 550, 1);
INSERT INTO public.round_player_medals VALUES (25888, 559, 1);
INSERT INTO public.round_player_medals VALUES (25888, 554, 5);
INSERT INTO public.round_player_medals VALUES (25888, 562, 2);
INSERT INTO public.round_player_medals VALUES (25888, 568, 4);
INSERT INTO public.round_player_medals VALUES (25888, 607, 2);
INSERT INTO public.round_player_medals VALUES (25888, 592, 3);
INSERT INTO public.round_player_medals VALUES (25888, 586, 2);
INSERT INTO public.round_player_medals VALUES (25888, 556, 1);
INSERT INTO public.round_player_medals VALUES (25889, 546, 5);
INSERT INTO public.round_player_medals VALUES (25889, 559, 3);
INSERT INTO public.round_player_medals VALUES (25889, 554, 2);
INSERT INTO public.round_player_medals VALUES (25889, 552, 2);
INSERT INTO public.round_player_medals VALUES (25889, 562, 1);
INSERT INTO public.round_player_medals VALUES (25889, 547, 8);
INSERT INTO public.round_player_medals VALUES (25889, 550, 3);
INSERT INTO public.round_player_medals VALUES (25889, 553, 1);
INSERT INTO public.round_player_medals VALUES (25890, 553, 3);
INSERT INTO public.round_player_medals VALUES (25890, 554, 1);
INSERT INTO public.round_player_medals VALUES (25890, 611, 2);
INSERT INTO public.round_player_medals VALUES (25890, 550, 2);
INSERT INTO public.round_player_medals VALUES (25890, 616, 1);
INSERT INTO public.round_player_medals VALUES (25891, 553, 7);
INSERT INTO public.round_player_medals VALUES (25891, 550, 2);
INSERT INTO public.round_player_medals VALUES (25891, 546, 8);
INSERT INTO public.round_player_medals VALUES (25891, 568, 4);
INSERT INTO public.round_player_medals VALUES (25891, 562, 3);
INSERT INTO public.round_player_medals VALUES (25891, 547, 3);
INSERT INTO public.round_player_medals VALUES (25891, 567, 1);
INSERT INTO public.round_player_medals VALUES (25891, 554, 1);
INSERT INTO public.round_player_medals VALUES (25891, 557, 1);
INSERT INTO public.round_player_medals VALUES (25891, 558, 1);
INSERT INTO public.round_player_medals VALUES (25892, 567, 4);
INSERT INTO public.round_player_medals VALUES (25892, 550, 1);
INSERT INTO public.round_player_medals VALUES (25892, 554, 3);
INSERT INTO public.round_player_medals VALUES (25892, 571, 4);
INSERT INTO public.round_player_medals VALUES (25892, 553, 2);
INSERT INTO public.round_player_medals VALUES (25892, 547, 5);
INSERT INTO public.round_player_medals VALUES (25892, 548, 1);
INSERT INTO public.round_player_medals VALUES (25892, 557, 1);
INSERT INTO public.round_player_medals VALUES (25893, 554, 2);
INSERT INTO public.round_player_medals VALUES (25893, 617, 2);
INSERT INTO public.round_player_medals VALUES (25893, 562, 1);
INSERT INTO public.round_player_medals VALUES (25893, 553, 1);
INSERT INTO public.round_player_medals VALUES (25894, 567, 1);
INSERT INTO public.round_player_medals VALUES (25894, 550, 1);
INSERT INTO public.round_player_medals VALUES (25894, 553, 1);
INSERT INTO public.round_player_medals VALUES (25894, 554, 1);
INSERT INTO public.round_player_medals VALUES (25894, 571, 1);
INSERT INTO public.round_player_medals VALUES (25896, 567, 5);
INSERT INTO public.round_player_medals VALUES (25896, 555, 1);
INSERT INTO public.round_player_medals VALUES (25896, 554, 3);
INSERT INTO public.round_player_medals VALUES (25896, 563, 4);
INSERT INTO public.round_player_medals VALUES (25896, 572, 3);
INSERT INTO public.round_player_medals VALUES (25896, 548, 1);
INSERT INTO public.round_player_medals VALUES (25896, 547, 3);
INSERT INTO public.round_player_medals VALUES (25896, 553, 1);
INSERT INTO public.round_player_medals VALUES (25896, 557, 1);
INSERT INTO public.round_player_medals VALUES (25897, 554, 2);
INSERT INTO public.round_player_medals VALUES (25897, 561, 2);
INSERT INTO public.round_player_medals VALUES (25897, 546, 2);
INSERT INTO public.round_player_medals VALUES (25897, 547, 3);
INSERT INTO public.round_player_medals VALUES (25897, 550, 1);
INSERT INTO public.round_player_medals VALUES (25897, 553, 1);
INSERT INTO public.round_player_medals VALUES (25899, 547, 8);
INSERT INTO public.round_player_medals VALUES (25899, 550, 1);
INSERT INTO public.round_player_medals VALUES (25899, 553, 3);
INSERT INTO public.round_player_medals VALUES (25899, 554, 2);
INSERT INTO public.round_player_medals VALUES (25899, 586, 3);
INSERT INTO public.round_player_medals VALUES (25899, 556, 1);
INSERT INTO public.round_player_medals VALUES (25900, 547, 1);
INSERT INTO public.round_player_medals VALUES (25900, 570, 2);
INSERT INTO public.round_player_medals VALUES (25900, 602, 1);
INSERT INTO public.round_player_medals VALUES (25900, 553, 1);
INSERT INTO public.round_player_medals VALUES (25900, 550, 1);
INSERT INTO public.round_player_medals VALUES (25900, 554, 1);
INSERT INTO public.round_player_medals VALUES (25900, 562, 1);
INSERT INTO public.round_player_medals VALUES (25900, 606, 1);
INSERT INTO public.round_player_medals VALUES (25901, 559, 1);
INSERT INTO public.round_player_medals VALUES (25901, 549, 1);
INSERT INTO public.round_player_medals VALUES (25903, 548, 1);
INSERT INTO public.round_player_medals VALUES (25903, 546, 1);
INSERT INTO public.round_player_medals VALUES (25903, 550, 1);
INSERT INTO public.round_player_medals VALUES (25903, 553, 1);
INSERT INTO public.round_player_medals VALUES (25903, 568, 1);
INSERT INTO public.round_player_medals VALUES (25903, 606, 1);
INSERT INTO public.round_player_medals VALUES (25905, 549, 1);
INSERT INTO public.round_player_medals VALUES (25905, 548, 1);
INSERT INTO public.round_player_medals VALUES (25905, 553, 1);
INSERT INTO public.round_player_medals VALUES (25906, 555, 1);
INSERT INTO public.round_player_medals VALUES (25906, 549, 1);
INSERT INTO public.round_player_medals VALUES (25907, 553, 2);
INSERT INTO public.round_player_medals VALUES (25907, 550, 1);
INSERT INTO public.round_player_medals VALUES (25907, 554, 4);
INSERT INTO public.round_player_medals VALUES (25907, 556, 3);
INSERT INTO public.round_player_medals VALUES (25907, 597, 3);
INSERT INTO public.round_player_medals VALUES (25907, 547, 1);
INSERT INTO public.round_player_medals VALUES (25907, 606, 1);
INSERT INTO public.round_player_medals VALUES (25908, 547, 1);
INSERT INTO public.round_player_medals VALUES (25908, 553, 2);
INSERT INTO public.round_player_medals VALUES (25909, 546, 2);
INSERT INTO public.round_player_medals VALUES (25909, 547, 2);
INSERT INTO public.round_player_medals VALUES (25909, 551, 1);
INSERT INTO public.round_player_medals VALUES (25909, 561, 5);
INSERT INTO public.round_player_medals VALUES (25909, 553, 1);
INSERT INTO public.round_player_medals VALUES (25909, 554, 3);
INSERT INTO public.round_player_medals VALUES (25909, 559, 1);
INSERT INTO public.round_player_medals VALUES (25909, 562, 1);
INSERT INTO public.round_player_medals VALUES (25909, 567, 1);
INSERT INTO public.round_player_medals VALUES (25909, 606, 1);
INSERT INTO public.round_player_medals VALUES (25910, 554, 3);
INSERT INTO public.round_player_medals VALUES (25910, 576, 3);
INSERT INTO public.round_player_medals VALUES (25910, 553, 1);
INSERT INTO public.round_player_medals VALUES (25910, 550, 1);
INSERT INTO public.round_player_medals VALUES (25910, 606, 1);
INSERT INTO public.round_player_medals VALUES (25910, 566, 1);
INSERT INTO public.round_player_medals VALUES (25911, 561, 1);
INSERT INTO public.round_player_medals VALUES (25911, 562, 1);
INSERT INTO public.round_player_medals VALUES (25911, 546, 1);
INSERT INTO public.round_player_medals VALUES (25911, 547, 1);
INSERT INTO public.round_player_medals VALUES (25912, 554, 2);
INSERT INTO public.round_player_medals VALUES (25912, 563, 2);
INSERT INTO public.round_player_medals VALUES (25912, 606, 1);
INSERT INTO public.round_player_medals VALUES (25912, 566, 1);
INSERT INTO public.round_player_medals VALUES (25913, 546, 2);
INSERT INTO public.round_player_medals VALUES (25913, 554, 1);
INSERT INTO public.round_player_medals VALUES (25913, 570, 3);
INSERT INTO public.round_player_medals VALUES (25913, 553, 3);
INSERT INTO public.round_player_medals VALUES (25913, 550, 2);
INSERT INTO public.round_player_medals VALUES (25913, 562, 1);
INSERT INTO public.round_player_medals VALUES (25913, 606, 1);
INSERT INTO public.round_player_medals VALUES (25913, 558, 1);
INSERT INTO public.round_player_medals VALUES (25914, 554, 1);
INSERT INTO public.round_player_medals VALUES (25914, 579, 1);
INSERT INTO public.round_player_medals VALUES (25914, 562, 1);
INSERT INTO public.round_player_medals VALUES (25915, 555, 1);
INSERT INTO public.round_player_medals VALUES (25915, 554, 1);
INSERT INTO public.round_player_medals VALUES (25915, 586, 6);
INSERT INTO public.round_player_medals VALUES (25915, 546, 5);
INSERT INTO public.round_player_medals VALUES (25915, 547, 7);
INSERT INTO public.round_player_medals VALUES (25915, 553, 6);
INSERT INTO public.round_player_medals VALUES (25915, 556, 4);
INSERT INTO public.round_player_medals VALUES (25915, 587, 1);
INSERT INTO public.round_player_medals VALUES (25915, 550, 3);
INSERT INTO public.round_player_medals VALUES (25915, 548, 1);
INSERT INTO public.round_player_medals VALUES (25915, 559, 1);
INSERT INTO public.round_player_medals VALUES (25915, 557, 1);
INSERT INTO public.round_player_medals VALUES (25915, 558, 1);
INSERT INTO public.round_player_medals VALUES (25916, 553, 5);
INSERT INTO public.round_player_medals VALUES (25916, 547, 1);
INSERT INTO public.round_player_medals VALUES (25916, 548, 1);
INSERT INTO public.round_player_medals VALUES (25916, 554, 1);
INSERT INTO public.round_player_medals VALUES (25916, 617, 1);
INSERT INTO public.round_player_medals VALUES (25916, 546, 1);
INSERT INTO public.round_player_medals VALUES (25917, 550, 2);
INSERT INTO public.round_player_medals VALUES (25917, 553, 1);
INSERT INTO public.round_player_medals VALUES (25917, 563, 2);
INSERT INTO public.round_player_medals VALUES (25917, 567, 2);
INSERT INTO public.round_player_medals VALUES (25917, 554, 1);
INSERT INTO public.round_player_medals VALUES (25917, 562, 1);
INSERT INTO public.round_player_medals VALUES (25918, 567, 1);
INSERT INTO public.round_player_medals VALUES (25918, 554, 1);
INSERT INTO public.round_player_medals VALUES (25918, 616, 1);
INSERT INTO public.round_player_medals VALUES (25919, 547, 4);
INSERT INTO public.round_player_medals VALUES (25919, 553, 2);
INSERT INTO public.round_player_medals VALUES (25919, 555, 1);
INSERT INTO public.round_player_medals VALUES (25920, 554, 5);
INSERT INTO public.round_player_medals VALUES (25920, 608, 6);
INSERT INTO public.round_player_medals VALUES (25920, 562, 1);
INSERT INTO public.round_player_medals VALUES (25920, 550, 1);
INSERT INTO public.round_player_medals VALUES (25920, 557, 1);
INSERT INTO public.round_player_medals VALUES (25921, 554, 1);
INSERT INTO public.round_player_medals VALUES (25921, 614, 1);
INSERT INTO public.round_player_medals VALUES (25922, 554, 3);
INSERT INTO public.round_player_medals VALUES (25922, 562, 2);
INSERT INTO public.round_player_medals VALUES (25922, 608, 1);
INSERT INTO public.round_player_medals VALUES (25923, 554, 1);
INSERT INTO public.round_player_medals VALUES (25923, 560, 2);
INSERT INTO public.round_player_medals VALUES (25923, 553, 3);
INSERT INTO public.round_player_medals VALUES (25924, 547, 4);
INSERT INTO public.round_player_medals VALUES (25924, 553, 2);
INSERT INTO public.round_player_medals VALUES (25924, 554, 3);
INSERT INTO public.round_player_medals VALUES (25924, 568, 3);
INSERT INTO public.round_player_medals VALUES (25925, 555, 1);
INSERT INTO public.round_player_medals VALUES (25925, 567, 1);
INSERT INTO public.round_player_medals VALUES (25925, 554, 2);
INSERT INTO public.round_player_medals VALUES (25925, 562, 1);
INSERT INTO public.round_player_medals VALUES (25925, 608, 1);
INSERT INTO public.round_player_medals VALUES (25926, 550, 1);
INSERT INTO public.round_player_medals VALUES (25926, 554, 2);
INSERT INTO public.round_player_medals VALUES (25926, 563, 3);
INSERT INTO public.round_player_medals VALUES (25926, 547, 1);
INSERT INTO public.round_player_medals VALUES (25926, 555, 1);
INSERT INTO public.round_player_medals VALUES (25926, 546, 1);
INSERT INTO public.round_player_medals VALUES (25927, 548, 1);
INSERT INTO public.round_player_medals VALUES (25927, 554, 4);
INSERT INTO public.round_player_medals VALUES (25927, 594, 4);
INSERT INTO public.round_player_medals VALUES (25927, 550, 2);
INSERT INTO public.round_player_medals VALUES (25927, 546, 3);
INSERT INTO public.round_player_medals VALUES (25927, 547, 1);
INSERT INTO public.round_player_medals VALUES (25927, 553, 4);
INSERT INTO public.round_player_medals VALUES (25927, 557, 1);
INSERT INTO public.round_player_medals VALUES (25928, 553, 3);
INSERT INTO public.round_player_medals VALUES (25928, 554, 3);
INSERT INTO public.round_player_medals VALUES (25928, 599, 3);
INSERT INTO public.round_player_medals VALUES (25928, 557, 1);
INSERT INTO public.round_player_medals VALUES (25929, 551, 1);
INSERT INTO public.round_player_medals VALUES (25929, 617, 6);
INSERT INTO public.round_player_medals VALUES (25929, 550, 1);
INSERT INTO public.round_player_medals VALUES (25929, 546, 3);
INSERT INTO public.round_player_medals VALUES (25929, 547, 1);
INSERT INTO public.round_player_medals VALUES (25929, 554, 6);
INSERT INTO public.round_player_medals VALUES (25929, 555, 1);
INSERT INTO public.round_player_medals VALUES (25929, 553, 1);
INSERT INTO public.round_player_medals VALUES (25929, 562, 1);
INSERT INTO public.round_player_medals VALUES (25929, 557, 1);
INSERT INTO public.round_player_medals VALUES (25930, 546, 3);
INSERT INTO public.round_player_medals VALUES (25930, 550, 2);
INSERT INTO public.round_player_medals VALUES (25930, 554, 4);
INSERT INTO public.round_player_medals VALUES (25930, 576, 4);
INSERT INTO public.round_player_medals VALUES (25931, 553, 6);
INSERT INTO public.round_player_medals VALUES (25931, 611, 5);
INSERT INTO public.round_player_medals VALUES (25931, 562, 2);
INSERT INTO public.round_player_medals VALUES (25931, 550, 1);
INSERT INTO public.round_player_medals VALUES (25931, 547, 5);
INSERT INTO public.round_player_medals VALUES (25931, 554, 3);
INSERT INTO public.round_player_medals VALUES (25932, 550, 3);
INSERT INTO public.round_player_medals VALUES (25932, 553, 3);
INSERT INTO public.round_player_medals VALUES (25932, 548, 1);
INSERT INTO public.round_player_medals VALUES (25932, 554, 4);
INSERT INTO public.round_player_medals VALUES (25932, 576, 3);
INSERT INTO public.round_player_medals VALUES (25932, 562, 1);
INSERT INTO public.round_player_medals VALUES (25933, 546, 7);
INSERT INTO public.round_player_medals VALUES (25933, 547, 8);
INSERT INTO public.round_player_medals VALUES (25933, 553, 8);
INSERT INTO public.round_player_medals VALUES (25933, 554, 4);
INSERT INTO public.round_player_medals VALUES (25933, 569, 4);
INSERT INTO public.round_player_medals VALUES (25933, 562, 1);
INSERT INTO public.round_player_medals VALUES (25933, 577, 1);
INSERT INTO public.round_player_medals VALUES (25934, 547, 5);
INSERT INTO public.round_player_medals VALUES (25934, 546, 2);
INSERT INTO public.round_player_medals VALUES (25934, 553, 2);
INSERT INTO public.round_player_medals VALUES (25934, 550, 2);
INSERT INTO public.round_player_medals VALUES (25934, 554, 4);
INSERT INTO public.round_player_medals VALUES (25934, 569, 4);
INSERT INTO public.round_player_medals VALUES (25934, 562, 1);
INSERT INTO public.round_player_medals VALUES (25935, 546, 2);
INSERT INTO public.round_player_medals VALUES (25935, 554, 4);
INSERT INTO public.round_player_medals VALUES (25935, 576, 3);
INSERT INTO public.round_player_medals VALUES (25935, 547, 3);
INSERT INTO public.round_player_medals VALUES (25935, 553, 1);
INSERT INTO public.round_player_medals VALUES (25936, 550, 1);
INSERT INTO public.round_player_medals VALUES (25936, 554, 1);
INSERT INTO public.round_player_medals VALUES (25936, 571, 1);
INSERT INTO public.round_player_medals VALUES (25937, 554, 2);
INSERT INTO public.round_player_medals VALUES (25937, 564, 4);
INSERT INTO public.round_player_medals VALUES (25937, 547, 2);
INSERT INTO public.round_player_medals VALUES (25937, 565, 3);
INSERT INTO public.round_player_medals VALUES (25937, 553, 1);
INSERT INTO public.round_player_medals VALUES (25937, 587, 1);
INSERT INTO public.round_player_medals VALUES (25937, 606, 1);
INSERT INTO public.round_player_medals VALUES (25938, 553, 3);
INSERT INTO public.round_player_medals VALUES (25938, 559, 1);
INSERT INTO public.round_player_medals VALUES (25938, 554, 2);
INSERT INTO public.round_player_medals VALUES (25938, 608, 1);
INSERT INTO public.round_player_medals VALUES (25939, 553, 4);
INSERT INTO public.round_player_medals VALUES (25939, 547, 1);
INSERT INTO public.round_player_medals VALUES (25939, 548, 1);
INSERT INTO public.round_player_medals VALUES (25939, 554, 4);
INSERT INTO public.round_player_medals VALUES (25939, 571, 5);
INSERT INTO public.round_player_medals VALUES (25939, 562, 1);
INSERT INTO public.round_player_medals VALUES (25940, 550, 1);
INSERT INTO public.round_player_medals VALUES (25940, 553, 3);
INSERT INTO public.round_player_medals VALUES (25940, 554, 5);
INSERT INTO public.round_player_medals VALUES (25940, 565, 3);
INSERT INTO public.round_player_medals VALUES (25940, 567, 1);
INSERT INTO public.round_player_medals VALUES (25940, 564, 2);
INSERT INTO public.round_player_medals VALUES (25942, 554, 3);
INSERT INTO public.round_player_medals VALUES (25942, 617, 5);
INSERT INTO public.round_player_medals VALUES (25942, 547, 2);
INSERT INTO public.round_player_medals VALUES (25942, 553, 7);
INSERT INTO public.round_player_medals VALUES (25942, 546, 3);
INSERT INTO public.round_player_medals VALUES (25942, 550, 2);
INSERT INTO public.round_player_medals VALUES (25942, 587, 1);
INSERT INTO public.round_player_medals VALUES (25942, 559, 1);
INSERT INTO public.round_player_medals VALUES (25942, 583, 1);
INSERT INTO public.round_player_medals VALUES (25943, 554, 3);
INSERT INTO public.round_player_medals VALUES (25943, 586, 6);
INSERT INTO public.round_player_medals VALUES (25943, 546, 1);
INSERT INTO public.round_player_medals VALUES (25943, 553, 3);
INSERT INTO public.round_player_medals VALUES (25943, 550, 1);
INSERT INTO public.round_player_medals VALUES (25943, 556, 2);
INSERT INTO public.round_player_medals VALUES (25943, 547, 4);
INSERT INTO public.round_player_medals VALUES (25943, 587, 1);
INSERT INTO public.round_player_medals VALUES (25943, 567, 1);
INSERT INTO public.round_player_medals VALUES (25944, 547, 2);
INSERT INTO public.round_player_medals VALUES (25944, 554, 4);
INSERT INTO public.round_player_medals VALUES (25944, 561, 6);
INSERT INTO public.round_player_medals VALUES (25944, 560, 6);
INSERT INTO public.round_player_medals VALUES (25944, 562, 2);
INSERT INTO public.round_player_medals VALUES (25944, 553, 8);
INSERT INTO public.round_player_medals VALUES (25944, 548, 1);
INSERT INTO public.round_player_medals VALUES (25944, 559, 2);
INSERT INTO public.round_player_medals VALUES (25945, 547, 5);
INSERT INTO public.round_player_medals VALUES (25945, 546, 1);
INSERT INTO public.round_player_medals VALUES (25945, 554, 5);
INSERT INTO public.round_player_medals VALUES (25945, 573, 7);
INSERT INTO public.round_player_medals VALUES (25945, 553, 3);
INSERT INTO public.round_player_medals VALUES (25945, 559, 3);
INSERT INTO public.round_player_medals VALUES (25945, 550, 2);
INSERT INTO public.round_player_medals VALUES (25945, 587, 2);
INSERT INTO public.round_player_medals VALUES (25945, 562, 1);
INSERT INTO public.round_player_medals VALUES (25945, 558, 1);
INSERT INTO public.round_player_medals VALUES (25946, 555, 1);
INSERT INTO public.round_player_medals VALUES (25946, 546, 4);
INSERT INTO public.round_player_medals VALUES (25946, 551, 1);
INSERT INTO public.round_player_medals VALUES (25946, 563, 5);
INSERT INTO public.round_player_medals VALUES (25946, 572, 4);
INSERT INTO public.round_player_medals VALUES (25946, 550, 1);
INSERT INTO public.round_player_medals VALUES (25946, 554, 4);
INSERT INTO public.round_player_medals VALUES (25946, 547, 2);
INSERT INTO public.round_player_medals VALUES (25946, 553, 8);
INSERT INTO public.round_player_medals VALUES (25946, 562, 1);
INSERT INTO public.round_player_medals VALUES (25947, 547, 1);
INSERT INTO public.round_player_medals VALUES (25947, 567, 1);
INSERT INTO public.round_player_medals VALUES (25947, 554, 1);
INSERT INTO public.round_player_medals VALUES (25947, 568, 1);
INSERT INTO public.round_player_medals VALUES (25947, 590, 1);
INSERT INTO public.round_player_medals VALUES (25948, 546, 3);
INSERT INTO public.round_player_medals VALUES (25948, 554, 5);
INSERT INTO public.round_player_medals VALUES (25948, 568, 6);
INSERT INTO public.round_player_medals VALUES (25948, 555, 1);
INSERT INTO public.round_player_medals VALUES (25948, 562, 2);
INSERT INTO public.round_player_medals VALUES (25948, 549, 1);
INSERT INTO public.round_player_medals VALUES (25948, 553, 1);
INSERT INTO public.round_player_medals VALUES (25948, 550, 1);
INSERT INTO public.round_player_medals VALUES (25948, 587, 1);
INSERT INTO public.round_player_medals VALUES (25948, 613, 1);
INSERT INTO public.round_player_medals VALUES (25948, 547, 1);
INSERT INTO public.round_player_medals VALUES (25948, 557, 1);
INSERT INTO public.round_player_medals VALUES (25949, 555, 1);
INSERT INTO public.round_player_medals VALUES (25949, 550, 1);
INSERT INTO public.round_player_medals VALUES (25949, 553, 7);
INSERT INTO public.round_player_medals VALUES (25949, 546, 1);
INSERT INTO public.round_player_medals VALUES (25949, 554, 5);
INSERT INTO public.round_player_medals VALUES (25949, 618, 6);
INSERT INTO public.round_player_medals VALUES (25949, 547, 6);
INSERT INTO public.round_player_medals VALUES (25949, 548, 1);
INSERT INTO public.round_player_medals VALUES (25949, 562, 1);
INSERT INTO public.round_player_medals VALUES (25949, 557, 1);
INSERT INTO public.round_player_medals VALUES (25949, 558, 1);
INSERT INTO public.round_player_medals VALUES (25950, 547, 2);
INSERT INTO public.round_player_medals VALUES (25950, 550, 3);
INSERT INTO public.round_player_medals VALUES (25951, 550, 3);
INSERT INTO public.round_player_medals VALUES (25951, 577, 2);
INSERT INTO public.round_player_medals VALUES (25951, 546, 1);
INSERT INTO public.round_player_medals VALUES (25951, 547, 2);
INSERT INTO public.round_player_medals VALUES (25951, 613, 1);
INSERT INTO public.round_player_medals VALUES (25951, 559, 1);
INSERT INTO public.round_player_medals VALUES (25951, 553, 1);
INSERT INTO public.round_player_medals VALUES (25952, 559, 2);
INSERT INTO public.round_player_medals VALUES (25952, 555, 1);
INSERT INTO public.round_player_medals VALUES (25952, 553, 2);
INSERT INTO public.round_player_medals VALUES (25952, 554, 4);
INSERT INTO public.round_player_medals VALUES (25952, 592, 4);
INSERT INTO public.round_player_medals VALUES (25952, 568, 4);
INSERT INTO public.round_player_medals VALUES (25952, 607, 4);
INSERT INTO public.round_player_medals VALUES (25952, 586, 3);
INSERT INTO public.round_player_medals VALUES (25952, 556, 2);
INSERT INTO public.round_player_medals VALUES (25952, 562, 2);
INSERT INTO public.round_player_medals VALUES (25953, 546, 3);
INSERT INTO public.round_player_medals VALUES (25953, 547, 2);
INSERT INTO public.round_player_medals VALUES (25953, 554, 4);
INSERT INTO public.round_player_medals VALUES (25953, 584, 3);
INSERT INTO public.round_player_medals VALUES (25953, 575, 4);
INSERT INTO public.round_player_medals VALUES (25953, 562, 2);
INSERT INTO public.round_player_medals VALUES (25954, 554, 2);
INSERT INTO public.round_player_medals VALUES (25954, 560, 2);
INSERT INTO public.round_player_medals VALUES (25954, 562, 1);
INSERT INTO public.round_player_medals VALUES (25955, 551, 1);
INSERT INTO public.round_player_medals VALUES (25955, 576, 2);
INSERT INTO public.round_player_medals VALUES (25955, 554, 2);
INSERT INTO public.round_player_medals VALUES (25955, 614, 2);
INSERT INTO public.round_player_medals VALUES (25955, 553, 1);
INSERT INTO public.round_player_medals VALUES (25955, 546, 1);
INSERT INTO public.round_player_medals VALUES (25955, 550, 1);
INSERT INTO public.round_player_medals VALUES (25955, 557, 1);
INSERT INTO public.round_player_medals VALUES (25956, 550, 1);
INSERT INTO public.round_player_medals VALUES (25956, 554, 2);
INSERT INTO public.round_player_medals VALUES (25956, 556, 1);
INSERT INTO public.round_player_medals VALUES (25956, 594, 1);
INSERT INTO public.round_player_medals VALUES (25956, 562, 1);
INSERT INTO public.round_player_medals VALUES (25956, 588, 1);
INSERT INTO public.round_player_medals VALUES (25958, 550, 2);
INSERT INTO public.round_player_medals VALUES (25958, 553, 1);
INSERT INTO public.round_player_medals VALUES (25958, 554, 2);
INSERT INTO public.round_player_medals VALUES (25958, 563, 2);
INSERT INTO public.round_player_medals VALUES (25959, 546, 3);
INSERT INTO public.round_player_medals VALUES (25959, 550, 3);
INSERT INTO public.round_player_medals VALUES (25959, 547, 4);
INSERT INTO public.round_player_medals VALUES (25959, 548, 1);
INSERT INTO public.round_player_medals VALUES (25959, 554, 4);
INSERT INTO public.round_player_medals VALUES (25959, 619, 7);
INSERT INTO public.round_player_medals VALUES (25959, 553, 5);
INSERT INTO public.round_player_medals VALUES (25959, 555, 1);
INSERT INTO public.round_player_medals VALUES (25959, 556, 1);
INSERT INTO public.round_player_medals VALUES (25959, 557, 1);
INSERT INTO public.round_player_medals VALUES (25960, 553, 7);
INSERT INTO public.round_player_medals VALUES (25960, 550, 7);
INSERT INTO public.round_player_medals VALUES (25960, 547, 2);
INSERT INTO public.round_player_medals VALUES (25960, 549, 1);
INSERT INTO public.round_player_medals VALUES (25960, 554, 2);
INSERT INTO public.round_player_medals VALUES (25960, 586, 3);
INSERT INTO public.round_player_medals VALUES (25960, 559, 2);
INSERT INTO public.round_player_medals VALUES (25960, 556, 1);
INSERT INTO public.round_player_medals VALUES (25960, 555, 1);
INSERT INTO public.round_player_medals VALUES (25960, 583, 1);
INSERT INTO public.round_player_medals VALUES (25961, 547, 1);
INSERT INTO public.round_player_medals VALUES (25961, 554, 2);
INSERT INTO public.round_player_medals VALUES (25961, 568, 3);
INSERT INTO public.round_player_medals VALUES (25961, 608, 3);
INSERT INTO public.round_player_medals VALUES (25961, 550, 3);
INSERT INTO public.round_player_medals VALUES (25961, 562, 1);
INSERT INTO public.round_player_medals VALUES (25962, 559, 1);
INSERT INTO public.round_player_medals VALUES (25963, 578, 1);
INSERT INTO public.round_player_medals VALUES (25963, 550, 6);
INSERT INTO public.round_player_medals VALUES (25963, 547, 9);
INSERT INTO public.round_player_medals VALUES (25963, 548, 1);
INSERT INTO public.round_player_medals VALUES (25963, 551, 1);
INSERT INTO public.round_player_medals VALUES (25963, 612, 1);
INSERT INTO public.round_player_medals VALUES (25963, 586, 4);
INSERT INTO public.round_player_medals VALUES (25963, 556, 4);
INSERT INTO public.round_player_medals VALUES (25963, 553, 7);
INSERT INTO public.round_player_medals VALUES (25963, 555, 1);
INSERT INTO public.round_player_medals VALUES (25963, 546, 1);
INSERT INTO public.round_player_medals VALUES (25963, 559, 2);
INSERT INTO public.round_player_medals VALUES (25963, 554, 2);
INSERT INTO public.round_player_medals VALUES (25963, 574, 1);
INSERT INTO public.round_player_medals VALUES (25963, 558, 1);
INSERT INTO public.round_player_medals VALUES (25964, 548, 1);
INSERT INTO public.round_player_medals VALUES (25964, 553, 2);
INSERT INTO public.round_player_medals VALUES (25964, 547, 3);
INSERT INTO public.round_player_medals VALUES (25964, 570, 1);
INSERT INTO public.round_player_medals VALUES (25965, 553, 1);
INSERT INTO public.round_player_medals VALUES (25966, 559, 1);
INSERT INTO public.round_player_medals VALUES (25966, 554, 1);
INSERT INTO public.round_player_medals VALUES (25967, 574, 1);
INSERT INTO public.round_player_medals VALUES (25968, 553, 4);
INSERT INTO public.round_player_medals VALUES (25968, 569, 3);
INSERT INTO public.round_player_medals VALUES (25968, 562, 2);
INSERT INTO public.round_player_medals VALUES (25968, 547, 1);
INSERT INTO public.round_player_medals VALUES (25968, 554, 2);
INSERT INTO public.round_player_medals VALUES (25968, 574, 1);
INSERT INTO public.round_player_medals VALUES (25969, 550, 5);
INSERT INTO public.round_player_medals VALUES (25969, 554, 5);
INSERT INTO public.round_player_medals VALUES (25969, 612, 1);
INSERT INTO public.round_player_medals VALUES (25969, 619, 6);
INSERT INTO public.round_player_medals VALUES (25969, 555, 1);
INSERT INTO public.round_player_medals VALUES (25969, 547, 4);
INSERT INTO public.round_player_medals VALUES (25969, 553, 3);
INSERT INTO public.round_player_medals VALUES (25969, 546, 1);
INSERT INTO public.round_player_medals VALUES (25969, 556, 1);
INSERT INTO public.round_player_medals VALUES (25969, 574, 1);
INSERT INTO public.round_player_medals VALUES (25970, 553, 1);
INSERT INTO public.round_player_medals VALUES (25970, 548, 1);
INSERT INTO public.round_player_medals VALUES (25970, 549, 3);
INSERT INTO public.round_player_medals VALUES (25970, 554, 2);
INSERT INTO public.round_player_medals VALUES (25970, 612, 1);
INSERT INTO public.round_player_medals VALUES (25970, 568, 2);
INSERT INTO public.round_player_medals VALUES (25970, 550, 2);
INSERT INTO public.round_player_medals VALUES (25970, 590, 1);
INSERT INTO public.round_player_medals VALUES (25970, 562, 1);
INSERT INTO public.round_player_medals VALUES (25971, 553, 1);
INSERT INTO public.round_player_medals VALUES (25972, 547, 3);
INSERT INTO public.round_player_medals VALUES (25972, 548, 1);
INSERT INTO public.round_player_medals VALUES (25972, 550, 1);
INSERT INTO public.round_player_medals VALUES (25972, 553, 1);
INSERT INTO public.round_player_medals VALUES (25972, 603, 1);
INSERT INTO public.round_player_medals VALUES (25972, 577, 1);
INSERT INTO public.round_player_medals VALUES (25972, 559, 1);
INSERT INTO public.round_player_medals VALUES (25972, 554, 2);
INSERT INTO public.round_player_medals VALUES (25972, 562, 1);
INSERT INTO public.round_player_medals VALUES (25972, 594, 1);
INSERT INTO public.round_player_medals VALUES (25973, 559, 1);
INSERT INTO public.round_player_medals VALUES (25973, 547, 1);
INSERT INTO public.round_player_medals VALUES (25974, 553, 3);
INSERT INTO public.round_player_medals VALUES (25974, 554, 3);
INSERT INTO public.round_player_medals VALUES (25974, 612, 1);
INSERT INTO public.round_player_medals VALUES (25974, 610, 2);
INSERT INTO public.round_player_medals VALUES (25974, 547, 5);
INSERT INTO public.round_player_medals VALUES (25974, 559, 2);
INSERT INTO public.round_player_medals VALUES (25974, 579, 4);
INSERT INTO public.round_player_medals VALUES (25974, 548, 1);
INSERT INTO public.round_player_medals VALUES (25974, 550, 1);
INSERT INTO public.round_player_medals VALUES (25974, 574, 1);
INSERT INTO public.round_player_medals VALUES (25975, 553, 2);
INSERT INTO public.round_player_medals VALUES (25975, 550, 2);
INSERT INTO public.round_player_medals VALUES (25975, 547, 3);
INSERT INTO public.round_player_medals VALUES (25975, 554, 1);
INSERT INTO public.round_player_medals VALUES (25975, 563, 1);
INSERT INTO public.round_player_medals VALUES (25976, 578, 2);
INSERT INTO public.round_player_medals VALUES (25976, 550, 2);
INSERT INTO public.round_player_medals VALUES (25976, 549, 1);
INSERT INTO public.round_player_medals VALUES (25976, 554, 2);
INSERT INTO public.round_player_medals VALUES (25976, 612, 1);
INSERT INTO public.round_player_medals VALUES (25976, 579, 3);
INSERT INTO public.round_player_medals VALUES (25976, 552, 3);
INSERT INTO public.round_player_medals VALUES (25976, 547, 3);
INSERT INTO public.round_player_medals VALUES (25976, 546, 1);
INSERT INTO public.round_player_medals VALUES (25976, 555, 1);
INSERT INTO public.round_player_medals VALUES (25976, 562, 1);
INSERT INTO public.round_player_medals VALUES (25976, 574, 1);
INSERT INTO public.round_player_medals VALUES (25977, 546, 1);
INSERT INTO public.round_player_medals VALUES (25977, 554, 1);
INSERT INTO public.round_player_medals VALUES (25977, 584, 1);
INSERT INTO public.round_player_medals VALUES (25977, 549, 1);
INSERT INTO public.round_player_medals VALUES (25978, 550, 4);
INSERT INTO public.round_player_medals VALUES (25978, 546, 2);
INSERT INTO public.round_player_medals VALUES (25978, 553, 1);
INSERT INTO public.round_player_medals VALUES (25978, 548, 1);
INSERT INTO public.round_player_medals VALUES (25978, 581, 2);
INSERT INTO public.round_player_medals VALUES (25978, 547, 1);
INSERT INTO public.round_player_medals VALUES (25978, 555, 1);
INSERT INTO public.round_player_medals VALUES (25978, 554, 1);
INSERT INTO public.round_player_medals VALUES (25978, 562, 1);
INSERT INTO public.round_player_medals VALUES (25978, 567, 1);
INSERT INTO public.round_player_medals VALUES (25979, 547, 3);
INSERT INTO public.round_player_medals VALUES (25979, 553, 4);
INSERT INTO public.round_player_medals VALUES (25979, 554, 3);
INSERT INTO public.round_player_medals VALUES (25979, 586, 4);
INSERT INTO public.round_player_medals VALUES (25979, 549, 2);
INSERT INTO public.round_player_medals VALUES (25979, 556, 1);
INSERT INTO public.round_player_medals VALUES (25979, 546, 1);
INSERT INTO public.round_player_medals VALUES (25979, 550, 1);
INSERT INTO public.round_player_medals VALUES (25979, 558, 1);
INSERT INTO public.round_player_medals VALUES (25980, 554, 1);
INSERT INTO public.round_player_medals VALUES (25980, 568, 1);
INSERT INTO public.round_player_medals VALUES (25980, 590, 1);
INSERT INTO public.round_player_medals VALUES (25981, 553, 5);
INSERT INTO public.round_player_medals VALUES (25981, 546, 4);
INSERT INTO public.round_player_medals VALUES (25981, 547, 2);
INSERT INTO public.round_player_medals VALUES (25981, 620, 5);
INSERT INTO public.round_player_medals VALUES (25981, 611, 5);
INSERT INTO public.round_player_medals VALUES (25981, 548, 2);
INSERT INTO public.round_player_medals VALUES (25981, 554, 2);
INSERT INTO public.round_player_medals VALUES (25981, 574, 1);
INSERT INTO public.round_player_medals VALUES (25982, 553, 2);
INSERT INTO public.round_player_medals VALUES (25982, 546, 1);
INSERT INTO public.round_player_medals VALUES (25982, 550, 1);
INSERT INTO public.round_player_medals VALUES (25982, 554, 1);
INSERT INTO public.round_player_medals VALUES (25982, 579, 1);
INSERT INTO public.round_player_medals VALUES (25982, 610, 1);
INSERT INTO public.round_player_medals VALUES (25983, 547, 2);
INSERT INTO public.round_player_medals VALUES (25983, 548, 2);
INSERT INTO public.round_player_medals VALUES (25983, 581, 4);
INSERT INTO public.round_player_medals VALUES (25983, 567, 1);
INSERT INTO public.round_player_medals VALUES (25983, 550, 1);
INSERT INTO public.round_player_medals VALUES (25983, 553, 3);
INSERT INTO public.round_player_medals VALUES (25983, 554, 2);
INSERT INTO public.round_player_medals VALUES (25983, 574, 1);
INSERT INTO public.round_player_medals VALUES (25984, 548, 2);
INSERT INTO public.round_player_medals VALUES (25984, 547, 2);
INSERT INTO public.round_player_medals VALUES (25984, 619, 2);
INSERT INTO public.round_player_medals VALUES (25984, 546, 1);
INSERT INTO public.round_player_medals VALUES (25984, 550, 4);
INSERT INTO public.round_player_medals VALUES (25984, 553, 5);
INSERT INTO public.round_player_medals VALUES (25984, 559, 1);
INSERT INTO public.round_player_medals VALUES (25984, 554, 1);
INSERT INTO public.round_player_medals VALUES (25984, 549, 2);
INSERT INTO public.round_player_medals VALUES (25985, 553, 2);
INSERT INTO public.round_player_medals VALUES (25985, 551, 1);
INSERT INTO public.round_player_medals VALUES (25985, 568, 1);
INSERT INTO public.round_player_medals VALUES (25986, 554, 1);
INSERT INTO public.round_player_medals VALUES (25986, 568, 1);
INSERT INTO public.round_player_medals VALUES (25987, 554, 1);
INSERT INTO public.round_player_medals VALUES (25987, 588, 1);
INSERT INTO public.round_player_medals VALUES (25987, 550, 1);
INSERT INTO public.round_player_medals VALUES (25988, 553, 1);
INSERT INTO public.round_player_medals VALUES (25988, 588, 2);
INSERT INTO public.round_player_medals VALUES (25988, 547, 2);
INSERT INTO public.round_player_medals VALUES (25988, 554, 1);
INSERT INTO public.round_player_medals VALUES (25988, 594, 1);
INSERT INTO public.round_player_medals VALUES (25989, 559, 1);
INSERT INTO public.round_player_medals VALUES (25989, 561, 1);
INSERT INTO public.round_player_medals VALUES (25989, 549, 1);
INSERT INTO public.round_player_medals VALUES (25989, 583, 1);
INSERT INTO public.round_player_medals VALUES (25990, 553, 2);
INSERT INTO public.round_player_medals VALUES (25990, 554, 4);
INSERT INTO public.round_player_medals VALUES (25990, 570, 4);
INSERT INTO public.round_player_medals VALUES (25990, 548, 2);
INSERT INTO public.round_player_medals VALUES (25990, 574, 1);
INSERT INTO public.round_player_medals VALUES (25991, 554, 4);
INSERT INTO public.round_player_medals VALUES (25991, 568, 4);
INSERT INTO public.round_player_medals VALUES (25992, 554, 1);
INSERT INTO public.round_player_medals VALUES (25992, 570, 1);
INSERT INTO public.round_player_medals VALUES (25993, 550, 5);
INSERT INTO public.round_player_medals VALUES (25993, 553, 3);
INSERT INTO public.round_player_medals VALUES (25993, 549, 2);
INSERT INTO public.round_player_medals VALUES (25993, 548, 2);
INSERT INTO public.round_player_medals VALUES (25993, 547, 4);
INSERT INTO public.round_player_medals VALUES (25993, 554, 1);
INSERT INTO public.round_player_medals VALUES (25993, 572, 2);
INSERT INTO public.round_player_medals VALUES (25994, 547, 3);
INSERT INTO public.round_player_medals VALUES (25994, 554, 3);
INSERT INTO public.round_player_medals VALUES (25994, 617, 4);
INSERT INTO public.round_player_medals VALUES (25994, 562, 1);
INSERT INTO public.round_player_medals VALUES (25994, 574, 1);
INSERT INTO public.round_player_medals VALUES (25994, 609, 1);
INSERT INTO public.round_player_medals VALUES (25995, 553, 4);
INSERT INTO public.round_player_medals VALUES (25995, 586, 3);
INSERT INTO public.round_player_medals VALUES (25995, 556, 2);
INSERT INTO public.round_player_medals VALUES (25995, 554, 2);
INSERT INTO public.round_player_medals VALUES (25995, 606, 1);
INSERT INTO public.round_player_medals VALUES (25996, 554, 4);
INSERT INTO public.round_player_medals VALUES (25996, 568, 4);
INSERT INTO public.round_player_medals VALUES (25996, 616, 3);
INSERT INTO public.round_player_medals VALUES (25996, 553, 2);
INSERT INTO public.round_player_medals VALUES (25996, 548, 2);
INSERT INTO public.round_player_medals VALUES (25996, 606, 1);
INSERT INTO public.round_player_medals VALUES (26000, 554, 5);
INSERT INTO public.round_player_medals VALUES (26000, 563, 5);
INSERT INTO public.round_player_medals VALUES (26000, 606, 1);
INSERT INTO public.round_player_medals VALUES (26001, 553, 5);
INSERT INTO public.round_player_medals VALUES (26001, 548, 3);
INSERT INTO public.round_player_medals VALUES (26004, 554, 5);
INSERT INTO public.round_player_medals VALUES (26004, 612, 1);
INSERT INTO public.round_player_medals VALUES (26004, 561, 6);
INSERT INTO public.round_player_medals VALUES (26004, 548, 2);
INSERT INTO public.round_player_medals VALUES (26004, 553, 2);
INSERT INTO public.round_player_medals VALUES (26004, 559, 1);
INSERT INTO public.round_player_medals VALUES (26004, 606, 1);
INSERT INTO public.round_player_medals VALUES (26005, 548, 1);
INSERT INTO public.round_player_medals VALUES (26005, 553, 1);
INSERT INTO public.round_player_medals VALUES (26005, 554, 4);
INSERT INTO public.round_player_medals VALUES (26005, 605, 5);
INSERT INTO public.round_player_medals VALUES (26005, 606, 1);
INSERT INTO public.round_player_medals VALUES (26007, 550, 1);
INSERT INTO public.round_player_medals VALUES (26007, 548, 1);
INSERT INTO public.round_player_medals VALUES (26007, 547, 1);
INSERT INTO public.round_player_medals VALUES (26008, 554, 1);
INSERT INTO public.round_player_medals VALUES (26008, 601, 2);
INSERT INTO public.round_player_medals VALUES (26008, 553, 2);
INSERT INTO public.round_player_medals VALUES (26008, 547, 1);
INSERT INTO public.round_player_medals VALUES (26008, 606, 1);
INSERT INTO public.round_player_medals VALUES (26008, 566, 1);
INSERT INTO public.round_player_medals VALUES (26009, 553, 3);
INSERT INTO public.round_player_medals VALUES (26009, 550, 2);
INSERT INTO public.round_player_medals VALUES (26009, 547, 2);
INSERT INTO public.round_player_medals VALUES (26009, 551, 1);
INSERT INTO public.round_player_medals VALUES (26009, 612, 1);
INSERT INTO public.round_player_medals VALUES (26009, 618, 6);
INSERT INTO public.round_player_medals VALUES (26009, 554, 4);
INSERT INTO public.round_player_medals VALUES (26009, 567, 1);
INSERT INTO public.round_player_medals VALUES (26009, 546, 2);
INSERT INTO public.round_player_medals VALUES (26009, 606, 1);
INSERT INTO public.round_player_medals VALUES (26009, 558, 1);
INSERT INTO public.round_player_medals VALUES (26010, 547, 1);
INSERT INTO public.round_player_medals VALUES (26010, 560, 4);
INSERT INTO public.round_player_medals VALUES (26010, 559, 1);
INSERT INTO public.round_player_medals VALUES (26010, 554, 2);
INSERT INTO public.round_player_medals VALUES (26010, 606, 1);
INSERT INTO public.round_player_medals VALUES (26011, 553, 10);
INSERT INTO public.round_player_medals VALUES (26011, 547, 6);
INSERT INTO public.round_player_medals VALUES (26011, 550, 3);
INSERT INTO public.round_player_medals VALUES (26011, 551, 1);
INSERT INTO public.round_player_medals VALUES (26011, 586, 5);
INSERT INTO public.round_player_medals VALUES (26011, 546, 2);
INSERT INTO public.round_player_medals VALUES (26011, 556, 2);
INSERT INTO public.round_player_medals VALUES (26011, 587, 1);
INSERT INTO public.round_player_medals VALUES (26011, 583, 1);
INSERT INTO public.round_player_medals VALUES (26012, 547, 2);
INSERT INTO public.round_player_medals VALUES (26012, 550, 1);
INSERT INTO public.round_player_medals VALUES (26012, 546, 1);
INSERT INTO public.round_player_medals VALUES (26012, 553, 2);
INSERT INTO public.round_player_medals VALUES (26012, 554, 4);
INSERT INTO public.round_player_medals VALUES (26012, 579, 5);
INSERT INTO public.round_player_medals VALUES (26012, 548, 1);
INSERT INTO public.round_player_medals VALUES (26012, 613, 1);
INSERT INTO public.round_player_medals VALUES (26012, 606, 1);
INSERT INTO public.round_player_medals VALUES (26013, 547, 1);
INSERT INTO public.round_player_medals VALUES (26013, 546, 1);
INSERT INTO public.round_player_medals VALUES (26014, 553, 2);
INSERT INTO public.round_player_medals VALUES (26014, 554, 4);
INSERT INTO public.round_player_medals VALUES (26014, 561, 4);
INSERT INTO public.round_player_medals VALUES (26014, 550, 1);
INSERT INTO public.round_player_medals VALUES (26014, 555, 1);
INSERT INTO public.round_player_medals VALUES (26014, 547, 1);
INSERT INTO public.round_player_medals VALUES (26014, 563, 1);
INSERT INTO public.round_player_medals VALUES (26014, 590, 2);
INSERT INTO public.round_player_medals VALUES (26014, 562, 1);
INSERT INTO public.round_player_medals VALUES (26015, 547, 2);
INSERT INTO public.round_player_medals VALUES (26015, 554, 3);
INSERT INTO public.round_player_medals VALUES (26015, 568, 6);
INSERT INTO public.round_player_medals VALUES (26015, 587, 1);
INSERT INTO public.round_player_medals VALUES (26015, 606, 1);
INSERT INTO public.round_player_medals VALUES (26016, 547, 2);
INSERT INTO public.round_player_medals VALUES (26016, 554, 2);
INSERT INTO public.round_player_medals VALUES (26016, 576, 2);
INSERT INTO public.round_player_medals VALUES (26016, 556, 2);
INSERT INTO public.round_player_medals VALUES (26016, 562, 1);
INSERT INTO public.round_player_medals VALUES (26017, 547, 4);
INSERT INTO public.round_player_medals VALUES (26017, 546, 1);
INSERT INTO public.round_player_medals VALUES (26017, 550, 1);
INSERT INTO public.round_player_medals VALUES (26017, 554, 5);
INSERT INTO public.round_player_medals VALUES (26017, 576, 5);
INSERT INTO public.round_player_medals VALUES (26017, 553, 1);
INSERT INTO public.round_player_medals VALUES (26018, 546, 1);
INSERT INTO public.round_player_medals VALUES (26018, 554, 4);
INSERT INTO public.round_player_medals VALUES (26018, 617, 4);
INSERT INTO public.round_player_medals VALUES (26018, 607, 3);
INSERT INTO public.round_player_medals VALUES (26018, 562, 1);
INSERT INTO public.round_player_medals VALUES (26019, 553, 5);
INSERT INTO public.round_player_medals VALUES (26019, 550, 2);
INSERT INTO public.round_player_medals VALUES (26019, 548, 1);
INSERT INTO public.round_player_medals VALUES (26019, 589, 8);
INSERT INTO public.round_player_medals VALUES (26019, 554, 4);
INSERT INTO public.round_player_medals VALUES (26019, 562, 2);
INSERT INTO public.round_player_medals VALUES (26019, 547, 1);
INSERT INTO public.round_player_medals VALUES (26020, 547, 1);
INSERT INTO public.round_player_medals VALUES (26020, 546, 2);
INSERT INTO public.round_player_medals VALUES (26020, 550, 1);
INSERT INTO public.round_player_medals VALUES (26020, 553, 1);
INSERT INTO public.round_player_medals VALUES (26020, 554, 5);
INSERT INTO public.round_player_medals VALUES (26020, 611, 4);
INSERT INTO public.round_player_medals VALUES (26021, 547, 6);
INSERT INTO public.round_player_medals VALUES (26021, 546, 10);
INSERT INTO public.round_player_medals VALUES (26021, 548, 2);
INSERT INTO public.round_player_medals VALUES (26021, 550, 2);
INSERT INTO public.round_player_medals VALUES (26021, 553, 2);
INSERT INTO public.round_player_medals VALUES (26021, 554, 5);
INSERT INTO public.round_player_medals VALUES (26021, 569, 5);
INSERT INTO public.round_player_medals VALUES (26022, 550, 1);
INSERT INTO public.round_player_medals VALUES (26022, 546, 4);
INSERT INTO public.round_player_medals VALUES (26022, 554, 5);
INSERT INTO public.round_player_medals VALUES (26022, 577, 1);
INSERT INTO public.round_player_medals VALUES (26022, 592, 3);
INSERT INTO public.round_player_medals VALUES (26022, 570, 4);
INSERT INTO public.round_player_medals VALUES (26022, 547, 1);
INSERT INTO public.round_player_medals VALUES (26022, 562, 1);
INSERT INTO public.round_player_medals VALUES (26023, 547, 4);
INSERT INTO public.round_player_medals VALUES (26023, 554, 3);
INSERT INTO public.round_player_medals VALUES (26023, 562, 1);
INSERT INTO public.round_player_medals VALUES (26023, 553, 1);
INSERT INTO public.round_player_medals VALUES (26023, 550, 2);
INSERT INTO public.round_player_medals VALUES (26023, 579, 1);
INSERT INTO public.round_player_medals VALUES (26023, 573, 1);
INSERT INTO public.round_player_medals VALUES (26024, 550, 1);
INSERT INTO public.round_player_medals VALUES (26024, 546, 1);
INSERT INTO public.round_player_medals VALUES (26024, 554, 5);
INSERT INTO public.round_player_medals VALUES (26024, 570, 5);
INSERT INTO public.round_player_medals VALUES (26024, 547, 8);
INSERT INTO public.round_player_medals VALUES (26024, 553, 2);
INSERT INTO public.round_player_medals VALUES (26024, 577, 1);
INSERT INTO public.round_player_medals VALUES (26024, 606, 1);
INSERT INTO public.round_player_medals VALUES (26025, 547, 2);
INSERT INTO public.round_player_medals VALUES (26025, 550, 2);
INSERT INTO public.round_player_medals VALUES (26025, 553, 3);
INSERT INTO public.round_player_medals VALUES (26025, 554, 3);
INSERT INTO public.round_player_medals VALUES (26025, 570, 2);
INSERT INTO public.round_player_medals VALUES (26025, 562, 1);
INSERT INTO public.round_player_medals VALUES (26026, 550, 1);
INSERT INTO public.round_player_medals VALUES (26026, 554, 4);
INSERT INTO public.round_player_medals VALUES (26026, 563, 1);
INSERT INTO public.round_player_medals VALUES (26026, 568, 3);
INSERT INTO public.round_player_medals VALUES (26026, 595, 2);


--
-- Data for Name: round_player_scores; Type: TABLE DATA; Schema: public; Owner: dev
--

INSERT INTO public.round_player_scores VALUES (25627, 46, 10);
INSERT INTO public.round_player_scores VALUES (25627, 47, 1450);
INSERT INTO public.round_player_scores VALUES (25627, 48, 503);
INSERT INTO public.round_player_scores VALUES (25627, 49, 2);
INSERT INTO public.round_player_scores VALUES (25628, 46, 10);
INSERT INTO public.round_player_scores VALUES (25628, 49, 2);
INSERT INTO public.round_player_scores VALUES (25628, 47, 717);
INSERT INTO public.round_player_scores VALUES (25628, 48, 368);
INSERT INTO public.round_player_scores VALUES (25629, 46, 10);
INSERT INTO public.round_player_scores VALUES (25629, 47, 98);
INSERT INTO public.round_player_scores VALUES (25629, 48, 32);
INSERT INTO public.round_player_scores VALUES (25630, 46, 10);
INSERT INTO public.round_player_scores VALUES (25630, 47, 3);
INSERT INTO public.round_player_scores VALUES (25631, 46, 10);
INSERT INTO public.round_player_scores VALUES (25631, 48, 113);
INSERT INTO public.round_player_scores VALUES (25631, 47, 294);
INSERT INTO public.round_player_scores VALUES (25632, 46, 10);
INSERT INTO public.round_player_scores VALUES (25632, 47, 202);
INSERT INTO public.round_player_scores VALUES (25632, 48, 4);
INSERT INTO public.round_player_scores VALUES (25633, 46, 10);
INSERT INTO public.round_player_scores VALUES (25633, 47, 30);
INSERT INTO public.round_player_scores VALUES (25633, 48, 38);
INSERT INTO public.round_player_scores VALUES (25634, 46, 10);
INSERT INTO public.round_player_scores VALUES (25634, 47, 9);
INSERT INTO public.round_player_scores VALUES (25635, 48, 212);
INSERT INTO public.round_player_scores VALUES (25635, 46, 10);
INSERT INTO public.round_player_scores VALUES (25635, 47, 312);
INSERT INTO public.round_player_scores VALUES (25636, 46, 10);
INSERT INTO public.round_player_scores VALUES (25636, 47, 1);
INSERT INTO public.round_player_scores VALUES (25637, 46, 10);
INSERT INTO public.round_player_scores VALUES (25637, 47, 165);
INSERT INTO public.round_player_scores VALUES (25637, 48, 10);
INSERT INTO public.round_player_scores VALUES (25638, 46, 10);
INSERT INTO public.round_player_scores VALUES (25638, 47, 254);
INSERT INTO public.round_player_scores VALUES (25638, 48, 98);
INSERT INTO public.round_player_scores VALUES (25639, 46, 10);
INSERT INTO public.round_player_scores VALUES (25639, 47, 215);
INSERT INTO public.round_player_scores VALUES (25639, 48, 55);
INSERT INTO public.round_player_scores VALUES (25640, 46, 10);
INSERT INTO public.round_player_scores VALUES (25640, 47, 115);
INSERT INTO public.round_player_scores VALUES (25641, 46, 10);
INSERT INTO public.round_player_scores VALUES (25641, 47, 1189);
INSERT INTO public.round_player_scores VALUES (25641, 48, 308);
INSERT INTO public.round_player_scores VALUES (25642, 46, 10);
INSERT INTO public.round_player_scores VALUES (25642, 47, 78);
INSERT INTO public.round_player_scores VALUES (25643, 46, 10);
INSERT INTO public.round_player_scores VALUES (25643, 47, 526);
INSERT INTO public.round_player_scores VALUES (25643, 48, 208);
INSERT INTO public.round_player_scores VALUES (25644, 46, 10);
INSERT INTO public.round_player_scores VALUES (25644, 47, 266);
INSERT INTO public.round_player_scores VALUES (25644, 48, 56);
INSERT INTO public.round_player_scores VALUES (25645, 47, 279);
INSERT INTO public.round_player_scores VALUES (25645, 46, 10);
INSERT INTO public.round_player_scores VALUES (25645, 48, 87);
INSERT INTO public.round_player_scores VALUES (25646, 46, 10);
INSERT INTO public.round_player_scores VALUES (25646, 47, 46);
INSERT INTO public.round_player_scores VALUES (25646, 48, 83);
INSERT INTO public.round_player_scores VALUES (25647, 46, 10);
INSERT INTO public.round_player_scores VALUES (25647, 47, 514);
INSERT INTO public.round_player_scores VALUES (25647, 48, 226);
INSERT INTO public.round_player_scores VALUES (25648, 46, 10);
INSERT INTO public.round_player_scores VALUES (25648, 47, 266);
INSERT INTO public.round_player_scores VALUES (25648, 48, 14);
INSERT INTO public.round_player_scores VALUES (25649, 46, 10);
INSERT INTO public.round_player_scores VALUES (25649, 47, 265);
INSERT INTO public.round_player_scores VALUES (25649, 48, 90);
INSERT INTO public.round_player_scores VALUES (25650, 47, 38);
INSERT INTO public.round_player_scores VALUES (25650, 46, 10);
INSERT INTO public.round_player_scores VALUES (25651, 47, 93);
INSERT INTO public.round_player_scores VALUES (25651, 46, 10);
INSERT INTO public.round_player_scores VALUES (25651, 48, 94);
INSERT INTO public.round_player_scores VALUES (25652, 46, 10);
INSERT INTO public.round_player_scores VALUES (25653, 46, 10);
INSERT INTO public.round_player_scores VALUES (25653, 47, 478);
INSERT INTO public.round_player_scores VALUES (25653, 48, 177);
INSERT INTO public.round_player_scores VALUES (25654, 46, 10);
INSERT INTO public.round_player_scores VALUES (25654, 47, 656);
INSERT INTO public.round_player_scores VALUES (25654, 48, 24);
INSERT INTO public.round_player_scores VALUES (25655, 47, 589);
INSERT INTO public.round_player_scores VALUES (25655, 46, 10);
INSERT INTO public.round_player_scores VALUES (25655, 48, 163);
INSERT INTO public.round_player_scores VALUES (25657, 46, 10);
INSERT INTO public.round_player_scores VALUES (25657, 47, 26);
INSERT INTO public.round_player_scores VALUES (25658, 46, 10);
INSERT INTO public.round_player_scores VALUES (25658, 47, 152);
INSERT INTO public.round_player_scores VALUES (25658, 48, 53);
INSERT INTO public.round_player_scores VALUES (25659, 46, 10);
INSERT INTO public.round_player_scores VALUES (25659, 47, 803);
INSERT INTO public.round_player_scores VALUES (25659, 48, 119);
INSERT INTO public.round_player_scores VALUES (25660, 46, 10);
INSERT INTO public.round_player_scores VALUES (25660, 47, 104);
INSERT INTO public.round_player_scores VALUES (25660, 48, 34);
INSERT INTO public.round_player_scores VALUES (25661, 46, 10);
INSERT INTO public.round_player_scores VALUES (25661, 47, 56);
INSERT INTO public.round_player_scores VALUES (25661, 48, 18);
INSERT INTO public.round_player_scores VALUES (25662, 46, 10);
INSERT INTO public.round_player_scores VALUES (25662, 47, 1);
INSERT INTO public.round_player_scores VALUES (25663, 46, 10);
INSERT INTO public.round_player_scores VALUES (25663, 47, 887);
INSERT INTO public.round_player_scores VALUES (25663, 48, 235);
INSERT INTO public.round_player_scores VALUES (25664, 46, 10);
INSERT INTO public.round_player_scores VALUES (25664, 47, 1085);
INSERT INTO public.round_player_scores VALUES (25664, 48, 448);
INSERT INTO public.round_player_scores VALUES (25665, 46, 10);
INSERT INTO public.round_player_scores VALUES (25665, 47, 557);
INSERT INTO public.round_player_scores VALUES (25665, 48, 155);
INSERT INTO public.round_player_scores VALUES (25666, 46, 10);
INSERT INTO public.round_player_scores VALUES (25666, 47, 239);
INSERT INTO public.round_player_scores VALUES (25666, 48, 130);
INSERT INTO public.round_player_scores VALUES (25667, 46, 10);
INSERT INTO public.round_player_scores VALUES (25667, 47, 8);
INSERT INTO public.round_player_scores VALUES (25668, 46, 10);
INSERT INTO public.round_player_scores VALUES (25668, 47, 323);
INSERT INTO public.round_player_scores VALUES (25668, 48, 55);
INSERT INTO public.round_player_scores VALUES (25669, 46, 10);
INSERT INTO public.round_player_scores VALUES (25669, 47, 479);
INSERT INTO public.round_player_scores VALUES (25669, 48, 72);
INSERT INTO public.round_player_scores VALUES (25670, 46, 10);
INSERT INTO public.round_player_scores VALUES (25670, 47, 185);
INSERT INTO public.round_player_scores VALUES (25670, 48, 37);
INSERT INTO public.round_player_scores VALUES (25671, 46, 10);
INSERT INTO public.round_player_scores VALUES (25671, 47, 792);
INSERT INTO public.round_player_scores VALUES (25671, 48, 238);
INSERT INTO public.round_player_scores VALUES (25672, 46, 10);
INSERT INTO public.round_player_scores VALUES (25672, 47, 117);
INSERT INTO public.round_player_scores VALUES (25673, 46, 10);
INSERT INTO public.round_player_scores VALUES (25673, 47, 752);
INSERT INTO public.round_player_scores VALUES (25673, 48, 213);
INSERT INTO public.round_player_scores VALUES (25674, 46, 10);
INSERT INTO public.round_player_scores VALUES (25674, 47, 195);
INSERT INTO public.round_player_scores VALUES (25674, 48, 1);
INSERT INTO public.round_player_scores VALUES (25675, 47, 654);
INSERT INTO public.round_player_scores VALUES (25675, 46, 10);
INSERT INTO public.round_player_scores VALUES (25675, 48, 123);
INSERT INTO public.round_player_scores VALUES (25676, 46, 10);
INSERT INTO public.round_player_scores VALUES (25676, 47, 1071);
INSERT INTO public.round_player_scores VALUES (25676, 48, 455);
INSERT INTO public.round_player_scores VALUES (25677, 46, 10);
INSERT INTO public.round_player_scores VALUES (25677, 47, 1175);
INSERT INTO public.round_player_scores VALUES (25677, 48, 517);
INSERT INTO public.round_player_scores VALUES (25678, 46, 10);
INSERT INTO public.round_player_scores VALUES (25678, 47, 296);
INSERT INTO public.round_player_scores VALUES (25678, 48, 55);
INSERT INTO public.round_player_scores VALUES (25679, 46, 10);
INSERT INTO public.round_player_scores VALUES (25679, 47, 571);
INSERT INTO public.round_player_scores VALUES (25679, 48, 148);
INSERT INTO public.round_player_scores VALUES (25680, 46, 10);
INSERT INTO public.round_player_scores VALUES (25680, 47, 179);
INSERT INTO public.round_player_scores VALUES (25680, 48, 7);
INSERT INTO public.round_player_scores VALUES (25681, 46, 10);
INSERT INTO public.round_player_scores VALUES (25681, 47, 226);
INSERT INTO public.round_player_scores VALUES (25681, 48, 13);
INSERT INTO public.round_player_scores VALUES (25682, 47, 268);
INSERT INTO public.round_player_scores VALUES (25682, 46, 10);
INSERT INTO public.round_player_scores VALUES (25682, 50, 200);
INSERT INTO public.round_player_scores VALUES (25682, 48, 74);
INSERT INTO public.round_player_scores VALUES (25683, 46, 10);
INSERT INTO public.round_player_scores VALUES (25683, 47, 232);
INSERT INTO public.round_player_scores VALUES (25683, 48, 77);
INSERT INTO public.round_player_scores VALUES (25684, 46, 10);
INSERT INTO public.round_player_scores VALUES (25684, 47, 343);
INSERT INTO public.round_player_scores VALUES (25684, 48, 126);
INSERT INTO public.round_player_scores VALUES (25685, 46, 10);
INSERT INTO public.round_player_scores VALUES (25685, 47, 236);
INSERT INTO public.round_player_scores VALUES (25685, 48, 135);
INSERT INTO public.round_player_scores VALUES (25685, 50, 200);
INSERT INTO public.round_player_scores VALUES (25686, 46, 10);
INSERT INTO public.round_player_scores VALUES (25686, 47, 83);
INSERT INTO public.round_player_scores VALUES (25686, 48, 9);
INSERT INTO public.round_player_scores VALUES (25687, 46, 10);
INSERT INTO public.round_player_scores VALUES (25687, 47, 218);
INSERT INTO public.round_player_scores VALUES (25687, 48, 108);
INSERT INTO public.round_player_scores VALUES (25688, 47, 353);
INSERT INTO public.round_player_scores VALUES (25688, 46, 10);
INSERT INTO public.round_player_scores VALUES (25688, 48, 337);
INSERT INTO public.round_player_scores VALUES (25689, 46, 10);
INSERT INTO public.round_player_scores VALUES (25689, 47, 703);
INSERT INTO public.round_player_scores VALUES (25689, 48, 260);
INSERT INTO public.round_player_scores VALUES (25690, 46, 10);
INSERT INTO public.round_player_scores VALUES (25690, 47, 456);
INSERT INTO public.round_player_scores VALUES (25690, 48, 118);
INSERT INTO public.round_player_scores VALUES (25691, 46, 10);
INSERT INTO public.round_player_scores VALUES (25691, 47, 1781);
INSERT INTO public.round_player_scores VALUES (25691, 48, 526);
INSERT INTO public.round_player_scores VALUES (25692, 46, 10);
INSERT INTO public.round_player_scores VALUES (25692, 47, 76);
INSERT INTO public.round_player_scores VALUES (25692, 48, 73);
INSERT INTO public.round_player_scores VALUES (25693, 46, 10);
INSERT INTO public.round_player_scores VALUES (25693, 47, 190);
INSERT INTO public.round_player_scores VALUES (25693, 48, 77);
INSERT INTO public.round_player_scores VALUES (25694, 46, 10);
INSERT INTO public.round_player_scores VALUES (25694, 47, 318);
INSERT INTO public.round_player_scores VALUES (25694, 48, 217);
INSERT INTO public.round_player_scores VALUES (25696, 46, 10);
INSERT INTO public.round_player_scores VALUES (25696, 47, 17);
INSERT INTO public.round_player_scores VALUES (25696, 48, 7);
INSERT INTO public.round_player_scores VALUES (25697, 46, 10);
INSERT INTO public.round_player_scores VALUES (25697, 47, 69);
INSERT INTO public.round_player_scores VALUES (25697, 48, 14);
INSERT INTO public.round_player_scores VALUES (25698, 47, 352);
INSERT INTO public.round_player_scores VALUES (25698, 46, 10);
INSERT INTO public.round_player_scores VALUES (25698, 48, 54);
INSERT INTO public.round_player_scores VALUES (25699, 46, 10);
INSERT INTO public.round_player_scores VALUES (25699, 47, 541);
INSERT INTO public.round_player_scores VALUES (25699, 48, 182);
INSERT INTO public.round_player_scores VALUES (25700, 46, 10);
INSERT INTO public.round_player_scores VALUES (25700, 47, 191);
INSERT INTO public.round_player_scores VALUES (25700, 48, 37);
INSERT INTO public.round_player_scores VALUES (25701, 47, 698);
INSERT INTO public.round_player_scores VALUES (25701, 46, 10);
INSERT INTO public.round_player_scores VALUES (25701, 48, 318);
INSERT INTO public.round_player_scores VALUES (25702, 46, 10);
INSERT INTO public.round_player_scores VALUES (25702, 47, 83);
INSERT INTO public.round_player_scores VALUES (25702, 48, 45);
INSERT INTO public.round_player_scores VALUES (25703, 46, 10);
INSERT INTO public.round_player_scores VALUES (25703, 47, 591);
INSERT INTO public.round_player_scores VALUES (25703, 48, 252);
INSERT INTO public.round_player_scores VALUES (25704, 46, 10);
INSERT INTO public.round_player_scores VALUES (25704, 47, 727);
INSERT INTO public.round_player_scores VALUES (25704, 48, 159);
INSERT INTO public.round_player_scores VALUES (25705, 46, 10);
INSERT INTO public.round_player_scores VALUES (25705, 47, 302);
INSERT INTO public.round_player_scores VALUES (25705, 48, 89);
INSERT INTO public.round_player_scores VALUES (25706, 46, 10);
INSERT INTO public.round_player_scores VALUES (25706, 47, 156);
INSERT INTO public.round_player_scores VALUES (25706, 48, 69);
INSERT INTO public.round_player_scores VALUES (25706, 49, 2);
INSERT INTO public.round_player_scores VALUES (25707, 46, 10);
INSERT INTO public.round_player_scores VALUES (25707, 47, 638);
INSERT INTO public.round_player_scores VALUES (25707, 48, 42);
INSERT INTO public.round_player_scores VALUES (25708, 47, 1025);
INSERT INTO public.round_player_scores VALUES (25708, 46, 10);
INSERT INTO public.round_player_scores VALUES (25708, 48, 267);
INSERT INTO public.round_player_scores VALUES (25709, 50, 200);
INSERT INTO public.round_player_scores VALUES (25709, 46, 10);
INSERT INTO public.round_player_scores VALUES (25709, 47, 564);
INSERT INTO public.round_player_scores VALUES (25709, 48, 133);
INSERT INTO public.round_player_scores VALUES (25710, 46, 10);
INSERT INTO public.round_player_scores VALUES (25710, 47, 137);
INSERT INTO public.round_player_scores VALUES (25710, 48, 63);
INSERT INTO public.round_player_scores VALUES (25711, 50, 200);
INSERT INTO public.round_player_scores VALUES (25711, 46, 10);
INSERT INTO public.round_player_scores VALUES (25711, 47, 731);
INSERT INTO public.round_player_scores VALUES (25711, 48, 214);
INSERT INTO public.round_player_scores VALUES (25712, 46, 10);
INSERT INTO public.round_player_scores VALUES (25712, 47, 694);
INSERT INTO public.round_player_scores VALUES (25713, 46, 10);
INSERT INTO public.round_player_scores VALUES (25713, 47, 635);
INSERT INTO public.round_player_scores VALUES (25713, 48, 300);
INSERT INTO public.round_player_scores VALUES (25714, 46, 10);
INSERT INTO public.round_player_scores VALUES (25714, 47, 1117);
INSERT INTO public.round_player_scores VALUES (25714, 48, 359);
INSERT INTO public.round_player_scores VALUES (25714, 50, 200);
INSERT INTO public.round_player_scores VALUES (25715, 47, 53);
INSERT INTO public.round_player_scores VALUES (25715, 46, 10);
INSERT INTO public.round_player_scores VALUES (25716, 46, 10);
INSERT INTO public.round_player_scores VALUES (25716, 47, 166);
INSERT INTO public.round_player_scores VALUES (25717, 46, 10);
INSERT INTO public.round_player_scores VALUES (25717, 47, 3);
INSERT INTO public.round_player_scores VALUES (25718, 46, 10);
INSERT INTO public.round_player_scores VALUES (25718, 47, 63);
INSERT INTO public.round_player_scores VALUES (25718, 48, 20);
INSERT INTO public.round_player_scores VALUES (25719, 46, 10);
INSERT INTO public.round_player_scores VALUES (25719, 47, 18);
INSERT INTO public.round_player_scores VALUES (25720, 46, 10);
INSERT INTO public.round_player_scores VALUES (25720, 47, 792);
INSERT INTO public.round_player_scores VALUES (25720, 48, 168);
INSERT INTO public.round_player_scores VALUES (25721, 46, 10);
INSERT INTO public.round_player_scores VALUES (25721, 47, 93);
INSERT INTO public.round_player_scores VALUES (25721, 50, 200);
INSERT INTO public.round_player_scores VALUES (25722, 46, 10);
INSERT INTO public.round_player_scores VALUES (25722, 47, 400);
INSERT INTO public.round_player_scores VALUES (25722, 48, 105);
INSERT INTO public.round_player_scores VALUES (25723, 46, 10);
INSERT INTO public.round_player_scores VALUES (25723, 47, 1263);
INSERT INTO public.round_player_scores VALUES (25723, 48, 278);
INSERT INTO public.round_player_scores VALUES (25724, 46, 10);
INSERT INTO public.round_player_scores VALUES (25724, 48, 365);
INSERT INTO public.round_player_scores VALUES (25724, 47, 834);
INSERT INTO public.round_player_scores VALUES (25725, 46, 10);
INSERT INTO public.round_player_scores VALUES (25725, 47, 436);
INSERT INTO public.round_player_scores VALUES (25725, 48, 147);
INSERT INTO public.round_player_scores VALUES (25726, 46, 10);
INSERT INTO public.round_player_scores VALUES (25726, 47, 27);
INSERT INTO public.round_player_scores VALUES (25727, 46, 10);
INSERT INTO public.round_player_scores VALUES (25727, 47, 94);
INSERT INTO public.round_player_scores VALUES (25727, 48, 72);
INSERT INTO public.round_player_scores VALUES (25728, 46, 10);
INSERT INTO public.round_player_scores VALUES (25728, 47, 600);
INSERT INTO public.round_player_scores VALUES (25728, 48, 331);
INSERT INTO public.round_player_scores VALUES (25729, 46, 10);
INSERT INTO public.round_player_scores VALUES (25729, 47, 20);
INSERT INTO public.round_player_scores VALUES (25730, 46, 10);
INSERT INTO public.round_player_scores VALUES (25730, 47, 777);
INSERT INTO public.round_player_scores VALUES (25730, 48, 145);
INSERT INTO public.round_player_scores VALUES (25731, 47, 234);
INSERT INTO public.round_player_scores VALUES (25731, 46, 10);
INSERT INTO public.round_player_scores VALUES (25731, 48, 51);
INSERT INTO public.round_player_scores VALUES (25732, 47, 357);
INSERT INTO public.round_player_scores VALUES (25732, 46, 10);
INSERT INTO public.round_player_scores VALUES (25732, 48, 95);
INSERT INTO public.round_player_scores VALUES (25733, 46, 10);
INSERT INTO public.round_player_scores VALUES (25733, 47, 308);
INSERT INTO public.round_player_scores VALUES (25734, 46, 10);
INSERT INTO public.round_player_scores VALUES (25734, 47, 89);
INSERT INTO public.round_player_scores VALUES (25734, 48, 10);
INSERT INTO public.round_player_scores VALUES (25735, 46, 10);
INSERT INTO public.round_player_scores VALUES (25735, 47, 179);
INSERT INTO public.round_player_scores VALUES (25736, 46, 10);
INSERT INTO public.round_player_scores VALUES (25736, 47, 28);
INSERT INTO public.round_player_scores VALUES (25737, 46, 10);
INSERT INTO public.round_player_scores VALUES (25737, 47, 529);
INSERT INTO public.round_player_scores VALUES (25737, 48, 185);
INSERT INTO public.round_player_scores VALUES (25738, 46, 10);
INSERT INTO public.round_player_scores VALUES (25738, 47, 508);
INSERT INTO public.round_player_scores VALUES (25738, 48, 95);
INSERT INTO public.round_player_scores VALUES (25739, 46, 10);
INSERT INTO public.round_player_scores VALUES (25739, 47, 1325);
INSERT INTO public.round_player_scores VALUES (25739, 48, 388);
INSERT INTO public.round_player_scores VALUES (25740, 46, 10);
INSERT INTO public.round_player_scores VALUES (25740, 47, 469);
INSERT INTO public.round_player_scores VALUES (25740, 48, 89);
INSERT INTO public.round_player_scores VALUES (25741, 46, 10);
INSERT INTO public.round_player_scores VALUES (25741, 47, 68);
INSERT INTO public.round_player_scores VALUES (25741, 48, 13);
INSERT INTO public.round_player_scores VALUES (25742, 46, 10);
INSERT INTO public.round_player_scores VALUES (25742, 47, 413);
INSERT INTO public.round_player_scores VALUES (25742, 49, 2);
INSERT INTO public.round_player_scores VALUES (25742, 48, 87);
INSERT INTO public.round_player_scores VALUES (25743, 46, 10);
INSERT INTO public.round_player_scores VALUES (25743, 47, 64);
INSERT INTO public.round_player_scores VALUES (25743, 48, 32);
INSERT INTO public.round_player_scores VALUES (25744, 46, 10);
INSERT INTO public.round_player_scores VALUES (25744, 47, 27);
INSERT INTO public.round_player_scores VALUES (25745, 46, 10);
INSERT INTO public.round_player_scores VALUES (25745, 47, 210);
INSERT INTO public.round_player_scores VALUES (25745, 48, 58);
INSERT INTO public.round_player_scores VALUES (25746, 46, 10);
INSERT INTO public.round_player_scores VALUES (25746, 47, 171);
INSERT INTO public.round_player_scores VALUES (25746, 48, 49);
INSERT INTO public.round_player_scores VALUES (25747, 46, 10);
INSERT INTO public.round_player_scores VALUES (25747, 47, 247);
INSERT INTO public.round_player_scores VALUES (25747, 48, 67);
INSERT INTO public.round_player_scores VALUES (25749, 46, 10);
INSERT INTO public.round_player_scores VALUES (25749, 47, 227);
INSERT INTO public.round_player_scores VALUES (25749, 48, 43);
INSERT INTO public.round_player_scores VALUES (25750, 46, 10);
INSERT INTO public.round_player_scores VALUES (25750, 47, 858);
INSERT INTO public.round_player_scores VALUES (25750, 48, 323);
INSERT INTO public.round_player_scores VALUES (25751, 46, 10);
INSERT INTO public.round_player_scores VALUES (25751, 47, 208);
INSERT INTO public.round_player_scores VALUES (25751, 48, 25);
INSERT INTO public.round_player_scores VALUES (25752, 46, 10);
INSERT INTO public.round_player_scores VALUES (25752, 47, 447);
INSERT INTO public.round_player_scores VALUES (25752, 48, 123);
INSERT INTO public.round_player_scores VALUES (25752, 49, 2);
INSERT INTO public.round_player_scores VALUES (25753, 47, 762);
INSERT INTO public.round_player_scores VALUES (25753, 46, 10);
INSERT INTO public.round_player_scores VALUES (25753, 48, 256);
INSERT INTO public.round_player_scores VALUES (25754, 46, 10);
INSERT INTO public.round_player_scores VALUES (25754, 47, 319);
INSERT INTO public.round_player_scores VALUES (25754, 48, 79);
INSERT INTO public.round_player_scores VALUES (25755, 47, 2723);
INSERT INTO public.round_player_scores VALUES (25755, 46, 10);
INSERT INTO public.round_player_scores VALUES (25755, 48, 704);
INSERT INTO public.round_player_scores VALUES (25756, 46, 10);
INSERT INTO public.round_player_scores VALUES (25756, 47, 220);
INSERT INTO public.round_player_scores VALUES (25756, 48, 72);
INSERT INTO public.round_player_scores VALUES (25757, 50, 200);
INSERT INTO public.round_player_scores VALUES (25757, 46, 10);
INSERT INTO public.round_player_scores VALUES (25757, 48, 44);
INSERT INTO public.round_player_scores VALUES (25757, 47, 2);
INSERT INTO public.round_player_scores VALUES (25758, 46, 10);
INSERT INTO public.round_player_scores VALUES (25758, 47, 658);
INSERT INTO public.round_player_scores VALUES (25758, 48, 226);
INSERT INTO public.round_player_scores VALUES (25759, 46, 10);
INSERT INTO public.round_player_scores VALUES (25759, 47, 45);
INSERT INTO public.round_player_scores VALUES (25759, 48, 60);
INSERT INTO public.round_player_scores VALUES (25760, 46, 10);
INSERT INTO public.round_player_scores VALUES (25760, 47, 66);
INSERT INTO public.round_player_scores VALUES (25760, 48, 7);
INSERT INTO public.round_player_scores VALUES (25761, 46, 10);
INSERT INTO public.round_player_scores VALUES (25761, 47, 256);
INSERT INTO public.round_player_scores VALUES (25761, 48, 38);
INSERT INTO public.round_player_scores VALUES (25762, 46, 10);
INSERT INTO public.round_player_scores VALUES (25762, 47, 702);
INSERT INTO public.round_player_scores VALUES (25762, 48, 249);
INSERT INTO public.round_player_scores VALUES (25763, 46, 10);
INSERT INTO public.round_player_scores VALUES (25763, 47, 522);
INSERT INTO public.round_player_scores VALUES (25763, 48, 343);
INSERT INTO public.round_player_scores VALUES (25764, 46, 10);
INSERT INTO public.round_player_scores VALUES (25764, 47, 180);
INSERT INTO public.round_player_scores VALUES (25764, 48, 47);
INSERT INTO public.round_player_scores VALUES (25765, 46, 10);
INSERT INTO public.round_player_scores VALUES (25765, 47, 140);
INSERT INTO public.round_player_scores VALUES (25765, 48, 6);
INSERT INTO public.round_player_scores VALUES (25766, 46, 10);
INSERT INTO public.round_player_scores VALUES (25766, 47, 346);
INSERT INTO public.round_player_scores VALUES (25766, 48, 171);
INSERT INTO public.round_player_scores VALUES (25767, 46, 10);
INSERT INTO public.round_player_scores VALUES (25767, 47, 819);
INSERT INTO public.round_player_scores VALUES (25767, 48, 164);
INSERT INTO public.round_player_scores VALUES (25767, 49, 2);
INSERT INTO public.round_player_scores VALUES (25768, 46, 10);
INSERT INTO public.round_player_scores VALUES (25768, 47, 1147);
INSERT INTO public.round_player_scores VALUES (25768, 48, 340);
INSERT INTO public.round_player_scores VALUES (25768, 49, 4);
INSERT INTO public.round_player_scores VALUES (25769, 46, 10);
INSERT INTO public.round_player_scores VALUES (25769, 47, 87);
INSERT INTO public.round_player_scores VALUES (25769, 48, 21);
INSERT INTO public.round_player_scores VALUES (25770, 46, 10);
INSERT INTO public.round_player_scores VALUES (25770, 47, 491);
INSERT INTO public.round_player_scores VALUES (25770, 48, 92);
INSERT INTO public.round_player_scores VALUES (25771, 46, 10);
INSERT INTO public.round_player_scores VALUES (25771, 47, 544);
INSERT INTO public.round_player_scores VALUES (25771, 48, 135);
INSERT INTO public.round_player_scores VALUES (25772, 46, 10);
INSERT INTO public.round_player_scores VALUES (25772, 48, 268);
INSERT INTO public.round_player_scores VALUES (25772, 47, 703);
INSERT INTO public.round_player_scores VALUES (25773, 46, 10);
INSERT INTO public.round_player_scores VALUES (25773, 47, 515);
INSERT INTO public.round_player_scores VALUES (25773, 48, 201);
INSERT INTO public.round_player_scores VALUES (25773, 50, 200);
INSERT INTO public.round_player_scores VALUES (25774, 47, 256);
INSERT INTO public.round_player_scores VALUES (25774, 46, 10);
INSERT INTO public.round_player_scores VALUES (25774, 48, 146);
INSERT INTO public.round_player_scores VALUES (25774, 50, 200);
INSERT INTO public.round_player_scores VALUES (25775, 46, 10);
INSERT INTO public.round_player_scores VALUES (25775, 47, 414);
INSERT INTO public.round_player_scores VALUES (25775, 48, 199);
INSERT INTO public.round_player_scores VALUES (25775, 50, 200);
INSERT INTO public.round_player_scores VALUES (25776, 46, 10);
INSERT INTO public.round_player_scores VALUES (25776, 47, 590);
INSERT INTO public.round_player_scores VALUES (25776, 48, 169);
INSERT INTO public.round_player_scores VALUES (25776, 50, 200);
INSERT INTO public.round_player_scores VALUES (25777, 46, 10);
INSERT INTO public.round_player_scores VALUES (25777, 47, 283);
INSERT INTO public.round_player_scores VALUES (25777, 48, 9);
INSERT INTO public.round_player_scores VALUES (25778, 46, 10);
INSERT INTO public.round_player_scores VALUES (25778, 47, 5);
INSERT INTO public.round_player_scores VALUES (25779, 47, 472);
INSERT INTO public.round_player_scores VALUES (25779, 46, 10);
INSERT INTO public.round_player_scores VALUES (25779, 48, 205);
INSERT INTO public.round_player_scores VALUES (25779, 49, 6);
INSERT INTO public.round_player_scores VALUES (25780, 46, 10);
INSERT INTO public.round_player_scores VALUES (25780, 47, 625);
INSERT INTO public.round_player_scores VALUES (25780, 48, 262);
INSERT INTO public.round_player_scores VALUES (25780, 50, 200);
INSERT INTO public.round_player_scores VALUES (25781, 50, 200);
INSERT INTO public.round_player_scores VALUES (25781, 46, 10);
INSERT INTO public.round_player_scores VALUES (25781, 47, 126);
INSERT INTO public.round_player_scores VALUES (25781, 48, 55);
INSERT INTO public.round_player_scores VALUES (25782, 46, 10);
INSERT INTO public.round_player_scores VALUES (25782, 47, 107);
INSERT INTO public.round_player_scores VALUES (25782, 48, 34);
INSERT INTO public.round_player_scores VALUES (25783, 46, 10);
INSERT INTO public.round_player_scores VALUES (25783, 47, 520);
INSERT INTO public.round_player_scores VALUES (25783, 48, 164);
INSERT INTO public.round_player_scores VALUES (25784, 46, 10);
INSERT INTO public.round_player_scores VALUES (25784, 48, 6);
INSERT INTO public.round_player_scores VALUES (25784, 47, 21);
INSERT INTO public.round_player_scores VALUES (25785, 46, 10);
INSERT INTO public.round_player_scores VALUES (25785, 47, 86);
INSERT INTO public.round_player_scores VALUES (25785, 48, 12);
INSERT INTO public.round_player_scores VALUES (25786, 46, 10);
INSERT INTO public.round_player_scores VALUES (25786, 47, 778);
INSERT INTO public.round_player_scores VALUES (25786, 48, 312);
INSERT INTO public.round_player_scores VALUES (25786, 50, 200);
INSERT INTO public.round_player_scores VALUES (25787, 46, 10);
INSERT INTO public.round_player_scores VALUES (25787, 47, 1191);
INSERT INTO public.round_player_scores VALUES (25787, 48, 212);
INSERT INTO public.round_player_scores VALUES (25788, 46, 10);
INSERT INTO public.round_player_scores VALUES (25788, 47, 239);
INSERT INTO public.round_player_scores VALUES (25788, 48, 81);
INSERT INTO public.round_player_scores VALUES (25789, 46, 10);
INSERT INTO public.round_player_scores VALUES (25789, 47, 340);
INSERT INTO public.round_player_scores VALUES (25789, 48, 162);
INSERT INTO public.round_player_scores VALUES (25789, 50, 300);
INSERT INTO public.round_player_scores VALUES (25790, 46, 10);
INSERT INTO public.round_player_scores VALUES (25790, 47, 85);
INSERT INTO public.round_player_scores VALUES (25790, 48, 56);
INSERT INTO public.round_player_scores VALUES (25791, 46, 10);
INSERT INTO public.round_player_scores VALUES (25791, 47, 131);
INSERT INTO public.round_player_scores VALUES (25791, 48, 85);
INSERT INTO public.round_player_scores VALUES (25792, 46, 10);
INSERT INTO public.round_player_scores VALUES (25792, 47, 367);
INSERT INTO public.round_player_scores VALUES (25792, 48, 201);
INSERT INTO public.round_player_scores VALUES (25793, 46, 10);
INSERT INTO public.round_player_scores VALUES (25793, 47, 479);
INSERT INTO public.round_player_scores VALUES (25793, 48, 115);
INSERT INTO public.round_player_scores VALUES (25794, 46, 10);
INSERT INTO public.round_player_scores VALUES (25794, 47, 132);
INSERT INTO public.round_player_scores VALUES (25794, 48, 36);
INSERT INTO public.round_player_scores VALUES (25795, 46, 10);
INSERT INTO public.round_player_scores VALUES (25795, 47, 33);
INSERT INTO public.round_player_scores VALUES (25795, 48, 45);
INSERT INTO public.round_player_scores VALUES (25796, 46, 10);
INSERT INTO public.round_player_scores VALUES (25796, 47, 1043);
INSERT INTO public.round_player_scores VALUES (25796, 48, 372);
INSERT INTO public.round_player_scores VALUES (25797, 46, 10);
INSERT INTO public.round_player_scores VALUES (25797, 47, 256);
INSERT INTO public.round_player_scores VALUES (25797, 48, 71);
INSERT INTO public.round_player_scores VALUES (25798, 46, 10);
INSERT INTO public.round_player_scores VALUES (25798, 47, 790);
INSERT INTO public.round_player_scores VALUES (25798, 48, 243);
INSERT INTO public.round_player_scores VALUES (25799, 46, 10);
INSERT INTO public.round_player_scores VALUES (25799, 47, 481);
INSERT INTO public.round_player_scores VALUES (25799, 48, 142);
INSERT INTO public.round_player_scores VALUES (25800, 46, 10);
INSERT INTO public.round_player_scores VALUES (25800, 47, 1001);
INSERT INTO public.round_player_scores VALUES (25800, 48, 276);
INSERT INTO public.round_player_scores VALUES (25801, 46, 10);
INSERT INTO public.round_player_scores VALUES (25801, 47, 197);
INSERT INTO public.round_player_scores VALUES (25801, 48, 31);
INSERT INTO public.round_player_scores VALUES (25801, 50, 300);
INSERT INTO public.round_player_scores VALUES (25802, 46, 10);
INSERT INTO public.round_player_scores VALUES (25802, 47, 541);
INSERT INTO public.round_player_scores VALUES (25802, 48, 204);
INSERT INTO public.round_player_scores VALUES (25802, 50, 300);
INSERT INTO public.round_player_scores VALUES (25803, 46, 10);
INSERT INTO public.round_player_scores VALUES (25803, 47, 594);
INSERT INTO public.round_player_scores VALUES (25803, 48, 173);
INSERT INTO public.round_player_scores VALUES (25804, 46, 10);
INSERT INTO public.round_player_scores VALUES (25804, 47, 163);
INSERT INTO public.round_player_scores VALUES (25804, 48, 24);
INSERT INTO public.round_player_scores VALUES (25805, 46, 10);
INSERT INTO public.round_player_scores VALUES (25805, 47, 6);
INSERT INTO public.round_player_scores VALUES (25806, 46, 10);
INSERT INTO public.round_player_scores VALUES (25806, 47, 646);
INSERT INTO public.round_player_scores VALUES (25806, 48, 330);
INSERT INTO public.round_player_scores VALUES (25806, 49, 6);
INSERT INTO public.round_player_scores VALUES (25807, 46, 10);
INSERT INTO public.round_player_scores VALUES (25807, 47, 403);
INSERT INTO public.round_player_scores VALUES (25807, 48, 129);
INSERT INTO public.round_player_scores VALUES (25807, 49, 4);
INSERT INTO public.round_player_scores VALUES (25808, 46, 10);
INSERT INTO public.round_player_scores VALUES (25808, 47, 503);
INSERT INTO public.round_player_scores VALUES (25808, 48, 118);
INSERT INTO public.round_player_scores VALUES (25809, 46, 10);
INSERT INTO public.round_player_scores VALUES (25809, 47, 62);
INSERT INTO public.round_player_scores VALUES (25809, 48, 5);
INSERT INTO public.round_player_scores VALUES (25810, 46, 10);
INSERT INTO public.round_player_scores VALUES (25810, 47, 27);
INSERT INTO public.round_player_scores VALUES (25811, 46, 10);
INSERT INTO public.round_player_scores VALUES (25811, 47, 200);
INSERT INTO public.round_player_scores VALUES (25811, 48, 82);
INSERT INTO public.round_player_scores VALUES (25812, 46, 10);
INSERT INTO public.round_player_scores VALUES (25812, 47, 319);
INSERT INTO public.round_player_scores VALUES (25812, 48, 128);
INSERT INTO public.round_player_scores VALUES (25813, 46, 10);
INSERT INTO public.round_player_scores VALUES (25813, 47, 230);
INSERT INTO public.round_player_scores VALUES (25813, 48, 106);
INSERT INTO public.round_player_scores VALUES (25814, 46, 10);
INSERT INTO public.round_player_scores VALUES (25814, 47, 31);
INSERT INTO public.round_player_scores VALUES (25815, 47, 190);
INSERT INTO public.round_player_scores VALUES (25815, 46, 10);
INSERT INTO public.round_player_scores VALUES (25815, 48, 98);
INSERT INTO public.round_player_scores VALUES (25816, 47, 371);
INSERT INTO public.round_player_scores VALUES (25816, 46, 10);
INSERT INTO public.round_player_scores VALUES (25816, 48, 102);
INSERT INTO public.round_player_scores VALUES (25817, 47, 703);
INSERT INTO public.round_player_scores VALUES (25817, 46, 10);
INSERT INTO public.round_player_scores VALUES (25817, 48, 307);
INSERT INTO public.round_player_scores VALUES (25818, 46, 10);
INSERT INTO public.round_player_scores VALUES (25818, 47, 580);
INSERT INTO public.round_player_scores VALUES (25818, 48, 173);
INSERT INTO public.round_player_scores VALUES (25819, 46, 10);
INSERT INTO public.round_player_scores VALUES (25819, 47, 789);
INSERT INTO public.round_player_scores VALUES (25819, 48, 134);
INSERT INTO public.round_player_scores VALUES (25820, 46, 10);
INSERT INTO public.round_player_scores VALUES (25820, 47, 140);
INSERT INTO public.round_player_scores VALUES (25820, 48, 29);
INSERT INTO public.round_player_scores VALUES (25821, 46, 10);
INSERT INTO public.round_player_scores VALUES (25821, 47, 18);
INSERT INTO public.round_player_scores VALUES (25821, 48, 2);
INSERT INTO public.round_player_scores VALUES (25822, 46, 10);
INSERT INTO public.round_player_scores VALUES (25822, 47, 469);
INSERT INTO public.round_player_scores VALUES (25822, 48, 157);
INSERT INTO public.round_player_scores VALUES (25822, 49, 2);
INSERT INTO public.round_player_scores VALUES (25822, 50, 300);
INSERT INTO public.round_player_scores VALUES (25823, 46, 10);
INSERT INTO public.round_player_scores VALUES (25823, 47, 375);
INSERT INTO public.round_player_scores VALUES (25823, 48, 143);
INSERT INTO public.round_player_scores VALUES (25823, 50, 300);
INSERT INTO public.round_player_scores VALUES (25823, 49, 2);
INSERT INTO public.round_player_scores VALUES (25824, 46, 10);
INSERT INTO public.round_player_scores VALUES (25824, 47, 468);
INSERT INTO public.round_player_scores VALUES (25824, 48, 182);
INSERT INTO public.round_player_scores VALUES (25825, 47, 944);
INSERT INTO public.round_player_scores VALUES (25825, 46, 10);
INSERT INTO public.round_player_scores VALUES (25825, 48, 311);
INSERT INTO public.round_player_scores VALUES (25825, 50, 150);
INSERT INTO public.round_player_scores VALUES (25826, 47, 683);
INSERT INTO public.round_player_scores VALUES (25826, 46, 10);
INSERT INTO public.round_player_scores VALUES (25826, 48, 312);
INSERT INTO public.round_player_scores VALUES (25826, 50, 300);
INSERT INTO public.round_player_scores VALUES (25827, 46, 10);
INSERT INTO public.round_player_scores VALUES (25827, 47, 304);
INSERT INTO public.round_player_scores VALUES (25827, 48, 80);
INSERT INTO public.round_player_scores VALUES (25828, 47, 152);
INSERT INTO public.round_player_scores VALUES (25828, 46, 10);
INSERT INTO public.round_player_scores VALUES (25828, 48, 55);
INSERT INTO public.round_player_scores VALUES (25828, 50, 300);
INSERT INTO public.round_player_scores VALUES (25830, 46, 10);
INSERT INTO public.round_player_scores VALUES (25830, 47, 235);
INSERT INTO public.round_player_scores VALUES (25830, 48, 98);
INSERT INTO public.round_player_scores VALUES (25831, 46, 10);
INSERT INTO public.round_player_scores VALUES (25831, 47, 52);
INSERT INTO public.round_player_scores VALUES (25831, 48, 16);
INSERT INTO public.round_player_scores VALUES (25832, 46, 10);
INSERT INTO public.round_player_scores VALUES (25832, 47, 343);
INSERT INTO public.round_player_scores VALUES (25832, 48, 169);
INSERT INTO public.round_player_scores VALUES (25833, 46, 10);
INSERT INTO public.round_player_scores VALUES (25833, 47, 10);
INSERT INTO public.round_player_scores VALUES (25834, 46, 10);
INSERT INTO public.round_player_scores VALUES (25834, 47, 123);
INSERT INTO public.round_player_scores VALUES (25834, 48, 35);
INSERT INTO public.round_player_scores VALUES (25835, 46, 10);
INSERT INTO public.round_player_scores VALUES (25835, 47, 664);
INSERT INTO public.round_player_scores VALUES (25835, 48, 227);
INSERT INTO public.round_player_scores VALUES (25836, 46, 10);
INSERT INTO public.round_player_scores VALUES (25836, 47, 85);
INSERT INTO public.round_player_scores VALUES (25836, 48, 5);
INSERT INTO public.round_player_scores VALUES (25837, 47, 57);
INSERT INTO public.round_player_scores VALUES (25837, 46, 10);
INSERT INTO public.round_player_scores VALUES (25837, 48, 38);
INSERT INTO public.round_player_scores VALUES (25838, 46, 10);
INSERT INTO public.round_player_scores VALUES (25838, 47, 668);
INSERT INTO public.round_player_scores VALUES (25838, 49, 2);
INSERT INTO public.round_player_scores VALUES (25838, 48, 302);
INSERT INTO public.round_player_scores VALUES (25839, 46, 10);
INSERT INTO public.round_player_scores VALUES (25839, 47, 436);
INSERT INTO public.round_player_scores VALUES (25839, 48, 174);
INSERT INTO public.round_player_scores VALUES (25840, 46, 10);
INSERT INTO public.round_player_scores VALUES (25840, 47, 267);
INSERT INTO public.round_player_scores VALUES (25840, 48, 77);
INSERT INTO public.round_player_scores VALUES (25840, 49, 2);
INSERT INTO public.round_player_scores VALUES (25841, 46, 10);
INSERT INTO public.round_player_scores VALUES (25841, 47, 180);
INSERT INTO public.round_player_scores VALUES (25841, 48, 3);
INSERT INTO public.round_player_scores VALUES (25842, 46, 10);
INSERT INTO public.round_player_scores VALUES (25842, 47, 294);
INSERT INTO public.round_player_scores VALUES (25842, 48, 101);
INSERT INTO public.round_player_scores VALUES (25843, 46, 10);
INSERT INTO public.round_player_scores VALUES (25843, 47, 184);
INSERT INTO public.round_player_scores VALUES (25843, 48, 13);
INSERT INTO public.round_player_scores VALUES (25844, 46, 10);
INSERT INTO public.round_player_scores VALUES (25844, 47, 32);
INSERT INTO public.round_player_scores VALUES (25844, 48, 8);
INSERT INTO public.round_player_scores VALUES (25845, 46, 10);
INSERT INTO public.round_player_scores VALUES (25845, 47, 51);
INSERT INTO public.round_player_scores VALUES (25845, 48, 14);
INSERT INTO public.round_player_scores VALUES (25846, 46, 10);
INSERT INTO public.round_player_scores VALUES (25846, 47, 28);
INSERT INTO public.round_player_scores VALUES (25846, 49, 2);
INSERT INTO public.round_player_scores VALUES (25847, 46, 10);
INSERT INTO public.round_player_scores VALUES (25847, 47, 13);
INSERT INTO public.round_player_scores VALUES (25848, 49, 2);
INSERT INTO public.round_player_scores VALUES (25848, 46, 10);
INSERT INTO public.round_player_scores VALUES (25848, 47, 2);
INSERT INTO public.round_player_scores VALUES (25849, 46, 10);
INSERT INTO public.round_player_scores VALUES (25849, 47, 680);
INSERT INTO public.round_player_scores VALUES (25849, 48, 144);
INSERT INTO public.round_player_scores VALUES (25850, 46, 10);
INSERT INTO public.round_player_scores VALUES (25850, 47, 80);
INSERT INTO public.round_player_scores VALUES (25850, 48, 10);
INSERT INTO public.round_player_scores VALUES (25850, 49, 2);
INSERT INTO public.round_player_scores VALUES (25851, 46, 10);
INSERT INTO public.round_player_scores VALUES (25851, 47, 496);
INSERT INTO public.round_player_scores VALUES (25851, 48, 113);
INSERT INTO public.round_player_scores VALUES (25852, 46, 10);
INSERT INTO public.round_player_scores VALUES (25852, 47, 1211);
INSERT INTO public.round_player_scores VALUES (25852, 48, 474);
INSERT INTO public.round_player_scores VALUES (25853, 46, 10);
INSERT INTO public.round_player_scores VALUES (25853, 47, 210);
INSERT INTO public.round_player_scores VALUES (25853, 48, 81);
INSERT INTO public.round_player_scores VALUES (25854, 47, 7);
INSERT INTO public.round_player_scores VALUES (25854, 46, 10);
INSERT INTO public.round_player_scores VALUES (25855, 46, 10);
INSERT INTO public.round_player_scores VALUES (25855, 47, 89);
INSERT INTO public.round_player_scores VALUES (25855, 48, 43);
INSERT INTO public.round_player_scores VALUES (25856, 46, 10);
INSERT INTO public.round_player_scores VALUES (25856, 47, 217);
INSERT INTO public.round_player_scores VALUES (25856, 48, 69);
INSERT INTO public.round_player_scores VALUES (25857, 49, 6);
INSERT INTO public.round_player_scores VALUES (25857, 46, 10);
INSERT INTO public.round_player_scores VALUES (25857, 47, 40);
INSERT INTO public.round_player_scores VALUES (25857, 48, 10);
INSERT INTO public.round_player_scores VALUES (25858, 46, 10);
INSERT INTO public.round_player_scores VALUES (25858, 47, 310);
INSERT INTO public.round_player_scores VALUES (25858, 48, 94);
INSERT INTO public.round_player_scores VALUES (25859, 46, 10);
INSERT INTO public.round_player_scores VALUES (25859, 47, 1);
INSERT INTO public.round_player_scores VALUES (25860, 46, 10);
INSERT INTO public.round_player_scores VALUES (25860, 47, 324);
INSERT INTO public.round_player_scores VALUES (25860, 48, 117);
INSERT INTO public.round_player_scores VALUES (25861, 46, 10);
INSERT INTO public.round_player_scores VALUES (25861, 47, 740);
INSERT INTO public.round_player_scores VALUES (25861, 48, 193);
INSERT INTO public.round_player_scores VALUES (25862, 46, 10);
INSERT INTO public.round_player_scores VALUES (25862, 47, 1420);
INSERT INTO public.round_player_scores VALUES (25862, 48, 561);
INSERT INTO public.round_player_scores VALUES (25862, 49, 2);
INSERT INTO public.round_player_scores VALUES (25863, 46, 10);
INSERT INTO public.round_player_scores VALUES (25863, 47, 817);
INSERT INTO public.round_player_scores VALUES (25863, 48, 289);
INSERT INTO public.round_player_scores VALUES (25864, 46, 10);
INSERT INTO public.round_player_scores VALUES (25864, 47, 521);
INSERT INTO public.round_player_scores VALUES (25864, 48, 332);
INSERT INTO public.round_player_scores VALUES (25865, 46, 10);
INSERT INTO public.round_player_scores VALUES (25865, 47, 765);
INSERT INTO public.round_player_scores VALUES (25865, 48, 229);
INSERT INTO public.round_player_scores VALUES (25866, 47, 698);
INSERT INTO public.round_player_scores VALUES (25866, 46, 10);
INSERT INTO public.round_player_scores VALUES (25866, 48, 106);
INSERT INTO public.round_player_scores VALUES (25867, 46, 10);
INSERT INTO public.round_player_scores VALUES (25867, 47, 152);
INSERT INTO public.round_player_scores VALUES (25868, 46, 10);
INSERT INTO public.round_player_scores VALUES (25868, 47, 1439);
INSERT INTO public.round_player_scores VALUES (25868, 48, 498);
INSERT INTO public.round_player_scores VALUES (25868, 50, 200);
INSERT INTO public.round_player_scores VALUES (25869, 50, 200);
INSERT INTO public.round_player_scores VALUES (25869, 47, 2200);
INSERT INTO public.round_player_scores VALUES (25869, 46, 10);
INSERT INTO public.round_player_scores VALUES (25869, 48, 583);
INSERT INTO public.round_player_scores VALUES (25870, 46, 10);
INSERT INTO public.round_player_scores VALUES (25870, 47, 387);
INSERT INTO public.round_player_scores VALUES (25870, 48, 47);
INSERT INTO public.round_player_scores VALUES (25871, 50, 200);
INSERT INTO public.round_player_scores VALUES (25871, 46, 10);
INSERT INTO public.round_player_scores VALUES (25871, 47, 929);
INSERT INTO public.round_player_scores VALUES (25871, 48, 357);
INSERT INTO public.round_player_scores VALUES (25871, 49, 2);
INSERT INTO public.round_player_scores VALUES (25872, 46, 10);
INSERT INTO public.round_player_scores VALUES (25872, 47, 135);
INSERT INTO public.round_player_scores VALUES (25872, 48, 53);
INSERT INTO public.round_player_scores VALUES (25873, 46, 10);
INSERT INTO public.round_player_scores VALUES (25873, 47, 472);
INSERT INTO public.round_player_scores VALUES (25873, 48, 192);
INSERT INTO public.round_player_scores VALUES (25873, 49, 2);
INSERT INTO public.round_player_scores VALUES (25874, 46, 10);
INSERT INTO public.round_player_scores VALUES (25874, 47, 103);
INSERT INTO public.round_player_scores VALUES (25874, 48, 38);
INSERT INTO public.round_player_scores VALUES (25875, 46, 10);
INSERT INTO public.round_player_scores VALUES (25875, 47, 256);
INSERT INTO public.round_player_scores VALUES (25875, 48, 107);
INSERT INTO public.round_player_scores VALUES (25875, 49, 2);
INSERT INTO public.round_player_scores VALUES (25876, 50, 200);
INSERT INTO public.round_player_scores VALUES (25876, 46, 10);
INSERT INTO public.round_player_scores VALUES (25876, 47, 39);
INSERT INTO public.round_player_scores VALUES (25876, 48, 14);
INSERT INTO public.round_player_scores VALUES (25877, 46, 10);
INSERT INTO public.round_player_scores VALUES (25877, 47, 209);
INSERT INTO public.round_player_scores VALUES (25877, 48, 93);
INSERT INTO public.round_player_scores VALUES (25878, 50, 200);
INSERT INTO public.round_player_scores VALUES (25878, 46, 10);
INSERT INTO public.round_player_scores VALUES (25878, 47, 563);
INSERT INTO public.round_player_scores VALUES (25878, 48, 203);
INSERT INTO public.round_player_scores VALUES (25879, 50, 200);
INSERT INTO public.round_player_scores VALUES (25879, 46, 10);
INSERT INTO public.round_player_scores VALUES (25879, 49, 2);
INSERT INTO public.round_player_scores VALUES (25880, 50, 200);
INSERT INTO public.round_player_scores VALUES (25880, 47, 120);
INSERT INTO public.round_player_scores VALUES (25880, 46, 10);
INSERT INTO public.round_player_scores VALUES (25880, 48, 38);
INSERT INTO public.round_player_scores VALUES (25881, 47, 192);
INSERT INTO public.round_player_scores VALUES (25881, 46, 10);
INSERT INTO public.round_player_scores VALUES (25881, 48, 26);
INSERT INTO public.round_player_scores VALUES (25882, 46, 10);
INSERT INTO public.round_player_scores VALUES (25882, 47, 603);
INSERT INTO public.round_player_scores VALUES (25882, 49, 18);
INSERT INTO public.round_player_scores VALUES (25882, 48, 167);
INSERT INTO public.round_player_scores VALUES (25883, 47, 1118);
INSERT INTO public.round_player_scores VALUES (25883, 46, 10);
INSERT INTO public.round_player_scores VALUES (25883, 48, 209);
INSERT INTO public.round_player_scores VALUES (25884, 46, 10);
INSERT INTO public.round_player_scores VALUES (25884, 47, 180);
INSERT INTO public.round_player_scores VALUES (25884, 48, 135);
INSERT INTO public.round_player_scores VALUES (25885, 46, 10);
INSERT INTO public.round_player_scores VALUES (25885, 47, 213);
INSERT INTO public.round_player_scores VALUES (25885, 48, 15);
INSERT INTO public.round_player_scores VALUES (25885, 49, 4);
INSERT INTO public.round_player_scores VALUES (25886, 46, 10);
INSERT INTO public.round_player_scores VALUES (25886, 47, 433);
INSERT INTO public.round_player_scores VALUES (25886, 48, 99);
INSERT INTO public.round_player_scores VALUES (25887, 49, 2);
INSERT INTO public.round_player_scores VALUES (25887, 46, 10);
INSERT INTO public.round_player_scores VALUES (25887, 47, 162);
INSERT INTO public.round_player_scores VALUES (25887, 48, 100);
INSERT INTO public.round_player_scores VALUES (25888, 46, 10);
INSERT INTO public.round_player_scores VALUES (25888, 48, 23);
INSERT INTO public.round_player_scores VALUES (25888, 47, 41);
INSERT INTO public.round_player_scores VALUES (25889, 46, 10);
INSERT INTO public.round_player_scores VALUES (25889, 47, 490);
INSERT INTO public.round_player_scores VALUES (25889, 48, 26);
INSERT INTO public.round_player_scores VALUES (25890, 46, 10);
INSERT INTO public.round_player_scores VALUES (25890, 47, 297);
INSERT INTO public.round_player_scores VALUES (25890, 48, 198);
INSERT INTO public.round_player_scores VALUES (25891, 46, 10);
INSERT INTO public.round_player_scores VALUES (25891, 47, 1622);
INSERT INTO public.round_player_scores VALUES (25891, 48, 751);
INSERT INTO public.round_player_scores VALUES (25892, 46, 10);
INSERT INTO public.round_player_scores VALUES (25892, 48, 128);
INSERT INTO public.round_player_scores VALUES (25892, 47, 418);
INSERT INTO public.round_player_scores VALUES (25893, 46, 10);
INSERT INTO public.round_player_scores VALUES (25893, 47, 184);
INSERT INTO public.round_player_scores VALUES (25893, 48, 27);
INSERT INTO public.round_player_scores VALUES (25894, 47, 201);
INSERT INTO public.round_player_scores VALUES (25894, 46, 10);
INSERT INTO public.round_player_scores VALUES (25894, 48, 47);
INSERT INTO public.round_player_scores VALUES (25895, 46, 10);
INSERT INTO public.round_player_scores VALUES (25895, 47, 4);
INSERT INTO public.round_player_scores VALUES (25896, 46, 10);
INSERT INTO public.round_player_scores VALUES (25896, 47, 250);
INSERT INTO public.round_player_scores VALUES (25896, 48, 175);
INSERT INTO public.round_player_scores VALUES (25897, 46, 10);
INSERT INTO public.round_player_scores VALUES (25897, 47, 114);
INSERT INTO public.round_player_scores VALUES (25897, 48, 6);
INSERT INTO public.round_player_scores VALUES (25898, 46, 10);
INSERT INTO public.round_player_scores VALUES (25898, 47, 12);
INSERT INTO public.round_player_scores VALUES (25899, 46, 10);
INSERT INTO public.round_player_scores VALUES (25899, 47, 436);
INSERT INTO public.round_player_scores VALUES (25899, 48, 99);
INSERT INTO public.round_player_scores VALUES (25900, 46, 10);
INSERT INTO public.round_player_scores VALUES (25900, 47, 321);
INSERT INTO public.round_player_scores VALUES (25900, 48, 77);
INSERT INTO public.round_player_scores VALUES (25901, 46, 10);
INSERT INTO public.round_player_scores VALUES (25901, 47, 49);
INSERT INTO public.round_player_scores VALUES (25901, 48, 10);
INSERT INTO public.round_player_scores VALUES (25902, 46, 10);
INSERT INTO public.round_player_scores VALUES (25902, 47, 16);
INSERT INTO public.round_player_scores VALUES (25903, 46, 10);
INSERT INTO public.round_player_scores VALUES (25903, 47, 359);
INSERT INTO public.round_player_scores VALUES (25903, 48, 226);
INSERT INTO public.round_player_scores VALUES (25905, 48, 4);
INSERT INTO public.round_player_scores VALUES (25905, 46, 10);
INSERT INTO public.round_player_scores VALUES (25905, 47, 49);
INSERT INTO public.round_player_scores VALUES (25906, 46, 10);
INSERT INTO public.round_player_scores VALUES (25906, 47, 18);
INSERT INTO public.round_player_scores VALUES (25906, 48, 15);
INSERT INTO public.round_player_scores VALUES (25907, 47, 508);
INSERT INTO public.round_player_scores VALUES (25907, 46, 10);
INSERT INTO public.round_player_scores VALUES (25907, 48, 135);
INSERT INTO public.round_player_scores VALUES (25908, 46, 10);
INSERT INTO public.round_player_scores VALUES (25908, 47, 103);
INSERT INTO public.round_player_scores VALUES (25909, 46, 10);
INSERT INTO public.round_player_scores VALUES (25909, 47, 372);
INSERT INTO public.round_player_scores VALUES (25909, 48, 147);
INSERT INTO public.round_player_scores VALUES (25910, 46, 10);
INSERT INTO public.round_player_scores VALUES (25910, 47, 384);
INSERT INTO public.round_player_scores VALUES (25910, 48, 69);
INSERT INTO public.round_player_scores VALUES (25911, 46, 10);
INSERT INTO public.round_player_scores VALUES (25911, 47, 169);
INSERT INTO public.round_player_scores VALUES (25911, 48, 144);
INSERT INTO public.round_player_scores VALUES (25912, 46, 10);
INSERT INTO public.round_player_scores VALUES (25912, 47, 18);
INSERT INTO public.round_player_scores VALUES (25912, 48, 3);
INSERT INTO public.round_player_scores VALUES (25913, 46, 10);
INSERT INTO public.round_player_scores VALUES (25913, 47, 618);
INSERT INTO public.round_player_scores VALUES (25913, 48, 306);
INSERT INTO public.round_player_scores VALUES (25914, 46, 10);
INSERT INTO public.round_player_scores VALUES (25914, 47, 124);
INSERT INTO public.round_player_scores VALUES (25914, 48, 47);
INSERT INTO public.round_player_scores VALUES (25915, 47, 1727);
INSERT INTO public.round_player_scores VALUES (25915, 46, 10);
INSERT INTO public.round_player_scores VALUES (25915, 48, 1003);
INSERT INTO public.round_player_scores VALUES (25916, 50, 200);
INSERT INTO public.round_player_scores VALUES (25916, 46, 10);
INSERT INTO public.round_player_scores VALUES (25916, 47, 405);
INSERT INTO public.round_player_scores VALUES (25916, 48, 113);
INSERT INTO public.round_player_scores VALUES (25917, 50, 200);
INSERT INTO public.round_player_scores VALUES (25917, 47, 386);
INSERT INTO public.round_player_scores VALUES (25917, 46, 10);
INSERT INTO public.round_player_scores VALUES (25917, 48, 142);
INSERT INTO public.round_player_scores VALUES (25918, 46, 10);
INSERT INTO public.round_player_scores VALUES (25918, 47, 41);
INSERT INTO public.round_player_scores VALUES (25918, 48, 10);
INSERT INTO public.round_player_scores VALUES (25919, 46, 10);
INSERT INTO public.round_player_scores VALUES (25919, 47, 127);
INSERT INTO public.round_player_scores VALUES (25920, 46, 10);
INSERT INTO public.round_player_scores VALUES (25920, 47, 295);
INSERT INTO public.round_player_scores VALUES (25920, 48, 162);
INSERT INTO public.round_player_scores VALUES (25921, 46, 10);
INSERT INTO public.round_player_scores VALUES (25921, 47, 25);
INSERT INTO public.round_player_scores VALUES (25921, 48, 16);
INSERT INTO public.round_player_scores VALUES (25922, 46, 10);
INSERT INTO public.round_player_scores VALUES (25922, 47, 28);
INSERT INTO public.round_player_scores VALUES (25923, 50, 200);
INSERT INTO public.round_player_scores VALUES (25923, 46, 10);
INSERT INTO public.round_player_scores VALUES (25923, 47, 207);
INSERT INTO public.round_player_scores VALUES (25923, 48, 91);
INSERT INTO public.round_player_scores VALUES (25924, 46, 10);
INSERT INTO public.round_player_scores VALUES (25924, 47, 793);
INSERT INTO public.round_player_scores VALUES (25924, 48, 316);
INSERT INTO public.round_player_scores VALUES (25925, 46, 10);
INSERT INTO public.round_player_scores VALUES (25925, 48, 87);
INSERT INTO public.round_player_scores VALUES (25925, 47, 78);
INSERT INTO public.round_player_scores VALUES (25926, 46, 10);
INSERT INTO public.round_player_scores VALUES (25926, 47, 152);
INSERT INTO public.round_player_scores VALUES (25926, 48, 45);
INSERT INTO public.round_player_scores VALUES (25926, 49, 2);
INSERT INTO public.round_player_scores VALUES (25927, 46, 10);
INSERT INTO public.round_player_scores VALUES (25927, 47, 503);
INSERT INTO public.round_player_scores VALUES (25927, 48, 47);
INSERT INTO public.round_player_scores VALUES (25927, 50, 200);
INSERT INTO public.round_player_scores VALUES (25928, 46, 10);
INSERT INTO public.round_player_scores VALUES (25928, 47, 208);
INSERT INTO public.round_player_scores VALUES (25928, 48, 78);
INSERT INTO public.round_player_scores VALUES (25929, 46, 10);
INSERT INTO public.round_player_scores VALUES (25929, 47, 735);
INSERT INTO public.round_player_scores VALUES (25929, 48, 256);
INSERT INTO public.round_player_scores VALUES (25930, 47, 275);
INSERT INTO public.round_player_scores VALUES (25930, 46, 10);
INSERT INTO public.round_player_scores VALUES (25930, 48, 15);
INSERT INTO public.round_player_scores VALUES (25930, 49, 6);
INSERT INTO public.round_player_scores VALUES (25931, 46, 10);
INSERT INTO public.round_player_scores VALUES (25931, 47, 614);
INSERT INTO public.round_player_scores VALUES (25931, 48, 223);
INSERT INTO public.round_player_scores VALUES (25932, 46, 10);
INSERT INTO public.round_player_scores VALUES (25932, 47, 614);
INSERT INTO public.round_player_scores VALUES (25932, 48, 179);
INSERT INTO public.round_player_scores VALUES (25933, 49, 6);
INSERT INTO public.round_player_scores VALUES (25933, 46, 10);
INSERT INTO public.round_player_scores VALUES (25933, 47, 580);
INSERT INTO public.round_player_scores VALUES (25933, 48, 60);
INSERT INTO public.round_player_scores VALUES (25934, 46, 10);
INSERT INTO public.round_player_scores VALUES (25934, 47, 442);
INSERT INTO public.round_player_scores VALUES (25934, 48, 20);
INSERT INTO public.round_player_scores VALUES (25935, 46, 10);
INSERT INTO public.round_player_scores VALUES (25935, 47, 163);
INSERT INTO public.round_player_scores VALUES (25935, 48, 12);
INSERT INTO public.round_player_scores VALUES (25936, 46, 10);
INSERT INTO public.round_player_scores VALUES (25936, 47, 32);
INSERT INTO public.round_player_scores VALUES (25937, 46, 10);
INSERT INTO public.round_player_scores VALUES (25937, 49, 8);
INSERT INTO public.round_player_scores VALUES (25937, 47, 291);
INSERT INTO public.round_player_scores VALUES (25937, 48, 260);
INSERT INTO public.round_player_scores VALUES (25938, 46, 10);
INSERT INTO public.round_player_scores VALUES (25938, 47, 25);
INSERT INTO public.round_player_scores VALUES (25938, 48, 4);
INSERT INTO public.round_player_scores VALUES (25939, 46, 10);
INSERT INTO public.round_player_scores VALUES (25939, 47, 454);
INSERT INTO public.round_player_scores VALUES (25939, 48, 133);
INSERT INTO public.round_player_scores VALUES (25940, 46, 10);
INSERT INTO public.round_player_scores VALUES (25940, 47, 336);
INSERT INTO public.round_player_scores VALUES (25940, 48, 250);
INSERT INTO public.round_player_scores VALUES (25941, 46, 10);
INSERT INTO public.round_player_scores VALUES (25942, 46, 10);
INSERT INTO public.round_player_scores VALUES (25942, 47, 898);
INSERT INTO public.round_player_scores VALUES (25942, 48, 355);
INSERT INTO public.round_player_scores VALUES (25943, 47, 656);
INSERT INTO public.round_player_scores VALUES (25943, 46, 10);
INSERT INTO public.round_player_scores VALUES (25943, 48, 203);
INSERT INTO public.round_player_scores VALUES (25944, 46, 10);
INSERT INTO public.round_player_scores VALUES (25944, 47, 928);
INSERT INTO public.round_player_scores VALUES (25944, 48, 385);
INSERT INTO public.round_player_scores VALUES (25945, 47, 930);
INSERT INTO public.round_player_scores VALUES (25945, 46, 10);
INSERT INTO public.round_player_scores VALUES (25945, 48, 468);
INSERT INTO public.round_player_scores VALUES (25945, 49, 2);
INSERT INTO public.round_player_scores VALUES (25946, 46, 10);
INSERT INTO public.round_player_scores VALUES (25946, 47, 590);
INSERT INTO public.round_player_scores VALUES (25946, 48, 158);
INSERT INTO public.round_player_scores VALUES (25947, 46, 10);
INSERT INTO public.round_player_scores VALUES (25947, 47, 64);
INSERT INTO public.round_player_scores VALUES (25947, 50, 200);
INSERT INTO public.round_player_scores VALUES (25948, 46, 10);
INSERT INTO public.round_player_scores VALUES (25948, 47, 298);
INSERT INTO public.round_player_scores VALUES (25948, 50, 200);
INSERT INTO public.round_player_scores VALUES (25948, 48, 141);
INSERT INTO public.round_player_scores VALUES (25949, 46, 10);
INSERT INTO public.round_player_scores VALUES (25949, 47, 1610);
INSERT INTO public.round_player_scores VALUES (25949, 48, 308);
INSERT INTO public.round_player_scores VALUES (25949, 49, 2);
INSERT INTO public.round_player_scores VALUES (25950, 46, 10);
INSERT INTO public.round_player_scores VALUES (25950, 47, 197);
INSERT INTO public.round_player_scores VALUES (25951, 46, 10);
INSERT INTO public.round_player_scores VALUES (25951, 47, 795);
INSERT INTO public.round_player_scores VALUES (25951, 48, 255);
INSERT INTO public.round_player_scores VALUES (25951, 50, 200);
INSERT INTO public.round_player_scores VALUES (25952, 46, 10);
INSERT INTO public.round_player_scores VALUES (25952, 47, 505);
INSERT INTO public.round_player_scores VALUES (25952, 48, 116);
INSERT INTO public.round_player_scores VALUES (25953, 46, 10);
INSERT INTO public.round_player_scores VALUES (25953, 47, 411);
INSERT INTO public.round_player_scores VALUES (25953, 48, 176);
INSERT INTO public.round_player_scores VALUES (25954, 46, 10);
INSERT INTO public.round_player_scores VALUES (25954, 47, 142);
INSERT INTO public.round_player_scores VALUES (25954, 48, 87);
INSERT INTO public.round_player_scores VALUES (25955, 46, 10);
INSERT INTO public.round_player_scores VALUES (25955, 47, 254);
INSERT INTO public.round_player_scores VALUES (25955, 48, 160);
INSERT INTO public.round_player_scores VALUES (25956, 46, 10);
INSERT INTO public.round_player_scores VALUES (25956, 47, 76);
INSERT INTO public.round_player_scores VALUES (25958, 46, 10);
INSERT INTO public.round_player_scores VALUES (25958, 47, 74);
INSERT INTO public.round_player_scores VALUES (25958, 48, 1);
INSERT INTO public.round_player_scores VALUES (25959, 47, 1066);
INSERT INTO public.round_player_scores VALUES (25959, 46, 10);
INSERT INTO public.round_player_scores VALUES (25959, 48, 454);
INSERT INTO public.round_player_scores VALUES (25959, 50, 200);
INSERT INTO public.round_player_scores VALUES (25959, 49, 4);
INSERT INTO public.round_player_scores VALUES (25960, 46, 10);
INSERT INTO public.round_player_scores VALUES (25960, 47, 1254);
INSERT INTO public.round_player_scores VALUES (25960, 48, 202);
INSERT INTO public.round_player_scores VALUES (25961, 46, 10);
INSERT INTO public.round_player_scores VALUES (25961, 47, 453);
INSERT INTO public.round_player_scores VALUES (25961, 48, 244);
INSERT INTO public.round_player_scores VALUES (25962, 46, 10);
INSERT INTO public.round_player_scores VALUES (25962, 47, 114);
INSERT INTO public.round_player_scores VALUES (25963, 46, 10);
INSERT INTO public.round_player_scores VALUES (25963, 47, 1436);
INSERT INTO public.round_player_scores VALUES (25963, 48, 387);
INSERT INTO public.round_player_scores VALUES (25964, 47, 123);
INSERT INTO public.round_player_scores VALUES (25964, 46, 10);
INSERT INTO public.round_player_scores VALUES (25964, 48, 41);
INSERT INTO public.round_player_scores VALUES (25965, 46, 10);
INSERT INTO public.round_player_scores VALUES (25965, 47, 57);
INSERT INTO public.round_player_scores VALUES (25966, 46, 10);
INSERT INTO public.round_player_scores VALUES (25966, 47, 6);
INSERT INTO public.round_player_scores VALUES (25968, 46, 10);
INSERT INTO public.round_player_scores VALUES (25968, 47, 426);
INSERT INTO public.round_player_scores VALUES (25968, 48, 89);
INSERT INTO public.round_player_scores VALUES (25969, 46, 10);
INSERT INTO public.round_player_scores VALUES (25969, 47, 891);
INSERT INTO public.round_player_scores VALUES (25969, 48, 262);
INSERT INTO public.round_player_scores VALUES (25970, 46, 10);
INSERT INTO public.round_player_scores VALUES (25970, 47, 50);
INSERT INTO public.round_player_scores VALUES (25970, 48, 31);
INSERT INTO public.round_player_scores VALUES (25971, 47, 13);
INSERT INTO public.round_player_scores VALUES (25971, 46, 10);
INSERT INTO public.round_player_scores VALUES (25972, 47, 438);
INSERT INTO public.round_player_scores VALUES (25972, 46, 10);
INSERT INTO public.round_player_scores VALUES (25972, 48, 154);
INSERT INTO public.round_player_scores VALUES (25973, 46, 10);
INSERT INTO public.round_player_scores VALUES (25973, 47, 45);
INSERT INTO public.round_player_scores VALUES (25974, 46, 10);
INSERT INTO public.round_player_scores VALUES (25974, 47, 362);
INSERT INTO public.round_player_scores VALUES (25974, 48, 172);
INSERT INTO public.round_player_scores VALUES (25975, 47, 371);
INSERT INTO public.round_player_scores VALUES (25975, 46, 10);
INSERT INTO public.round_player_scores VALUES (25975, 48, 23);
INSERT INTO public.round_player_scores VALUES (25976, 46, 10);
INSERT INTO public.round_player_scores VALUES (25976, 47, 364);
INSERT INTO public.round_player_scores VALUES (25976, 48, 177);
INSERT INTO public.round_player_scores VALUES (25977, 46, 10);
INSERT INTO public.round_player_scores VALUES (25977, 47, 24);
INSERT INTO public.round_player_scores VALUES (25977, 48, 14);
INSERT INTO public.round_player_scores VALUES (25978, 46, 10);
INSERT INTO public.round_player_scores VALUES (25978, 47, 521);
INSERT INTO public.round_player_scores VALUES (25978, 48, 165);
INSERT INTO public.round_player_scores VALUES (25979, 46, 10);
INSERT INTO public.round_player_scores VALUES (25979, 47, 1040);
INSERT INTO public.round_player_scores VALUES (25979, 49, 2);
INSERT INTO public.round_player_scores VALUES (25979, 48, 400);
INSERT INTO public.round_player_scores VALUES (25980, 46, 10);
INSERT INTO public.round_player_scores VALUES (25980, 50, 150);
INSERT INTO public.round_player_scores VALUES (25980, 47, 76);
INSERT INTO public.round_player_scores VALUES (25980, 48, 38);
INSERT INTO public.round_player_scores VALUES (25981, 46, 10);
INSERT INTO public.round_player_scores VALUES (25981, 47, 1001);
INSERT INTO public.round_player_scores VALUES (25981, 48, 240);
INSERT INTO public.round_player_scores VALUES (25982, 46, 10);
INSERT INTO public.round_player_scores VALUES (25982, 47, 97);
INSERT INTO public.round_player_scores VALUES (25982, 48, 8);
INSERT INTO public.round_player_scores VALUES (25983, 46, 10);
INSERT INTO public.round_player_scores VALUES (25983, 47, 371);
INSERT INTO public.round_player_scores VALUES (25983, 48, 322);
INSERT INTO public.round_player_scores VALUES (25984, 47, 420);
INSERT INTO public.round_player_scores VALUES (25984, 46, 10);
INSERT INTO public.round_player_scores VALUES (25984, 48, 361);
INSERT INTO public.round_player_scores VALUES (25985, 46, 10);
INSERT INTO public.round_player_scores VALUES (25985, 47, 124);
INSERT INTO public.round_player_scores VALUES (25985, 48, 40);
INSERT INTO public.round_player_scores VALUES (25985, 49, 2);
INSERT INTO public.round_player_scores VALUES (25986, 46, 10);
INSERT INTO public.round_player_scores VALUES (25986, 47, 133);
INSERT INTO public.round_player_scores VALUES (25986, 48, 68);
INSERT INTO public.round_player_scores VALUES (25987, 46, 10);
INSERT INTO public.round_player_scores VALUES (25987, 47, 93);
INSERT INTO public.round_player_scores VALUES (25987, 48, 17);
INSERT INTO public.round_player_scores VALUES (25988, 46, 10);
INSERT INTO public.round_player_scores VALUES (25988, 47, 429);
INSERT INTO public.round_player_scores VALUES (25988, 48, 197);
INSERT INTO public.round_player_scores VALUES (25989, 50, 150);
INSERT INTO public.round_player_scores VALUES (25989, 46, 10);
INSERT INTO public.round_player_scores VALUES (25989, 49, 2);
INSERT INTO public.round_player_scores VALUES (25989, 47, 293);
INSERT INTO public.round_player_scores VALUES (25989, 48, 327);
INSERT INTO public.round_player_scores VALUES (25990, 47, 314);
INSERT INTO public.round_player_scores VALUES (25990, 46, 10);
INSERT INTO public.round_player_scores VALUES (25990, 48, 69);
INSERT INTO public.round_player_scores VALUES (25991, 46, 10);
INSERT INTO public.round_player_scores VALUES (25991, 47, 277);
INSERT INTO public.round_player_scores VALUES (25991, 48, 93);
INSERT INTO public.round_player_scores VALUES (25992, 46, 10);
INSERT INTO public.round_player_scores VALUES (25992, 47, 97);
INSERT INTO public.round_player_scores VALUES (25992, 48, 11);
INSERT INTO public.round_player_scores VALUES (25993, 46, 10);
INSERT INTO public.round_player_scores VALUES (25993, 47, 462);
INSERT INTO public.round_player_scores VALUES (25993, 48, 112);
INSERT INTO public.round_player_scores VALUES (25994, 46, 10);
INSERT INTO public.round_player_scores VALUES (25994, 47, 368);
INSERT INTO public.round_player_scores VALUES (25994, 48, 126);
INSERT INTO public.round_player_scores VALUES (25995, 46, 10);
INSERT INTO public.round_player_scores VALUES (25995, 47, 698);
INSERT INTO public.round_player_scores VALUES (25995, 48, 157);
INSERT INTO public.round_player_scores VALUES (25996, 46, 10);
INSERT INTO public.round_player_scores VALUES (25996, 47, 343);
INSERT INTO public.round_player_scores VALUES (25996, 48, 147);
INSERT INTO public.round_player_scores VALUES (25997, 46, 10);
INSERT INTO public.round_player_scores VALUES (25997, 47, 54);
INSERT INTO public.round_player_scores VALUES (25998, 46, 10);
INSERT INTO public.round_player_scores VALUES (25999, 46, 10);
INSERT INTO public.round_player_scores VALUES (26000, 46, 10);
INSERT INTO public.round_player_scores VALUES (26000, 47, 110);
INSERT INTO public.round_player_scores VALUES (26000, 48, 19);
INSERT INTO public.round_player_scores VALUES (26001, 46, 10);
INSERT INTO public.round_player_scores VALUES (26001, 47, 103);
INSERT INTO public.round_player_scores VALUES (26001, 49, 8);
INSERT INTO public.round_player_scores VALUES (26002, 46, 10);
INSERT INTO public.round_player_scores VALUES (26003, 46, 10);
INSERT INTO public.round_player_scores VALUES (26003, 47, 59);
INSERT INTO public.round_player_scores VALUES (26004, 46, 10);
INSERT INTO public.round_player_scores VALUES (26004, 47, 269);
INSERT INTO public.round_player_scores VALUES (26004, 48, 192);
INSERT INTO public.round_player_scores VALUES (26005, 46, 10);
INSERT INTO public.round_player_scores VALUES (26005, 47, 345);
INSERT INTO public.round_player_scores VALUES (26005, 48, 91);
INSERT INTO public.round_player_scores VALUES (26006, 46, 10);
INSERT INTO public.round_player_scores VALUES (26007, 47, 85);
INSERT INTO public.round_player_scores VALUES (26007, 46, 10);
INSERT INTO public.round_player_scores VALUES (26008, 47, 168);
INSERT INTO public.round_player_scores VALUES (26008, 46, 10);
INSERT INTO public.round_player_scores VALUES (26008, 48, 38);
INSERT INTO public.round_player_scores VALUES (26009, 46, 10);
INSERT INTO public.round_player_scores VALUES (26009, 47, 1395);
INSERT INTO public.round_player_scores VALUES (26009, 48, 437);
INSERT INTO public.round_player_scores VALUES (26010, 46, 10);
INSERT INTO public.round_player_scores VALUES (26010, 47, 643);
INSERT INTO public.round_player_scores VALUES (26010, 48, 234);
INSERT INTO public.round_player_scores VALUES (26011, 46, 10);
INSERT INTO public.round_player_scores VALUES (26011, 47, 1327);
INSERT INTO public.round_player_scores VALUES (26011, 48, 528);
INSERT INTO public.round_player_scores VALUES (26012, 46, 10);
INSERT INTO public.round_player_scores VALUES (26012, 47, 360);
INSERT INTO public.round_player_scores VALUES (26012, 48, 47);
INSERT INTO public.round_player_scores VALUES (26012, 50, 150);
INSERT INTO public.round_player_scores VALUES (26013, 46, 10);
INSERT INTO public.round_player_scores VALUES (26013, 47, 162);
INSERT INTO public.round_player_scores VALUES (26014, 46, 10);
INSERT INTO public.round_player_scores VALUES (26014, 47, 246);
INSERT INTO public.round_player_scores VALUES (26014, 48, 1);
INSERT INTO public.round_player_scores VALUES (26015, 46, 10);
INSERT INTO public.round_player_scores VALUES (26015, 47, 840);
INSERT INTO public.round_player_scores VALUES (26015, 48, 389);
INSERT INTO public.round_player_scores VALUES (26016, 46, 10);
INSERT INTO public.round_player_scores VALUES (26016, 47, 404);
INSERT INTO public.round_player_scores VALUES (26016, 48, 19);
INSERT INTO public.round_player_scores VALUES (26017, 46, 10);
INSERT INTO public.round_player_scores VALUES (26017, 47, 691);
INSERT INTO public.round_player_scores VALUES (26017, 48, 224);
INSERT INTO public.round_player_scores VALUES (26018, 46, 10);
INSERT INTO public.round_player_scores VALUES (26018, 47, 160);
INSERT INTO public.round_player_scores VALUES (26018, 48, 49);
INSERT INTO public.round_player_scores VALUES (26019, 46, 10);
INSERT INTO public.round_player_scores VALUES (26019, 47, 1188);
INSERT INTO public.round_player_scores VALUES (26019, 51, 11);
INSERT INTO public.round_player_scores VALUES (26019, 48, 451);
INSERT INTO public.round_player_scores VALUES (26020, 46, 10);
INSERT INTO public.round_player_scores VALUES (26020, 47, 400);
INSERT INTO public.round_player_scores VALUES (26020, 48, 46);
INSERT INTO public.round_player_scores VALUES (26021, 46, 10);
INSERT INTO public.round_player_scores VALUES (26021, 47, 327);
INSERT INTO public.round_player_scores VALUES (26021, 48, 5);
INSERT INTO public.round_player_scores VALUES (26022, 46, 10);
INSERT INTO public.round_player_scores VALUES (26022, 47, 252);
INSERT INTO public.round_player_scores VALUES (26022, 48, 35);
INSERT INTO public.round_player_scores VALUES (26023, 46, 10);
INSERT INTO public.round_player_scores VALUES (26023, 47, 505);
INSERT INTO public.round_player_scores VALUES (26023, 48, 90);
INSERT INTO public.round_player_scores VALUES (26024, 47, 743);
INSERT INTO public.round_player_scores VALUES (26024, 46, 10);
INSERT INTO public.round_player_scores VALUES (26024, 48, 139);
INSERT INTO public.round_player_scores VALUES (26024, 50, 150);
INSERT INTO public.round_player_scores VALUES (26025, 46, 10);
INSERT INTO public.round_player_scores VALUES (26025, 47, 243);
INSERT INTO public.round_player_scores VALUES (26025, 48, 76);
INSERT INTO public.round_player_scores VALUES (26026, 46, 10);
INSERT INTO public.round_player_scores VALUES (26026, 47, 65);
INSERT INTO public.round_player_scores VALUES (26026, 48, 1);


--
-- Data for Name: round_players; Type: TABLE DATA; Schema: public; Owner: dev
--

INSERT INTO public.round_players VALUES (1628718728212966, 1624, 7907969, '44ef9ec3', 8210, 4, 4, 3, 0, 1965, 8748.39, 5647.73, 25627);
INSERT INTO public.round_players VALUES (1628718728212966, 1624, 5018113, '7a16c0f3', 7635, 3, 5, 6, 0, 1097, 6084.19, 3311.67, 25628);
INSERT INTO public.round_players VALUES (1628718728212966, 1624, -10114, 'ec228def', 7459, 0, 3, 0, 1, 140, 1366.28, 4099.1, 25629);
INSERT INTO public.round_players VALUES (1628718728212966, 1624, -1266, 'd830b467', 7963, 0, 0, 0, 1, 13, 498.32, 4188.9, 25630);
INSERT INTO public.round_players VALUES (1628718728212966, 1624, -1166, 'a7ceb306', 8300, 0, 4, 8, 0, 417, 2123.66, 213.9, 25631);
INSERT INTO public.round_players VALUES (1628718728212966, 1624, -5578, 'a7ceb306', 8300, 0, 1, 0, 1, 216, 4113.63, 4250.92, 25632);
INSERT INTO public.round_players VALUES (1628718728212966, 1624, -1448, 'a7ceb306', 8300, 0, 1, 2, 0, 78, 148.67, 0.0, 25633);
INSERT INTO public.round_players VALUES (1628718728212966, 1624, -21110, '504eb912', 8146, 0, 0, 0, 1, 19, 840.7, 3108.59, 25634);
INSERT INTO public.round_players VALUES (1628718728212966, 1624, -2912, 'e9e083e7', 7824, 0, 3, 2, 0, 534, 1931.04, 4269.08, 25635);
INSERT INTO public.round_players VALUES (1628718728212966, 1624, -4628, 'f45e31a9', 7824, 0, 0, 0, 1, 11, 485.34, 3418.82, 25636);
INSERT INTO public.round_players VALUES (1628718728212966, 1624, 6884232, '68a8f584', 8291, 0, 4, 0, 0, 185, 1077.44, 0.0, 25637);
INSERT INTO public.round_players VALUES (1628718728212966, 1624, 3541656, '856e3d09', 7834, 1, 1, 0, 1, 362, 3391.51, 2970.87, 25638);
INSERT INTO public.round_players VALUES (1628718728212966, 1624, 10271124, '1cbd18ed', 7886, 0, 1, 0, 1, 280, 3626.83, 2700.31, 25639);
INSERT INTO public.round_players VALUES (1628718728212966, 1624, 8863049, '67ea6de1', 7611, 0, 1, 0, 1, 125, 4409.32, 4110.21, 25640);
INSERT INTO public.round_players VALUES (1628718728212966, 1624, 5154927, '10f7f1c2', 7448, 1, 5, 3, 0, 1507, 7472.64, 1355.6, 25641);
INSERT INTO public.round_players VALUES (1628718728212966, 1624, 3588454, '5219cebf', 8392, 0, 2, 0, 1, 88, 1531.43, 4203.69, 25642);
INSERT INTO public.round_players VALUES (1628719058239445, 1625, 2578912, '4c2e577f', 7126, 1, 4, 0, 0, 744, 4697.23, 1574.12, 25643);
INSERT INTO public.round_players VALUES (1628719058239445, 1625, 4576722, 'bc5da0d3', 7781, 0, 1, 0, 1, 332, 1434.58, 4285.92, 25644);
INSERT INTO public.round_players VALUES (1628719058239445, 1625, 10936506, 'd1eeb25e', 7864, 1, 0, 0, 0, 376, 2308.72, 804.31, 25645);
INSERT INTO public.round_players VALUES (1628719058239445, 1625, 10276656, '7a14d97a', 7661, 1, 1, 0, 1, 139, 1506.46, 3787.13, 25646);
INSERT INTO public.round_players VALUES (1628719058239445, 1625, 1373956, 'e126a1d2', 7369, 2, 3, 0, 0, 750, 5595.62, 2013.92, 25647);
INSERT INTO public.round_players VALUES (1628719058239445, 1625, 9889917, 'd77836df', 7396, 0, 1, 0, 1, 290, 4899.82, 5244.31, 25648);
INSERT INTO public.round_players VALUES (1628719058239445, 1625, 10621252, 'b5b5dac9', 7992, 0, 3, 0, 1, 365, 3243.92, 3105.53, 25649);
INSERT INTO public.round_players VALUES (1628719058239445, 1625, 2217016, 'a30026dd', 8264, 0, 1, 0, 1, 48, 188.66, 2918.62, 25650);
INSERT INTO public.round_players VALUES (1628719058239445, 1625, 9504226, '24aea66f', 7838, 0, 1, 3, 1, 197, 3090.95, 2726.57, 25651);
INSERT INTO public.round_players VALUES (1628719058239445, 1625, 1796885, '25034404', 7693, 0, 1, 0, 0, 10, 20.56, 569.64, 25652);
INSERT INTO public.round_players VALUES (1628719058239445, 1625, 7907969, '44ef9ec3', 8210, 2, 5, 0, 0, 665, 5977.81, 4500.87, 25653);
INSERT INTO public.round_players VALUES (1628719058239445, 1625, 10885794, '74911c1b', 7670, 0, 2, 0, 1, 690, 2571.9, 4170.91, 25654);
INSERT INTO public.round_players VALUES (1628719058239445, 1625, 5454696, '941f5bbb', 7609, 1, 4, 0, 0, 762, 4607.74, 1451.74, 25655);
INSERT INTO public.round_players VALUES (1628719058239445, 1625, 94834, '1455685a', 7900, 0, 0, 0, 0, 0, 0.0, 0.0, 25656);
INSERT INTO public.round_players VALUES (1628719058239445, 1625, 3588454, '5219cebf', 8392, 0, 0, 0, 1, 36, 333.41, 1030.22, 25657);
INSERT INTO public.round_players VALUES (1628719058239445, 1625, 3312211, '5cca95b8', 7921, 1, 1, 0, 1, 215, 1357.98, 3651.55, 25658);
INSERT INTO public.round_players VALUES (1633137941586677, 1626, 7907969, 'e14609d3', 8217, 1, 5, 0, 0, 932, 5368.81, 686.7, 25659);
INSERT INTO public.round_players VALUES (1633137941586677, 1626, -2432, 'f45e31a9', 7824, 0, 2, 0, 1, 148, 1628.36, 3155.74, 25660);
INSERT INTO public.round_players VALUES (1633137941586677, 1626, -2518, 'ec228def', 7459, 0, 2, 0, 1, 84, 272.18, 1768.47, 25661);
INSERT INTO public.round_players VALUES (1633137941586677, 1626, -21378, 'a7ceb306', 8300, 0, 0, 0, 1, 11, 179.9, 4336.39, 25662);
INSERT INTO public.round_players VALUES (1633137941586677, 1626, -4794, '9d0273fd', 7747, 1, 1, 0, 0, 1132, 5812.36, 397.64, 25663);
INSERT INTO public.round_players VALUES (1633137941586677, 1626, 5446456, 'dc7795d9', 7996, 4, 3, 0, 0, 1543, 6340.06, 649.18, 25664);
INSERT INTO public.round_players VALUES (1633137941586677, 1626, 5317272, '8715e396', 7703, 0, 4, 0, 1, 722, 4373.33, 2901.2, 25665);
INSERT INTO public.round_players VALUES (1633137941586677, 1626, 4755269, '5ea47118', 7476, 1, 1, 0, 1, 379, 2091.78, 4645.33, 25666);
INSERT INTO public.round_players VALUES (1633137941586677, 1626, 8490318, '26e62f50', 8248, 0, 0, 0, 1, 18, 99.62, 2612.71, 25667);
INSERT INTO public.round_players VALUES (1633137941586677, 1626, 4626238, '24016f7a', 8299, 0, 3, 0, 0, 388, 2359.86, 1363.5, 25668);
INSERT INTO public.round_players VALUES (1633137941586677, 1626, 10431527, 'c549ec65', 7509, 0, 6, 0, 1, 561, 3867.9, 4381.35, 25669);
INSERT INTO public.round_players VALUES (1633137941586677, 1626, 11655260, '4b6127d1', 7286, 0, 3, 0, 1, 232, 1925.0, 4256.86, 25670);
INSERT INTO public.round_players VALUES (1633137941586677, 1626, 11747291, '3da1a765', 8021, 2, 1, 0, 1, 1040, 5499.39, 4581.81, 25671);
INSERT INTO public.round_players VALUES (1633137941586677, 1626, 3035660, '948493ab', 8402, 0, 0, 0, 1, 127, 2226.35, 3863.24, 25672);
INSERT INTO public.round_players VALUES (1633137941586677, 1626, 8580763, '4cf7c1d3', 8406, 2, 1, 0, 0, 975, 4564.66, 4775.41, 25673);
INSERT INTO public.round_players VALUES (1633137941586677, 1626, 7141412, '746c89cb', 7544, 0, 3, 0, 1, 206, 3273.05, 5507.08, 25674);
INSERT INTO public.round_players VALUES (1633138067523454, 1627, 7907969, 'e14609d3', 8217, 1, 0, 0, 1, 787, 5723.64, 4703.96, 25675);
INSERT INTO public.round_players VALUES (1633138067523454, 1627, 4755269, '5ea47118', 7476, 2, 2, 0, 1, 1536, 5761.57, 6403.97, 25676);
INSERT INTO public.round_players VALUES (1633138067523454, 1627, 11747291, '3da1a765', 8021, 3, 2, 0, 0, 1702, 7019.93, 2076.93, 25677);
INSERT INTO public.round_players VALUES (1633138067523454, 1627, 11655260, '4b6127d1', 7286, 0, 7, 0, 0, 361, 1919.76, 1771.81, 25678);
INSERT INTO public.round_players VALUES (1633138067523454, 1627, 5446456, 'dc7795d9', 7996, 1, 2, 0, 1, 729, 1163.2, 1970.2, 25679);
INSERT INTO public.round_players VALUES (1633138067523454, 1627, 5317272, '8715e396', 7703, 0, 1, 0, 1, 196, 1340.58, 2456.51, 25680);
INSERT INTO public.round_players VALUES (1633138067523454, 1627, 3618752, '554510f3', 8303, 0, 3, 0, 1, 249, 1959.77, 2677.64, 25681);
INSERT INTO public.round_players VALUES (1633138067523454, 1627, 4626238, '24016f7a', 8299, 0, 3, 0, 0, 552, 2479.54, 1770.26, 25682);
INSERT INTO public.round_players VALUES (1633138067523454, 1627, -2494, 'a77203f2', 7503, 0, 2, 0, 1, 319, 915.6, 949.26, 25683);
INSERT INTO public.round_players VALUES (1633138067523454, 1627, -21850, '7f5ea6b3', 7960, 1, 0, 0, 1, 479, 960.51, 1417.49, 25684);
INSERT INTO public.round_players VALUES (1633138067523454, 1627, -11456, 'f45e31a9', 7824, 0, 2, 0, 1, 581, 817.85, 265.66, 25685);
INSERT INTO public.round_players VALUES (1633138067523454, 1627, -1122, '9d0273fd', 7747, 0, 2, 0, 1, 102, 2111.02, 1596.9, 25686);
INSERT INTO public.round_players VALUES (1633138067523454, 1627, -2432, '21fe86fb', 8298, 2, 3, 0, 1, 336, 1067.59, 4091.24, 25687);
INSERT INTO public.round_players VALUES (1633138067523454, 1627, -2740, 'd830b467', 7963, 1, 1, 0, 1, 700, 2557.01, 5870.62, 25688);
INSERT INTO public.round_players VALUES (1633138067523454, 1627, 11690707, 'd737a6d9', 7595, 1, 2, 0, 1, 973, 5584.12, 2471.97, 25689);
INSERT INTO public.round_players VALUES (1633138067523454, 1627, 7141412, '746c89cb', 7544, 1, 3, 0, 1, 584, 3183.45, 4070.72, 25690);
INSERT INTO public.round_players VALUES (1633138291617985, 1628, 7907969, 'e14609d3', 8217, 3, 5, 0, 1, 2317, 11479.55, 3825.31, 25691);
INSERT INTO public.round_players VALUES (1633138291617985, 1628, -21906, 'e9e083e7', 7824, 1, 0, 0, 1, 159, 1336.09, 4706.75, 25692);
INSERT INTO public.round_players VALUES (1633138291617985, 1628, -2528, 'a77203f2', 7503, 0, 3, 0, 1, 277, 1404.79, 3302.12, 25693);
INSERT INTO public.round_players VALUES (1633138291617985, 1628, -1166, '21fe86fb', 8298, 1, 2, 0, 1, 545, 1188.57, 2774.06, 25694);
INSERT INTO public.round_players VALUES (1633138291617985, 1628, -21378, 'f45e31a9', 7824, 0, 0, 0, 0, 0, 0.0, 0.0, 25695);
INSERT INTO public.round_players VALUES (1633138291617985, 1628, -5104, 'ec228def', 7459, 0, 2, 0, 1, 34, 235.9, 1636.68, 25696);
INSERT INTO public.round_players VALUES (1633138291617985, 1628, -8820, 'a77203f2', 7503, 0, 3, 0, 1, 93, 550.8, 2732.53, 25697);
INSERT INTO public.round_players VALUES (1633138291617985, 1628, 8580763, '4cf7c1d3', 8406, 1, 3, 1, 1, 416, 2487.57, 4098.14, 25698);
INSERT INTO public.round_players VALUES (1633138291617985, 1628, 3035660, 'eeaeccea', 7881, 1, 2, 0, 1, 733, 2598.64, 2426.1, 25699);
INSERT INTO public.round_players VALUES (1633138291617985, 1628, 10169169, '33c16dbe', 8352, 0, 1, 0, 1, 238, 2264.64, 2515.67, 25700);
INSERT INTO public.round_players VALUES (1633138291617985, 1628, 4938602, '7282f4af', 7441, 3, 4, 0, 0, 1026, 4472.33, 766.07, 25701);
INSERT INTO public.round_players VALUES (1633138291617985, 1628, 6331418, '8e4bcb8c', 8074, 0, 5, 0, 1, 138, 1632.36, 2091.79, 25702);
INSERT INTO public.round_players VALUES (1633138291617985, 1628, 11239816, '651745b4', 8429, 1, 4, 1, 1, 853, 2953.06, 4083.55, 25703);
INSERT INTO public.round_players VALUES (1633138291617985, 1628, 4581019, '4442c4c6', 7751, 0, 5, 0, 1, 896, 4919.96, 1993.83, 25704);
INSERT INTO public.round_players VALUES (1633138291617985, 1628, 6805011, 'decfe131', 8551, 1, 5, 0, 0, 401, 2867.99, 1589.84, 25705);
INSERT INTO public.round_players VALUES (1633138291617985, 1628, 11690707, 'd737a6d9', 7595, 1, 3, 0, 1, 237, 1347.97, 3197.78, 25706);
INSERT INTO public.round_players VALUES (1633138498569990, 1629, 7907969, 'e14609d3', 8217, 1, 3, 0, 0, 690, 5998.44, 3233.24, 25707);
INSERT INTO public.round_players VALUES (1633138498569990, 1629, 7204217, '13c651a6', 8623, 1, 3, 0, 0, 1302, 4967.67, 3006.41, 25708);
INSERT INTO public.round_players VALUES (1633138498569990, 1629, 4010778, '613b494d', 8894, 1, 0, 0, 1, 907, 6208.72, 4994.92, 25709);
INSERT INTO public.round_players VALUES (1633138498569990, 1629, 4626238, '2556447f', 8299, 0, 3, 0, 1, 210, 2063.57, 4043.41, 25710);
INSERT INTO public.round_players VALUES (1633138498569990, 1629, 6805011, 'decfe131', 8551, 1, 1, 0, 1, 1155, 4054.92, 1797.42, 25711);
INSERT INTO public.round_players VALUES (1633138498569990, 1629, 8580763, '4cf7c1d3', 8406, 0, 1, 0, 1, 704, 5223.28, 3930.08, 25712);
INSERT INTO public.round_players VALUES (1633138498569990, 1629, 7070402, '663b52b2', 8862, 3, 3, 0, 0, 945, 4046.77, 2351.62, 25713);
INSERT INTO public.round_players VALUES (1633138498569990, 1629, 10169169, '33c16dbe', 8352, 1, 2, 0, 1, 1686, 5461.87, 2190.4, 25714);
INSERT INTO public.round_players VALUES (1633138498569990, 1629, 6088184, 'ab46c769', 8256, 0, 1, 0, 1, 63, 598.15, 1983.53, 25715);
INSERT INTO public.round_players VALUES (1633138498569990, 1629, 3729808, '3a59a567', 9008, 0, 1, 0, 1, 176, 3134.04, 2346.43, 25716);
INSERT INTO public.round_players VALUES (1633138498569990, 1629, -2652, 'c860bd9b', 8955, 0, 0, 0, 1, 13, 517.77, 7398.65, 25717);
INSERT INTO public.round_players VALUES (1633138498569990, 1629, -10632, 'a7ceb306', 8300, 0, 1, 0, 0, 93, 609.94, 3485.99, 25718);
INSERT INTO public.round_players VALUES (1633138498569990, 1629, 11239816, '651745b4', 8429, 0, 0, 0, 1, 28, 1107.78, 1805.09, 25719);
INSERT INTO public.round_players VALUES (1633138498569990, 1629, 11379046, 'c3404dfd', 8870, 1, 3, 0, 0, 970, 2796.62, 3043.78, 25720);
INSERT INTO public.round_players VALUES (1633138498569990, 1629, 5469906, '1157a497', 8002, 0, 0, 0, 1, 303, 1940.8, 5293.12, 25721);
INSERT INTO public.round_players VALUES (1633138498569990, 1629, 10965694, 'b03e1123', 8257, 1, 5, 0, 0, 515, 3604.36, 1430.61, 25722);
INSERT INTO public.round_players VALUES (1633138682560809, 1630, 7907969, 'e14609d3', 8217, 2, 3, 0, 0, 1551, 7474.41, 1418.37, 25723);
INSERT INTO public.round_players VALUES (1633138682560809, 1630, 7204217, '7fc3bc92', 8457, 2, 0, 0, 1, 1209, 3805.46, 5681.55, 25724);
INSERT INTO public.round_players VALUES (1633138682560809, 1630, 4068945, '17130b70', 7554, 0, 5, 0, 0, 593, 2001.56, 2807.36, 25725);
INSERT INTO public.round_players VALUES (1633138682560809, 1630, -6042, 'd830b467', 7963, 0, 0, 0, 1, 37, 1943.45, 4135.91, 25726);
INSERT INTO public.round_players VALUES (1633138682560809, 1630, -2652, 'a7ceb306', 8300, 0, 2, 0, 1, 176, 1331.96, 2365.23, 25727);
INSERT INTO public.round_players VALUES (1633138682560809, 1630, -1006, 'e9e083e7', 7824, 1, 5, 0, 0, 941, 2628.61, 2898.41, 25728);
INSERT INTO public.round_players VALUES (1633138682560809, 1630, -2494, '21fe86fb', 8298, 0, 1, 0, 1, 30, 944.11, 3363.32, 25729);
INSERT INTO public.round_players VALUES (1633138682560809, 1630, -4628, 'd830b467', 7963, 1, 4, 0, 0, 932, 5016.72, 3394.85, 25730);
INSERT INTO public.round_players VALUES (1633138682560809, 1630, -2528, 'f45e31a9', 7824, 0, 2, 0, 1, 295, 1166.07, 3095.53, 25731);
INSERT INTO public.round_players VALUES (1633138682560809, 1630, 6805011, 'decfe131', 8551, 0, 5, 0, 0, 462, 2481.25, 1639.17, 25732);
INSERT INTO public.round_players VALUES (1633138682560809, 1630, 4581019, '4442c4c6', 7751, 0, 0, 0, 1, 318, 5859.09, 1774.68, 25733);
INSERT INTO public.round_players VALUES (1633138682560809, 1630, 11239816, '651745b4', 8429, 0, 0, 0, 1, 109, 1928.6, 3925.38, 25734);
INSERT INTO public.round_players VALUES (1633138682560809, 1630, 2390230, 'c7e9edf5', 8044, 0, 1, 0, 1, 189, 3273.38, 2524.77, 25735);
INSERT INTO public.round_players VALUES (1633138682560809, 1630, 6088184, 'ab46c769', 8256, 0, 0, 0, 1, 38, 945.72, 2365.67, 25736);
INSERT INTO public.round_players VALUES (1633138682560809, 1630, 8580763, '4cf7c1d3', 8406, 3, 2, 0, 0, 724, 2809.45, 3265.62, 25737);
INSERT INTO public.round_players VALUES (1633138682560809, 1630, 89835, 'f38adb8f', 7762, 1, 3, 0, 1, 613, 3122.85, 2076.87, 25738);
INSERT INTO public.round_players VALUES (1633138915653607, 1631, 7907969, 'e14609d3', 8217, 2, 4, 2, 0, 1723, 11264.82, 1618.65, 25739);
INSERT INTO public.round_players VALUES (1633138915653607, 1631, 4320536, '64ab7573', 8549, 1, 1, 0, 1, 568, 5536.45, 4988.48, 25740);
INSERT INTO public.round_players VALUES (1633138915653607, 1631, -5544, 'a7ceb306', 8300, 0, 3, 0, 0, 91, 927.68, 2902.94, 25741);
INSERT INTO public.round_players VALUES (1633138915653607, 1631, -5702, 'a7ceb306', 8300, 0, 3, 0, 1, 512, 3948.23, 4513.12, 25742);
INSERT INTO public.round_players VALUES (1633138915653607, 1631, -2518, '95c3ff97', 8865, 0, 5, 0, 1, 106, 632.06, 2471.94, 25743);
INSERT INTO public.round_players VALUES (1633138915653607, 1631, -6042, 'c860bd9b', 8955, 0, 1, 0, 1, 37, 300.45, 6162.84, 25744);
INSERT INTO public.round_players VALUES (1633138915653607, 1631, -2912, '247902e6', 9329, 0, 2, 0, 1, 278, 1419.22, 3579.7, 25745);
INSERT INTO public.round_players VALUES (1633138915653607, 1631, -10632, 'c860bd9b', 8955, 0, 3, 0, 1, 230, 2043.34, 4819.09, 25746);
INSERT INTO public.round_players VALUES (1633138915653607, 1631, 7933514, '47d4e0d3', 9330, 1, 3, 0, 1, 324, 1986.51, 1475.66, 25747);
INSERT INTO public.round_players VALUES (1633138915653607, 1631, 4244191, '5ebce22c', 9283, 0, 0, 0, 0, 0, 0.0, 0.0, 25748);
INSERT INTO public.round_players VALUES (1633138915653607, 1631, 7088746, '12b40d37', 8345, 1, 2, 0, 1, 280, 3172.74, 6028.29, 25749);
INSERT INTO public.round_players VALUES (1633138915653607, 1631, 1047417, '957afe63', 9278, 2, 4, 0, 0, 1191, 6065.93, 1013.89, 25750);
INSERT INTO public.round_players VALUES (1633138915653607, 1631, 11280315, '88347018', 9055, 0, 4, 0, 1, 243, 2648.47, 6049.44, 25751);
INSERT INTO public.round_players VALUES (1633138915653607, 1631, 5988192, 'f26a3e8a', 8314, 0, 4, 0, 1, 582, 5769.35, 3835.79, 25752);
INSERT INTO public.round_players VALUES (1633138915653607, 1631, 4626238, '3207d9d8', 8299, 1, 4, 1, 0, 1028, 6078.86, 1299.48, 25753);
INSERT INTO public.round_players VALUES (1633138915653607, 1631, 1219523, '534ae076', 8980, 2, 2, 0, 0, 408, 2786.23, 3821.03, 25754);
INSERT INTO public.round_players VALUES (1633139064634885, 1632, 7907969, 'e14609d3', 8217, 4, 3, 1, 0, 3437, 17609.96, 4181.79, 25755);
INSERT INTO public.round_players VALUES (1633139064634885, 1632, -2408, '56bdfd40', 8212, 0, 2, 0, 1, 302, 1329.08, 3429.11, 25756);
INSERT INTO public.round_players VALUES (1633139064634885, 1632, -11456, '21fe86fb', 8298, 0, 0, 3, 1, 256, 118.84, 2372.46, 25757);
INSERT INTO public.round_players VALUES (1633139064634885, 1632, -5758, 'a7ceb306', 8300, 0, 5, 0, 0, 894, 3729.82, 654.47, 25758);
INSERT INTO public.round_players VALUES (1633139064634885, 1632, -2912, '95c3ff97', 8865, 0, 3, 0, 1, 115, 1119.59, 2918.83, 25759);
INSERT INTO public.round_players VALUES (1633139064634885, 1632, -1098, 'a7ceb306', 8300, 0, 4, 0, 1, 83, 768.73, 5626.68, 25760);
INSERT INTO public.round_players VALUES (1633139064634885, 1632, -6160, 'a7ceb306', 8300, 0, 3, 0, 1, 304, 2760.04, 3637.95, 25761);
INSERT INTO public.round_players VALUES (1633139064634885, 1632, 5096950, '3cab668c', 8004, 1, 6, 1, 1, 961, 3471.61, 5434.38, 25762);
INSERT INTO public.round_players VALUES (1633139064634885, 1632, 5096276, '3adfcdf0', 8346, 3, 4, 0, 0, 875, 3553.77, 3924.87, 25763);
INSERT INTO public.round_players VALUES (1633139064634885, 1632, 3070418, '2e1e8343', 8084, 0, 1, 0, 1, 237, 1682.4, 2484.88, 25764);
INSERT INTO public.round_players VALUES (1633139064634885, 1632, 10841458, '88aa936d', 8950, 0, 1, 0, 1, 156, 1852.29, 3710.95, 25765);
INSERT INTO public.round_players VALUES (1633139064634885, 1632, 11239816, '651745b4', 8429, 2, 2, 3, 1, 527, 2537.65, 3897.0, 25766);
INSERT INTO public.round_players VALUES (1633139064634885, 1632, 7088746, '12b40d37', 8345, 0, 5, 4, 1, 995, 8423.72, 4945.21, 25767);
INSERT INTO public.round_players VALUES (1633139064634885, 1632, 5988192, 'f26a3e8a', 8314, 3, 3, 5, 1, 1501, 8910.43, 3918.04, 25768);
INSERT INTO public.round_players VALUES (1633139064634885, 1632, 2390230, 'c7e9edf5', 8044, 0, 5, 0, 1, 118, 1633.12, 2650.48, 25769);
INSERT INTO public.round_players VALUES (1633139064634885, 1632, 11379046, 'c3404dfd', 8870, 0, 3, 0, 1, 593, 3943.74, 9657.69, 25770);
INSERT INTO public.round_players VALUES (1633139253672591, 1633, 7907969, 'e14609d3', 8217, 1, 3, 1, 1, 689, 7231.16, 3433.14, 25771);
INSERT INTO public.round_players VALUES (1633139253672591, 1633, 8932558, '9931ddfb', 8700, 0, 7, 3, 0, 981, 4664.12, 2693.34, 25772);
INSERT INTO public.round_players VALUES (1633139253672591, 1633, 5096950, '3cab668c', 8004, 2, 1, 0, 1, 926, 4969.65, 4893.78, 25773);
INSERT INTO public.round_players VALUES (1633139253672591, 1633, 5096276, '3adfcdf0', 8346, 0, 3, 1, 1, 612, 2635.8, 4441.1, 25774);
INSERT INTO public.round_players VALUES (1633139253672591, 1633, 5988192, 'f26a3e8a', 8314, 2, 4, 7, 0, 823, 3195.03, 1756.83, 25775);
INSERT INTO public.round_players VALUES (1633139253672591, 1633, 7088746, '12b40d37', 8345, 1, 5, 3, 0, 969, 4123.48, 742.96, 25776);
INSERT INTO public.round_players VALUES (1633139253672591, 1633, 10169169, '33c16dbe', 8352, 0, 4, 0, 1, 302, 4061.66, 1847.72, 25777);
INSERT INTO public.round_players VALUES (1633139253672591, 1633, 6093781, '976e182e', 9218, 0, 0, 0, 1, 15, 744.98, 2780.99, 25778);
INSERT INTO public.round_players VALUES (1633139253672591, 1633, 4320536, '64ab7573', 8549, 2, 3, 4, 1, 693, 3872.62, 6444.15, 25779);
INSERT INTO public.round_players VALUES (1633139253672591, 1633, -5030, '21fe86fb', 8298, 1, 0, 0, 1, 1097, 2633.87, 2956.17, 25780);
INSERT INTO public.round_players VALUES (1633139253672591, 1633, -1448, '95c3ff97', 8865, 0, 1, 0, 1, 391, 1205.29, 1871.54, 25781);
INSERT INTO public.round_players VALUES (1633139253672591, 1633, -1322, '21fe86fb', 8298, 0, 1, 0, 1, 151, 1688.86, 2180.17, 25782);
INSERT INTO public.round_players VALUES (1633139253672591, 1633, -11726, 'c860bd9b', 8955, 1, 2, 0, 1, 694, 3777.77, 4899.0, 25783);
INSERT INTO public.round_players VALUES (1633139253672591, 1633, -9686, 'a7ceb306', 8300, 0, 2, 0, 1, 37, 316.12, 3833.24, 25784);
INSERT INTO public.round_players VALUES (1633139253672591, 1633, -11456, 'a7ceb306', 8300, 0, 4, 0, 1, 108, 799.32, 4452.71, 25785);
INSERT INTO public.round_players VALUES (1633139253672591, 1633, 11239816, '651745b4', 8429, 2, 4, 7, 0, 1300, 4728.68, 1421.57, 25786);
INSERT INTO public.round_players VALUES (1633139532697000, 1634, 7907969, 'e14609d3', 8217, 2, 6, 1, 0, 1413, 9859.0, 2645.93, 25787);
INSERT INTO public.round_players VALUES (1633139532697000, 1634, -6054, '56bdfd40', 8212, 1, 2, 0, 1, 330, 1271.09, 3412.25, 25788);
INSERT INTO public.round_players VALUES (1633139532697000, 1634, -2528, '8cb777b9', 7535, 0, 5, 0, 1, 812, 2714.03, 5117.56, 25789);
INSERT INTO public.round_players VALUES (1633139532697000, 1634, -2912, '21fe86fb', 8298, 0, 2, 0, 1, 151, 781.07, 2585.91, 25790);
INSERT INTO public.round_players VALUES (1633139532697000, 1634, -21906, 'e9e083e7', 7824, 0, 5, 0, 1, 226, 773.95, 4572.97, 25791);
INSERT INTO public.round_players VALUES (1633139532697000, 1634, -8820, 'e9e083e7', 7824, 0, 4, 0, 1, 578, 1812.39, 4477.48, 25792);
INSERT INTO public.round_players VALUES (1633139532697000, 1634, -2304, '9d0273fd', 7747, 0, 2, 0, 1, 604, 4122.98, 1548.26, 25793);
INSERT INTO public.round_players VALUES (1633139532697000, 1634, -10114, '7f5ea6b3', 7960, 0, 4, 0, 1, 178, 699.98, 2125.76, 25794);
INSERT INTO public.round_players VALUES (1633139532697000, 1634, -2550, 'f45e31a9', 7824, 0, 1, 0, 1, 88, 577.53, 3472.81, 25795);
INSERT INTO public.round_players VALUES (1633139532697000, 1634, 3223502, 'fd284917', 7998, 2, 5, 0, 0, 1425, 6277.05, 1059.24, 25796);
INSERT INTO public.round_players VALUES (1633139532697000, 1634, 7757846, 'b6a26cf5', 7708, 2, 2, 0, 1, 337, 2405.28, 3332.92, 25797);
INSERT INTO public.round_players VALUES (1633139532697000, 1634, 4581019, '4442c4c6', 7751, 2, 4, 0, 0, 1043, 6537.93, 740.11, 25798);
INSERT INTO public.round_players VALUES (1633139532697000, 1634, 89835, 'f38adb8f', 7762, 0, 1, 0, 1, 633, 2688.59, 3335.49, 25799);
INSERT INTO public.round_players VALUES (1633139532697000, 1634, 5776682, '175059ce', 7904, 1, 4, 0, 1, 1287, 3185.1, 3498.2, 25800);
INSERT INTO public.round_players VALUES (1633139532697000, 1634, 7088746, '12b40d37', 8345, 1, 2, 0, 1, 538, 2541.67, 5985.41, 25801);
INSERT INTO public.round_players VALUES (1633139532697000, 1634, 5988192, 'f26a3e8a', 8314, 2, 4, 0, 1, 1055, 4720.85, 3058.19, 25802);
INSERT INTO public.round_players VALUES (1633139692681264, 1635, 7907969, 'e14609d3', 8217, 2, 2, 0, 1, 777, 7247.95, 5628.23, 25803);
INSERT INTO public.round_players VALUES (1633139692681264, 1635, 3223502, 'fd284917', 7998, 0, 3, 0, 1, 197, 2844.8, 3135.17, 25804);
INSERT INTO public.round_players VALUES (1633139692681264, 1635, 5776682, '175059ce', 7904, 0, 0, 0, 1, 16, 807.59, 4139.16, 25805);
INSERT INTO public.round_players VALUES (1633139692681264, 1635, 5988192, 'f26a3e8a', 8314, 2, 4, 0, 0, 992, 5464.14, 2200.24, 25806);
INSERT INTO public.round_players VALUES (1633139692681264, 1635, 7088746, '12b40d37', 8345, 0, 8, 0, 0, 546, 4039.65, 1697.4, 25807);
INSERT INTO public.round_players VALUES (1633139692681264, 1635, 9307608, '40b46c8a', 7753, 1, 1, 0, 1, 631, 3057.24, 1796.77, 25808);
INSERT INTO public.round_players VALUES (1633139692681264, 1635, 11690707, 'd737a6d9', 7595, 0, 2, 0, 1, 77, 1042.38, 2967.08, 25809);
INSERT INTO public.round_players VALUES (1633139692681264, 1635, 7757846, 'b6a26cf5', 7708, 0, 3, 0, 1, 37, 575.22, 2785.97, 25810);
INSERT INTO public.round_players VALUES (1633139692681264, 1635, 4581019, '4442c4c6', 7751, 0, 3, 0, 1, 292, 3682.79, 2734.59, 25811);
INSERT INTO public.round_players VALUES (1633139692681264, 1635, -4966, 'd830b467', 7963, 1, 1, 0, 1, 457, 4827.29, 4672.63, 25812);
INSERT INTO public.round_players VALUES (1633139692681264, 1635, -12294, 'e9e083e7', 7824, 0, 3, 0, 1, 346, 1336.51, 4223.77, 25813);
INSERT INTO public.round_players VALUES (1633139692681264, 1635, -5078, '8cb777b9', 7535, 0, 0, 0, 1, 41, 937.16, 3637.44, 25814);
INSERT INTO public.round_players VALUES (1633139692681264, 1635, -10336, 'd830b467', 7963, 0, 4, 0, 1, 298, 2545.12, 5055.68, 25815);
INSERT INTO public.round_players VALUES (1633139692681264, 1635, 2278623, '319436d0', 8490, 0, 2, 0, 1, 483, 4016.35, 4654.05, 25816);
INSERT INTO public.round_players VALUES (1633139692681264, 1635, 10919066, '3251d4bb', 7167, 5, 1, 0, 0, 1020, 5422.9, 2567.03, 25817);
INSERT INTO public.round_players VALUES (1633139692681264, 1635, 10935416, '6f4bb8d5', 7877, 1, 4, 0, 0, 763, 6915.93, 2867.81, 25818);
INSERT INTO public.round_players VALUES (1633139836750622, 1636, 7907969, 'e14609d3', 8217, 0, 3, 1, 1, 933, 12685.52, 4938.26, 25819);
INSERT INTO public.round_players VALUES (1633139836750622, 1636, 5096950, '3cab668c', 8004, 0, 2, 0, 1, 179, 1220.68, 5688.76, 25820);
INSERT INTO public.round_players VALUES (1633139836750622, 1636, 5096276, '84eddf71', 7275, 0, 1, 0, 1, 30, 138.33, 3294.61, 25821);
INSERT INTO public.round_players VALUES (1633139836750622, 1636, 5988192, 'f26a3e8a', 8314, 2, 3, 2, 0, 938, 3826.06, 1521.15, 25822);
INSERT INTO public.round_players VALUES (1633139836750622, 1636, 7088746, '12b40d37', 8345, 1, 4, 2, 0, 830, 3546.67, 1019.91, 25823);
INSERT INTO public.round_players VALUES (1633139836750622, 1636, 8490318, '26e62f50', 8248, 1, 3, 0, 1, 660, 2804.41, 3756.01, 25824);
INSERT INTO public.round_players VALUES (1633139836750622, 1636, 5624250, '207eda42', 7937, 2, 4, 0, 0, 1415, 9699.44, 2490.55, 25825);
INSERT INTO public.round_players VALUES (1633139836750622, 1636, 4581019, '4442c4c6', 7751, 2, 2, 0, 0, 1305, 3990.96, 2540.75, 25826);
INSERT INTO public.round_players VALUES (1633139836750622, 1636, 10935416, '6f4bb8d5', 7877, 2, 2, 0, 1, 394, 1992.7, 2591.42, 25827);
INSERT INTO public.round_players VALUES (1633139836750622, 1636, -2494, '9d0273fd', 7747, 0, 2, 0, 0, 517, 1130.14, 2791.44, 25828);
INSERT INTO public.round_players VALUES (1633139836750622, 1636, -1098, '504eb912', 8146, 0, 0, 0, 1, 0, 0.0, 3256.34, 25829);
INSERT INTO public.round_players VALUES (1633139836750622, 1636, -2550, '7f5ea6b3', 7960, 0, 4, 0, 1, 343, 1619.86, 2437.48, 25830);
INSERT INTO public.round_players VALUES (1633139836750622, 1636, -10612, '7f5ea6b3', 7960, 0, 1, 0, 1, 78, 412.37, 1719.39, 25831);
INSERT INTO public.round_players VALUES (1633139836750622, 1636, -5104, 'e9e083e7', 7824, 1, 3, 0, 1, 522, 2129.57, 4152.0, 25832);
INSERT INTO public.round_players VALUES (1633139836750622, 1636, -2912, '9d0273fd', 7747, 0, 0, 0, 1, 20, 285.69, 1751.81, 25833);
INSERT INTO public.round_players VALUES (1633139836750622, 1636, 11551481, 'a3987fa5', 7556, 0, 5, 0, 1, 168, 1053.9, 2586.42, 25834);
INSERT INTO public.round_players VALUES (1633140010812306, 1637, 7907969, 'e14609d3', 8217, 3, 2, 0, 0, 901, 5903.91, 399.91, 25835);
INSERT INTO public.round_players VALUES (1633140010812306, 1637, 3223502, 'fd284917', 7998, 0, 1, 0, 1, 100, 1665.5, 3362.77, 25836);
INSERT INTO public.round_players VALUES (1633140010812306, 1637, 5776682, '175059ce', 7904, 1, 0, 2, 1, 105, 806.0, 3476.64, 25837);
INSERT INTO public.round_players VALUES (1633140010812306, 1637, 5988192, 'f26a3e8a', 8314, 3, 4, 0, 0, 982, 5466.72, 2536.44, 25838);
INSERT INTO public.round_players VALUES (1633140010812306, 1637, 7088746, '12b40d37', 8345, 0, 7, 0, 0, 620, 3840.44, 2553.53, 25839);
INSERT INTO public.round_players VALUES (1633140010812306, 1637, 4626238, '5a2ffbd0', 8300, 0, 1, 0, 1, 356, 3627.1, 4340.22, 25840);
INSERT INTO public.round_players VALUES (1633140010812306, 1637, 10169169, '33c16dbe', 8352, 0, 4, 0, 0, 193, 1589.22, 263.87, 25841);
INSERT INTO public.round_players VALUES (1633140010812306, 1637, 10965694, 'b03e1123', 8257, 0, 7, 0, 0, 405, 3018.99, 1736.49, 25842);
INSERT INTO public.round_players VALUES (1633140010812306, 1637, 4581019, '4442c4c6', 7751, 0, 3, 0, 0, 207, 2244.64, 1104.18, 25843);
INSERT INTO public.round_players VALUES (1633140010812306, 1637, 11647091, '1a971ea2', 8380, 0, 1, 0, 1, 50, 972.35, 3950.88, 25844);
INSERT INTO public.round_players VALUES (1633140010812306, 1637, -5578, '7f5ea6b3', 7960, 0, 5, 0, 1, 75, 564.81, 2164.0, 25845);
INSERT INTO public.round_players VALUES (1633140010812306, 1637, -4628, '9d0273fd', 7747, 0, 1, 0, 1, 40, 960.99, 2221.45, 25846);
INSERT INTO public.round_players VALUES (1633140010812306, 1637, 8490318, '26e62f50', 8248, 0, 0, 0, 1, 23, 1455.55, 2944.57, 25847);
INSERT INTO public.round_players VALUES (1633140010812306, 1637, 6352337, 'f5b52174', 7959, 0, 0, 0, 1, 14, 186.89, 3303.82, 25848);
INSERT INTO public.round_players VALUES (1633140010812306, 1637, 5624250, '207eda42', 7937, 2, 4, 0, 0, 834, 5864.11, 2027.62, 25849);
INSERT INTO public.round_players VALUES (1633140010812306, 1637, 1969335, '407c3431', 8586, 0, 0, 0, 1, 102, 3071.23, 4852.06, 25850);
INSERT INTO public.round_players VALUES (1633140170793983, 1638, 9957215, 'c030d661', 7945, 0, 6, 0, 1, 619, 3255.84, 1746.24, 25851);
INSERT INTO public.round_players VALUES (1633140170793983, 1638, 1969335, '407c3431', 8586, 4, 4, 0, 1, 1695, 7364.73, 5336.59, 25852);
INSERT INTO public.round_players VALUES (1633140170793983, 1638, -5702, '504eb912', 8146, 0, 1, 0, 1, 301, 1166.13, 4089.68, 25853);
INSERT INTO public.round_players VALUES (1633140170793983, 1638, -1066, 'a7ceb306', 8300, 0, 2, 0, 1, 17, 14.28, 1474.78, 25854);
INSERT INTO public.round_players VALUES (1633140170793983, 1638, -5816, '504eb912', 8146, 0, 1, 0, 1, 142, 431.8, 2398.62, 25855);
INSERT INTO public.round_players VALUES (1633140170793983, 1638, -5720, 'a7ceb306', 8300, 0, 3, 0, 1, 296, 1047.5, 1856.04, 25856);
INSERT INTO public.round_players VALUES (1633140170793983, 1638, -2432, 'a7ceb306', 8300, 0, 3, 0, 1, 66, 415.93, 4250.36, 25857);
INSERT INTO public.round_players VALUES (1633140170793983, 1638, -10114, '21fe86fb', 8298, 0, 2, 0, 1, 414, 972.11, 2831.02, 25858);
INSERT INTO public.round_players VALUES (1633140170793983, 1638, -2550, '504eb912', 8146, 0, 0, 0, 1, 11, 20.07, 4583.37, 25859);
INSERT INTO public.round_players VALUES (1633140170793983, 1638, -2316, '7f5ea6b3', 7960, 1, 1, 0, 1, 451, 2000.0, 1959.0, 25860);
INSERT INTO public.round_players VALUES (1633140170793983, 1638, 7907969, 'e14609d3', 8217, 1, 3, 0, 1, 943, 8865.28, 6228.9, 25861);
INSERT INTO public.round_players VALUES (1633140170793983, 1638, 5988192, 'f26a3e8a', 8314, 2, 3, 0, 0, 1993, 7289.05, 1730.64, 25862);
INSERT INTO public.round_players VALUES (1633140170793983, 1638, 7088746, '12b40d37', 8345, 2, 4, 0, 0, 1116, 4697.33, 1649.11, 25863);
INSERT INTO public.round_players VALUES (1633140170793983, 1638, 3223502, 'fd284917', 7998, 1, 4, 0, 1, 863, 3299.62, 2886.04, 25864);
INSERT INTO public.round_players VALUES (1633140170793983, 1638, 5341963, '17762911', 8830, 2, 3, 0, 1, 1004, 4367.07, 3537.71, 25865);
INSERT INTO public.round_players VALUES (1633140170793983, 1638, 5776682, '175059ce', 7904, 1, 3, 1, 1, 814, 5218.75, 3867.39, 25866);
INSERT INTO public.round_players VALUES (1633787688959384, 1639, 7907969, 'e14609d3', 8217, 0, 5, 0, 1, 162, 2918.9, 3034.34, 25867);
INSERT INTO public.round_players VALUES (1633787688959384, 1639, 9135214, '018c914e', 8490, 1, 6, 0, 1, 2147, 10019.64, 2842.05, 25868);
INSERT INTO public.round_players VALUES (1633787688959384, 1639, 3146412, '2a7d0a8d', 9355, 5, 2, 0, 0, 2993, 13983.19, 3260.4, 25869);
INSERT INTO public.round_players VALUES (1633787688959384, 1639, 9788586, 'a630bfeb', 9320, 1, 3, 0, 1, 444, 3388.16, 4140.69, 25870);
INSERT INTO public.round_players VALUES (1633787688959384, 1639, 2509007, '801bcbe4', 8947, 1, 5, 0, 1, 1498, 5737.49, 3668.14, 25871);
INSERT INTO public.round_players VALUES (1633787688959384, 1639, -5816, '21fe86fb', 8298, 0, 1, 0, 1, 198, 1372.95, 3290.42, 25872);
INSERT INTO public.round_players VALUES (1633787688959384, 1639, -2494, 'c860bd9b', 8955, 2, 1, 0, 1, 676, 2878.9, 6199.27, 25873);
INSERT INTO public.round_players VALUES (1633787688959384, 1639, -161400, '95c3ff97', 8865, 0, 3, 0, 1, 151, 1061.62, 3095.1, 25874);
INSERT INTO public.round_players VALUES (1633787688959384, 1639, -6160, 'c860bd9b', 8955, 1, 4, 0, 1, 375, 2806.22, 4453.78, 25875);
INSERT INTO public.round_players VALUES (1633787688959384, 1639, -2304, '247902e6', 9329, 0, 2, 0, 1, 263, 380.1, 2461.76, 25876);
INSERT INTO public.round_players VALUES (1633787688959384, 1639, -2550, '21fe86fb', 8298, 0, 5, 0, 1, 312, 801.56, 3709.72, 25877);
INSERT INTO public.round_players VALUES (1633787688959384, 1639, 10775619, '6e6a50a3', 8831, 2, 2, 0, 1, 976, 4653.53, 2613.09, 25878);
INSERT INTO public.round_players VALUES (1633787688959384, 1639, 1846782, 'caa1add7', 8341, 0, 0, 0, 1, 212, 88.64, 2460.01, 25879);
INSERT INTO public.round_players VALUES (1633787688959384, 1639, 7153241, 'dccc9d51', 9159, 1, 0, 0, 1, 368, 795.6, 3900.01, 25880);
INSERT INTO public.round_players VALUES (1633787688959384, 1639, 2183002, '14797e7b', 9176, 0, 5, 0, 1, 228, 1844.86, 2213.47, 25881);
INSERT INTO public.round_players VALUES (1633787688959384, 1639, 2320918, '02724f18', 9213, 1, 3, 0, 1, 798, 2858.0, 4247.11, 25882);
INSERT INTO public.round_players VALUES (1633787999142331, 1640, 7907969, 'e14609d3', 8217, 0, 6, 0, 0, 1337, 7549.02, 1902.79, 25883);
INSERT INTO public.round_players VALUES (1633787999142331, 1640, 2002698, '2a41a230', 8363, 2, 5, 0, 0, 325, 1170.54, 1876.82, 25884);
INSERT INTO public.round_players VALUES (1633787999142331, 1640, 5205869, '5162a401', 8458, 0, 2, 0, 1, 242, 4234.72, 2416.45, 25885);
INSERT INTO public.round_players VALUES (1633787999142331, 1640, 2263015, 'c88b0582', 8615, 1, 1, 0, 0, 542, 1820.26, 2543.18, 25886);
INSERT INTO public.round_players VALUES (1633787999142331, 1640, 1061794, 'bc08ae72', 8376, 1, 1, 0, 1, 274, 2000.05, 3725.2, 25887);
INSERT INTO public.round_players VALUES (1633787999142331, 1640, 8354393, '0237a897', 8281, 0, 5, 0, 1, 74, 559.14, 3312.44, 25888);
INSERT INTO public.round_players VALUES (1633787999142331, 1640, 11727599, 'a3242251', 8302, 0, 2, 0, 1, 526, 4415.59, 4070.73, 25889);
INSERT INTO public.round_players VALUES (1633787999142331, 1640, 11772027, '526fc2ab', 8171, 1, 2, 0, 1, 505, 2643.01, 4037.57, 25890);
INSERT INTO public.round_players VALUES (1633787999142331, 1640, 6509740, '57b5fed2', 7997, 3, 1, 0, 0, 2383, 7278.51, 1869.04, 25891);
INSERT INTO public.round_players VALUES (1633787999142331, 1640, 7496872, 'f774bb41', 8433, 1, 3, 0, 0, 556, 2802.8, 68.16, 25892);
INSERT INTO public.round_players VALUES (1633787999142331, 1640, 5202131, '04d22ad0', 8201, 0, 3, 0, 1, 221, 1924.69, 1090.16, 25893);
INSERT INTO public.round_players VALUES (1633787999142331, 1640, -2518, 'd830b467', 7963, 0, 1, 0, 1, 258, 1440.89, 4983.75, 25894);
INSERT INTO public.round_players VALUES (1633787999142331, 1640, -1166, '56bdfd40', 8212, 0, 0, 0, 1, 14, 783.31, 3897.32, 25895);
INSERT INTO public.round_players VALUES (1633787999142331, 1640, 8107813, '62731fd8', 7967, 1, 3, 0, 0, 435, 1596.12, 1098.83, 25896);
INSERT INTO public.round_players VALUES (1633787999142331, 1640, 1431689, 'f4424f4d', 8289, 0, 3, 0, 1, 130, 1451.96, 2745.56, 25897);
INSERT INTO public.round_players VALUES (1633787999142331, 1640, 10742258, '8cd8a5b4', 8279, 0, 0, 0, 1, 22, 201.68, 2234.29, 25898);
INSERT INTO public.round_players VALUES (1633788175192852, 1641, 7907969, 'e14609d3', 8217, 1, 2, 0, 1, 545, 4584.09, 3788.58, 25899);
INSERT INTO public.round_players VALUES (1633788175192852, 1641, 1402389, 'c01c5215', 8071, 1, 1, 0, 0, 408, 1829.86, 27.59, 25900);
INSERT INTO public.round_players VALUES (1633788175192852, 1641, 8354393, '0237a897', 8281, 0, 1, 1, 1, 69, 973.49, 2985.36, 25901);
INSERT INTO public.round_players VALUES (1633788175192852, 1641, -2316, 'ec228def', 7459, 0, 0, 0, 1, 26, 169.93, 2777.17, 25902);
INSERT INTO public.round_players VALUES (1633788175192852, 1641, -9686, 'a77203f2', 7503, 1, 0, 0, 0, 595, 1848.66, 915.14, 25903);
INSERT INTO public.round_players VALUES (1633788175192852, 1641, 5311414, '53a14351', 7813, 0, 0, 0, 0, 0, 0.0, 0.0, 25904);
INSERT INTO public.round_players VALUES (1633788175192852, 1641, 9790757, '5a969b4f', 7670, 0, 0, 1, 1, 63, 1261.01, 3361.32, 25905);
INSERT INTO public.round_players VALUES (1633788175192852, 1641, 11285387, '6729cce6', 7997, 0, 0, 1, 1, 43, 751.64, 4168.62, 25906);
INSERT INTO public.round_players VALUES (1633788175192852, 1641, 10345758, '4f9da249', 8178, 0, 4, 0, 0, 653, 3386.36, 392.26, 25907);
INSERT INTO public.round_players VALUES (1633788175192852, 1641, 7864086, 'ce57e8e2', 7735, 0, 1, 0, 1, 113, 2840.52, 3455.53, 25908);
INSERT INTO public.round_players VALUES (1633788175192852, 1641, 10636656, '535200d0', 8065, 2, 3, 0, 0, 529, 2916.56, 1970.76, 25909);
INSERT INTO public.round_players VALUES (1633788175192852, 1641, 1632686, 'd4ced978', 7596, 0, 3, 0, 0, 463, 2389.47, 0.0, 25910);
INSERT INTO public.round_players VALUES (1633788175192852, 1641, 9337475, '51d683ec', 7718, 1, 0, 0, 1, 323, 2834.53, 2330.37, 25911);
INSERT INTO public.round_players VALUES (1633788175192852, 1641, 8449649, 'dd5cd50c', 7250, 0, 2, 0, 0, 31, 166.18, 0.0, 25912);
INSERT INTO public.round_players VALUES (1633788175192852, 1641, 1139996, 'f8528e7c', 7411, 2, 1, 0, 0, 934, 5917.03, 3670.01, 25913);
INSERT INTO public.round_players VALUES (1633788175192852, 1641, 10641437, '092deb21', 7402, 0, 1, 0, 1, 181, 1933.22, 3959.84, 25914);
INSERT INTO public.round_players VALUES (1633788333116003, 1642, 7907969, 'e14609d3', 8217, 5, 1, 0, 0, 2740, 11268.4, 2411.88, 25915);
INSERT INTO public.round_players VALUES (1633788333116003, 1642, 11583863, 'b9bf8919', 8903, 0, 2, 0, 1, 728, 3588.92, 2548.94, 25916);
INSERT INTO public.round_players VALUES (1633788333116003, 1642, 11583864, 'ab86f225', 8829, 1, 1, 0, 1, 738, 3795.88, 4786.19, 25917);
INSERT INTO public.round_players VALUES (1633788333116003, 1642, 11772027, '526fc2ab', 8171, 0, 1, 0, 1, 61, 700.39, 4397.47, 25918);
INSERT INTO public.round_players VALUES (1633788333116003, 1642, 8259700, 'ea8d7579', 8112, 0, 0, 0, 1, 137, 1647.14, 2032.83, 25919);
INSERT INTO public.round_players VALUES (1633788333116003, 1642, -2432, '95c3ff97', 8865, 1, 5, 0, 0, 467, 1413.63, 325.19, 25920);
INSERT INTO public.round_players VALUES (1633788333116003, 1642, -2376, '504eb912', 8146, 0, 1, 0, 1, 51, 364.22, 2477.16, 25921);
INSERT INTO public.round_players VALUES (1633788333116003, 1642, -6054, '95c3ff97', 8865, 0, 3, 0, 1, 38, 250.78, 3322.33, 25922);
INSERT INTO public.round_players VALUES (1633788333116003, 1642, -1122, '56bdfd40', 8212, 1, 1, 0, 1, 508, 2605.86, 3935.76, 25923);
INSERT INTO public.round_players VALUES (1633788333116003, 1642, -21378, '21fe86fb', 8298, 1, 3, 0, 1, 1119, 2626.3, 2922.58, 25924);
INSERT INTO public.round_players VALUES (1633788333116003, 1642, -5078, '95c3ff97', 8865, 0, 2, 0, 1, 175, 433.75, 2470.17, 25925);
INSERT INTO public.round_players VALUES (1633788333116003, 1642, 7535475, 'c9edfc05', 8143, 1, 3, 0, 1, 209, 2496.23, 3301.92, 25926);
INSERT INTO public.round_players VALUES (1633788333116003, 1642, 8749953, '77d0f2ae', 8146, 0, 4, 0, 0, 760, 2533.55, 211.66, 25927);
INSERT INTO public.round_players VALUES (1633788333116003, 1642, 3226531, 'a93e24e5', 7199, 0, 3, 0, 0, 296, 1338.89, 857.53, 25928);
INSERT INTO public.round_players VALUES (1633788333116003, 1642, 141454, 'd5bbd51d', 8354, 1, 6, 0, 0, 1001, 4256.02, 1517.39, 25929);
INSERT INTO public.round_players VALUES (1633788333116003, 1642, 2004918, '2f6ac048', 8395, 0, 4, 0, 1, 306, 2262.87, 4063.83, 25930);
INSERT INTO public.round_players VALUES (1633788515114901, 1643, 11284391, 'ebccb2ce', 7708, 2, 4, 0, 1, 847, 5597.46, 4467.04, 25931);
INSERT INTO public.round_players VALUES (1633788515114901, 1643, 10654950, '3bc695e9', 8493, 0, 4, 0, 1, 803, 5028.13, 2583.34, 25932);
INSERT INTO public.round_players VALUES (1633788515114901, 1643, 6469607, '98e51c91', 8975, 0, 5, 0, 1, 656, 4925.78, 3593.53, 25933);
INSERT INTO public.round_players VALUES (1633788515114901, 1643, 4480152, 'ca89f85b', 9010, 0, 4, 0, 1, 472, 2956.51, 4124.08, 25934);
INSERT INTO public.round_players VALUES (1633788515114901, 1643, -5720, '504eb912', 8146, 0, 4, 0, 1, 185, 1097.09, 3988.85, 25935);
INSERT INTO public.round_players VALUES (1633788515114901, 1643, -1300, 'c860bd9b', 8955, 0, 1, 0, 1, 42, 570.61, 4263.81, 25936);
INSERT INTO public.round_players VALUES (1633788515114901, 1643, -2912, 'a7ceb306', 8300, 2, 2, 0, 0, 569, 2330.15, 2687.11, 25937);
INSERT INTO public.round_players VALUES (1633788515114901, 1643, -10282, '95c3ff97', 8865, 0, 2, 0, 1, 39, 348.65, 2410.87, 25938);
INSERT INTO public.round_players VALUES (1633788515114901, 1643, -8820, 'c860bd9b', 8955, 1, 5, 0, 1, 597, 3049.78, 6121.45, 25939);
INSERT INTO public.round_players VALUES (1633788515114901, 1643, -22562, 'a7ceb306', 8300, 0, 5, 0, 1, 596, 2152.54, 5040.86, 25940);
INSERT INTO public.round_players VALUES (1633788515114901, 1643, 11782617, '3adbd7ae', 8290, 0, 1, 0, 1, 10, 0.31, 3810.82, 25941);
INSERT INTO public.round_players VALUES (1633788515114901, 1643, 1683933, '595584a8', 8837, 2, 4, 0, 1, 1263, 7427.46, 4302.18, 25942);
INSERT INTO public.round_players VALUES (1633788515114901, 1643, 7907969, 'e14609d3', 8217, 3, 4, 0, 1, 869, 8117.3, 4012.62, 25943);
INSERT INTO public.round_players VALUES (1633788515114901, 1643, 2509007, '801bcbe4', 8947, 2, 4, 0, 1, 1323, 7499.03, 4165.03, 25944);
INSERT INTO public.round_players VALUES (1633788515114901, 1643, 6773695, 'ce3a9da2', 7421, 2, 5, 0, 1, 1410, 8049.7, 4228.6, 25945);
INSERT INTO public.round_players VALUES (1633788515114901, 1643, 8107813, '62731fd8', 7967, 1, 5, 0, 1, 758, 4252.96, 3603.27, 25946);
INSERT INTO public.round_players VALUES (1633788757297626, 1644, 3794642, '1323a3ef', 8009, 0, 1, 0, 1, 274, 128.68, 3384.57, 25947);
INSERT INTO public.round_players VALUES (1633788757297626, 1644, 1402389, 'e449b953', 7856, 1, 5, 1, 0, 649, 2169.6, 2633.37, 25948);
INSERT INTO public.round_players VALUES (1633788757297626, 1644, 10859473, '7e86b701', 7376, 1, 5, 0, 0, 1930, 9108.3, 2020.84, 25949);
INSERT INTO public.round_players VALUES (1633788757297626, 1644, 1372359, '4254caab', 7614, 0, 1, 0, 1, 207, 1716.93, 4921.51, 25950);
INSERT INTO public.round_players VALUES (1633788757297626, 1644, 3282222, '4a5df56e', 8143, 2, 1, 0, 1, 1260, 3583.59, 2504.69, 25951);
INSERT INTO public.round_players VALUES (1633788757297626, 1644, 8354393, '0237a897', 8281, 0, 5, 0, 1, 631, 3259.85, 2539.46, 25952);
INSERT INTO public.round_players VALUES (1633788757297626, 1644, -6160, '8cb777b9', 7535, 1, 4, 0, 1, 597, 2114.67, 4165.69, 25953);
INSERT INTO public.round_players VALUES (1633788757297626, 1644, -5758, '56bdfd40', 8212, 0, 2, 0, 1, 239, 668.14, 2824.04, 25954);
INSERT INTO public.round_players VALUES (1633788757297626, 1644, -2912, '504eb912', 8146, 2, 2, 0, 0, 424, 1412.99, 1993.35, 25955);
INSERT INTO public.round_players VALUES (1633788757297626, 1644, -5574, '9d0273fd', 7747, 0, 2, 0, 1, 86, 1977.69, 2182.71, 25956);
INSERT INTO public.round_players VALUES (1633788757297626, 1644, -2652, '504eb912', 8146, 0, 0, 0, 1, 0, 0.0, 5620.84, 25957);
INSERT INTO public.round_players VALUES (1633788757297626, 1644, -10114, 'ec228def', 7459, 0, 2, 0, 1, 85, 725.55, 2195.92, 25958);
INSERT INTO public.round_players VALUES (1633788757297626, 1644, 5990764, '564ce1bd', 7628, 3, 3, 0, 0, 1734, 8790.9, 2802.19, 25959);
INSERT INTO public.round_players VALUES (1633788757297626, 1644, 7907969, 'e14609d3', 8217, 1, 3, 1, 1, 1466, 11281.94, 5752.85, 25960);
INSERT INTO public.round_players VALUES (1633788757297626, 1644, 1846782, 'caa1add7', 8341, 1, 2, 0, 1, 707, 3759.27, 4242.63, 25961);
INSERT INTO public.round_players VALUES (1633788757297626, 1644, 9768553, '98e1a34e', 7381, 0, 0, 0, 1, 124, 1447.2, 2360.64, 25962);
INSERT INTO public.round_players VALUES (1633789011158670, 1645, 7907969, 'e14609d3', 8217, 2, 2, 0, 0, 1833, 10232.41, 1511.98, 25963);
INSERT INTO public.round_players VALUES (1633789011158670, 1645, 2320918, 'c2e7808c', 7549, 1, 0, 0, 1, 174, 1165.69, 3091.77, 25964);
INSERT INTO public.round_players VALUES (1633789011158670, 1645, 146546, '3fbc1d72', 7853, 0, 0, 0, 1, 67, 2252.72, 3360.07, 25965);
INSERT INTO public.round_players VALUES (1633789011158670, 1645, 64000, '24d418c7', 7800, 0, 1, 0, 1, 16, 1781.15, 4274.37, 25966);
INSERT INTO public.round_players VALUES (1633789011158670, 1645, 6469607, 'dfcdcca3', 7003, 0, 0, 0, 0, 0, 0.0, 355.85, 25967);
INSERT INTO public.round_players VALUES (1633789011158670, 1645, 6773695, 'cfcc5005', 7039, 1, 2, 0, 0, 525, 3990.68, 956.99, 25968);
INSERT INTO public.round_players VALUES (1633789011158670, 1645, 5990764, '564ce1bd', 7628, 1, 5, 0, 0, 1163, 6438.96, 2298.14, 25969);
INSERT INTO public.round_players VALUES (1633789011158670, 1645, 3794642, '1323a3ef', 8009, 0, 2, 3, 1, 91, 763.62, 2534.07, 25970);
INSERT INTO public.round_players VALUES (1633789011158670, 1645, 1402389, 'efd7a296', 7726, 0, 1, 0, 1, 23, 1610.16, 5068.26, 25971);
INSERT INTO public.round_players VALUES (1633789011158670, 1645, 3282222, '4a5df56e', 8143, 1, 3, 0, 1, 602, 3478.67, 2878.51, 25972);
INSERT INTO public.round_players VALUES (1633789011158670, 1645, 9463369, 'e15dc156', 7518, 0, 1, 0, 1, 55, 394.92, 2527.95, 25973);
INSERT INTO public.round_players VALUES (1633789011158670, 1645, 3256395, 'a83baa94', 7809, 2, 3, 0, 0, 544, 2286.49, 415.83, 25974);
INSERT INTO public.round_players VALUES (1633789011158670, 1645, 7535475, 'c9edfc05', 8143, 0, 1, 0, 1, 404, 1269.81, 2763.72, 25975);
INSERT INTO public.round_players VALUES (1633789011158670, 1645, 9889917, '2a476959', 7369, 1, 2, 1, 0, 551, 2982.3, 1064.89, 25976);
INSERT INTO public.round_players VALUES (1633789011158670, 1645, -10914, '8cb777b9', 7535, 0, 1, 1, 1, 48, 614.58, 4768.43, 25977);
INSERT INTO public.round_players VALUES (1633789011158670, 1645, 7585833, 'b6d3c247', 7897, 1, 1, 0, 1, 696, 2927.23, 4318.56, 25978);
INSERT INTO public.round_players VALUES (1633789169380717, 1646, 7907969, 'e14609d3', 8217, 1, 3, 2, 1, 1452, 5388.22, 4574.23, 25979);
INSERT INTO public.round_players VALUES (1633789169380717, 1646, 3794642, '1323a3ef', 8009, 0, 1, 0, 1, 274, 450.66, 3677.64, 25980);
INSERT INTO public.round_players VALUES (1633789169380717, 1646, 4337334, '95a72fb2', 7570, 3, 2, 0, 0, 1251, 6938.82, 297.35, 25981);
INSERT INTO public.round_players VALUES (1633789169380717, 1646, 3256395, 'a83baa94', 7809, 0, 1, 0, 1, 115, 1608.69, 3396.18, 25982);
INSERT INTO public.round_players VALUES (1633789169380717, 1646, 7585833, 'b6d3c247', 7897, 2, 2, 0, 0, 703, 2854.08, 2713.3, 25983);
INSERT INTO public.round_players VALUES (1633789169380717, 1646, 5990764, '564ce1bd', 7628, 1, 1, 2, 1, 791, 6476.16, 3733.78, 25984);
INSERT INTO public.round_players VALUES (1633789169380717, 1646, -10114, '21fe86fb', 8298, 1, 0, 0, 1, 176, 1011.29, 1951.96, 25985);
INSERT INTO public.round_players VALUES (1633789169380717, 1646, -1066, 'e9e083e7', 7824, 0, 1, 0, 1, 211, 744.47, 2655.26, 25986);
INSERT INTO public.round_players VALUES (1633789169380717, 1646, -2528, '9d0273fd', 7747, 0, 1, 0, 1, 120, 1597.56, 2500.96, 25987);
INSERT INTO public.round_players VALUES (1633789169380717, 1646, -22562, '9d0273fd', 7747, 1, 1, 0, 1, 636, 2696.17, 1198.35, 25988);
INSERT INTO public.round_players VALUES (1633789169380717, 1646, 9337475, '51d683ec', 7718, 1, 0, 1, 1, 782, 2142.19, 4070.59, 25989);
INSERT INTO public.round_players VALUES (1633789169380717, 1646, 5564021, '8eebace6', 7821, 0, 4, 0, 0, 393, 4010.07, 4334.78, 25990);
INSERT INTO public.round_players VALUES (1633789169380717, 1646, 7794546, '91bb0707', 7989, 0, 4, 0, 1, 380, 2121.25, 3684.76, 25991);
INSERT INTO public.round_players VALUES (1633789169380717, 1646, 11782617, '3adbd7ae', 8290, 0, 1, 0, 1, 118, 2020.38, 3423.09, 25992);
INSERT INTO public.round_players VALUES (1633789169380717, 1646, 4431501, 'c7f26c43', 8500, 1, 1, 2, 1, 584, 8163.45, 5255.21, 25993);
INSERT INTO public.round_players VALUES (1633789169380717, 1646, 1969335, '3c31562c', 7720, 1, 3, 0, 0, 504, 3618.87, 4374.89, 25994);
INSERT INTO public.round_players VALUES (1633789396210041, 1647, 7907969, 'e14609d3', 8217, 1, 2, 0, 0, 865, 4718.51, 920.35, 25995);
INSERT INTO public.round_players VALUES (1633789396210041, 1647, 8261933, '8a3f304e', 8496, 0, 4, 0, 0, 500, 2976.74, 2339.98, 25996);
INSERT INTO public.round_players VALUES (1633789396210041, 1647, 1280230, 'cbb6738f', 8999, 0, 0, 0, 1, 64, 1953.7, 3980.55, 25997);
INSERT INTO public.round_players VALUES (1633789396210041, 1647, 4243744, 'b29628d4', 8867, 0, 0, 0, 1, 10, 101.78, 3375.04, 25998);
INSERT INTO public.round_players VALUES (1633789396210041, 1647, 1999495, '757e9b42', 8959, 0, 0, 0, 1, 10, 418.48, 3778.73, 25999);
INSERT INTO public.round_players VALUES (1633789396210041, 1647, 9828798, '70e99ab8', 8352, 0, 5, 0, 0, 139, 1511.93, 1025.52, 26000);
INSERT INTO public.round_players VALUES (1633789396210041, 1647, 4480152, 'ca89f85b', 9010, 0, 0, 0, 1, 121, 1910.4, 4486.29, 26001);
INSERT INTO public.round_players VALUES (1633789396210041, 1647, 4746471, '25e7eb62', 8513, 0, 0, 0, 1, 10, 63.0, 3211.08, 26002);
INSERT INTO public.round_players VALUES (1633789396210041, 1647, 4431501, 'c7f26c43', 8500, 0, 1, 0, 1, 69, 2648.16, 4325.77, 26003);
INSERT INTO public.round_players VALUES (1633789396210041, 1647, 9436612, '7539cfa1', 8884, 1, 5, 0, 0, 471, 2123.57, 547.78, 26004);
INSERT INTO public.round_players VALUES (1633789396210041, 1647, 1997969, '5eebd9ca', 8992, 1, 4, 0, 0, 446, 3185.2, 510.6, 26005);
INSERT INTO public.round_players VALUES (1633789396210041, 1647, 8132066, 'a24f332e', 8354, 0, 0, 0, 1, 10, 172.99, 2926.36, 26006);
INSERT INTO public.round_players VALUES (1633789396210041, 1647, 115075, 'bc93aaa5', 8999, 0, 0, 0, 1, 95, 2026.52, 2585.98, 26007);
INSERT INTO public.round_players VALUES (1633789396210041, 1647, 11534627, '5f826b7e', 9057, 1, 1, 0, 0, 216, 1106.68, 0.0, 26008);
INSERT INTO public.round_players VALUES (1633789396210041, 1647, 1016342, 'f6172053', 8828, 2, 4, 0, 0, 1842, 6697.58, 380.24, 26009);
INSERT INTO public.round_players VALUES (1633789396210041, 1647, 4803994, '799be8ff', 8800, 2, 2, 0, 0, 887, 6349.59, 3570.56, 26010);
INSERT INTO public.round_players VALUES (1633789646428213, 1648, 7907969, 'e14609d3', 8217, 5, 1, 0, 1, 1865, 9155.0, 5912.03, 26011);
INSERT INTO public.round_players VALUES (1633789646428213, 1648, 4946618, 'd78fab15', 7957, 1, 4, 0, 0, 567, 1816.77, 3243.1, 26012);
INSERT INTO public.round_players VALUES (1633789646428213, 1648, 4498163, 'e69c77bf', 7587, 0, 0, 0, 1, 172, 2449.2, 3131.22, 26013);
INSERT INTO public.round_players VALUES (1633789646428213, 1648, 6636368, '7d97715c', 7503, 0, 4, 0, 1, 257, 2577.32, 2551.81, 26014);
INSERT INTO public.round_players VALUES (1633789646428213, 1648, 8951030, '5c89f473', 8019, 3, 3, 0, 0, 1239, 3912.26, 2171.36, 26015);
INSERT INTO public.round_players VALUES (1633789646428213, 1648, 4647621, 'd68a65a6', 8423, 0, 2, 0, 1, 433, 3808.89, 2770.6, 26016);
INSERT INTO public.round_players VALUES (1633789646428213, 1648, 4681143, 'bd7a51c2', 7484, 0, 5, 0, 1, 925, 3751.73, 3055.85, 26017);
INSERT INTO public.round_players VALUES (1633789646428213, 1648, 2886185, 'f4cb6427', 7540, 0, 4, 0, 1, 219, 1548.21, 5456.92, 26018);
INSERT INTO public.round_players VALUES (1633789646428213, 1648, 10957230, '3a6cfa16', 8473, 4, 4, 0, 1, 1660, 4645.15, 4230.6, 26019);
INSERT INTO public.round_players VALUES (1633789646428213, 1648, 1129619, '5d926211', 7778, 0, 6, 0, 1, 456, 3802.95, 4159.8, 26020);
INSERT INTO public.round_players VALUES (1633789646428213, 1648, 9379927, 'f08c1d42', 7837, 0, 4, 0, 1, 342, 2894.42, 1862.7, 26021);
INSERT INTO public.round_players VALUES (1633789646428213, 1648, 5891667, '1cc59f5b', 8168, 0, 6, 0, 1, 297, 1274.11, 6550.95, 26022);
INSERT INTO public.round_players VALUES (1633789646428213, 1648, 5202131, '23b782e2', 7636, 0, 3, 0, 1, 605, 6951.17, 3238.84, 26023);
INSERT INTO public.round_players VALUES (1633789646428213, 1648, 10583350, '0780114f', 7676, 0, 4, 0, 0, 1042, 4467.2, 2958.47, 26024);
INSERT INTO public.round_players VALUES (1633789646428213, 1648, 5217161, 'ffbfb27f', 7939, 0, 4, 0, 1, 329, 3235.24, 2996.28, 26025);
INSERT INTO public.round_players VALUES (1633789646428213, 1648, 3105487, '325bc11f', 7724, 0, 4, 0, 1, 76, 755.81, 2754.9, 26026);


--
-- Data for Name: rounds; Type: TABLE DATA; Schema: public; Owner: dev
--

INSERT INTO public.rounds VALUES (1628718728212966, 0, '2021-08-11', '2021-08-11', 1, 1624);
INSERT INTO public.rounds VALUES (1628719058239445, 0, '2021-08-11', '2021-08-11', 1, 1625);
INSERT INTO public.rounds VALUES (1633137941586677, 0, '2021-10-02', '2021-10-02', 1, 1626);
INSERT INTO public.rounds VALUES (1633138067523454, 0, '2021-10-02', '2021-10-02', 2, 1627);
INSERT INTO public.rounds VALUES (1633138291617985, 0, '2021-10-02', '2021-10-02', 2, 1628);
INSERT INTO public.rounds VALUES (1633138498569990, 0, '2021-10-02', '2021-10-02', 1, 1629);
INSERT INTO public.rounds VALUES (1633138682560809, 0, '2021-10-02', '2021-10-02', 2, 1630);
INSERT INTO public.rounds VALUES (1633138915653607, 0, '2021-10-02', '2021-10-02', 2, 1631);
INSERT INTO public.rounds VALUES (1633139064634885, 0, '2021-10-02', '2021-10-02', 2, 1632);
INSERT INTO public.rounds VALUES (1633139253672591, 0, '2021-10-02', '2021-10-02', 1, 1633);
INSERT INTO public.rounds VALUES (1633139532697000, 0, '2021-10-02', '2021-10-02', 1, 1634);
INSERT INTO public.rounds VALUES (1633139692681264, 0, '2021-10-02', '2021-10-02', 2, 1635);
INSERT INTO public.rounds VALUES (1633139836750622, 0, '2021-10-02', '2021-10-02', 2, 1636);
INSERT INTO public.rounds VALUES (1633140010812306, 0, '2021-10-02', '2021-10-02', 2, 1637);
INSERT INTO public.rounds VALUES (1633140170793983, 0, '2021-10-02', '2021-10-02', 2, 1638);
INSERT INTO public.rounds VALUES (1633787688959384, 0, '2021-10-09', '2021-10-09', 2, 1639);
INSERT INTO public.rounds VALUES (1633787999142331, 0, '2021-10-09', '2021-10-09', 2, 1640);
INSERT INTO public.rounds VALUES (1633788175192852, 0, '2021-10-09', '2021-10-09', 1, 1641);
INSERT INTO public.rounds VALUES (1633788333116003, 0, '2021-10-09', '2021-10-09', 1, 1642);
INSERT INTO public.rounds VALUES (1633788515114901, 0, '2021-10-09', '2021-10-09', 2, 1643);
INSERT INTO public.rounds VALUES (1633788757297626, 0, '2021-10-09', '2021-10-09', 2, 1644);
INSERT INTO public.rounds VALUES (1633789011158670, 0, '2021-10-09', '2021-10-09', 1, 1645);
INSERT INTO public.rounds VALUES (1633789169380717, 0, '2021-10-09', '2021-10-09', 1, 1646);
INSERT INTO public.rounds VALUES (1633789396210041, 0, '2021-10-09', '2021-10-09', 1, 1647);
INSERT INTO public.rounds VALUES (1633789646428213, 0, '2021-10-09', '2021-10-09', 2, 1648);


--
-- Data for Name: scores; Type: TABLE DATA; Schema: public; Owner: dev
--

INSERT INTO public.scores VALUES (46, 'First Hit');
INSERT INTO public.scores VALUES (47, 'Part Detach');
INSERT INTO public.scores VALUES (48, 'Kill');
INSERT INTO public.scores VALUES (49, 'Intercept');
INSERT INTO public.scores VALUES (50, 'Point Capture');
INSERT INTO public.scores VALUES (51, 'Shield');
INSERT INTO public.scores VALUES (54, 'Objective');


--
-- Data for Name: uploads; Type: TABLE DATA; Schema: public; Owner: dev
--

INSERT INTO public.uploads OVERRIDING SYSTEM VALUE VALUES (2331, 1628718728212966, '2023-05-17', 7907969);
INSERT INTO public.uploads OVERRIDING SYSTEM VALUE VALUES (2332, 1628719058239445, '2023-05-17', 7907969);
INSERT INTO public.uploads OVERRIDING SYSTEM VALUE VALUES (2333, 1633137941586677, '2023-05-17', 7907969);
INSERT INTO public.uploads OVERRIDING SYSTEM VALUE VALUES (2334, 1633138067523454, '2023-05-17', 7907969);
INSERT INTO public.uploads OVERRIDING SYSTEM VALUE VALUES (2335, 1633138291617985, '2023-05-17', 7907969);
INSERT INTO public.uploads OVERRIDING SYSTEM VALUE VALUES (2336, 1633138498569990, '2023-05-17', 7907969);
INSERT INTO public.uploads OVERRIDING SYSTEM VALUE VALUES (2337, 1633138682560809, '2023-05-17', 7907969);
INSERT INTO public.uploads OVERRIDING SYSTEM VALUE VALUES (2338, 1633138915653607, '2023-05-17', 7907969);
INSERT INTO public.uploads OVERRIDING SYSTEM VALUE VALUES (2339, 1633139064634885, '2023-05-17', 7907969);
INSERT INTO public.uploads OVERRIDING SYSTEM VALUE VALUES (2340, 1633139253672591, '2023-05-17', 7907969);
INSERT INTO public.uploads OVERRIDING SYSTEM VALUE VALUES (2341, 1633139532697000, '2023-05-17', 7907969);
INSERT INTO public.uploads OVERRIDING SYSTEM VALUE VALUES (2342, 1633139692681264, '2023-05-17', 7907969);
INSERT INTO public.uploads OVERRIDING SYSTEM VALUE VALUES (2343, 1633139836750622, '2023-05-17', 7907969);
INSERT INTO public.uploads OVERRIDING SYSTEM VALUE VALUES (2344, 1633140010812306, '2023-05-17', 7907969);
INSERT INTO public.uploads OVERRIDING SYSTEM VALUE VALUES (2345, 1633140170793983, '2023-05-17', 7907969);
INSERT INTO public.uploads OVERRIDING SYSTEM VALUE VALUES (2346, 1633787688959384, '2023-05-17', 7907969);
INSERT INTO public.uploads OVERRIDING SYSTEM VALUE VALUES (2347, 1633787999142331, '2023-05-17', 7907969);
INSERT INTO public.uploads OVERRIDING SYSTEM VALUE VALUES (2348, 1633788175192852, '2023-05-17', 7907969);
INSERT INTO public.uploads OVERRIDING SYSTEM VALUE VALUES (2349, 1633788333116003, '2023-05-17', 7907969);
INSERT INTO public.uploads OVERRIDING SYSTEM VALUE VALUES (2350, 1633788515114901, '2023-05-17', 7907969);
INSERT INTO public.uploads OVERRIDING SYSTEM VALUE VALUES (2351, 1633788757297626, '2023-05-17', 7907969);
INSERT INTO public.uploads OVERRIDING SYSTEM VALUE VALUES (2352, 1633789011158670, '2023-05-17', 7907969);
INSERT INTO public.uploads OVERRIDING SYSTEM VALUE VALUES (2353, 1633789169380717, '2023-05-17', 7907969);
INSERT INTO public.uploads OVERRIDING SYSTEM VALUE VALUES (2354, 1633789396210041, '2023-05-17', 7907969);
INSERT INTO public.uploads OVERRIDING SYSTEM VALUE VALUES (2355, 1633789646428213, '2023-05-17', 7907969);


--
-- Data for Name: weapons; Type: TABLE DATA; Schema: public; Owner: dev
--

INSERT INTO public.weapons VALUES (857, 'CarPart_Gun_Machinegun_Preepic');
INSERT INTO public.weapons VALUES (858, 'CarPart_ModuleTank_rare');
INSERT INTO public.weapons VALUES (859, 'Ramming');
INSERT INTO public.weapons VALUES (860, 'CarPart_Gun_Machinegun_Frontal_legend');
INSERT INTO public.weapons VALUES (861, 'CarPart_Gun_Machinegun_Frontal_Epic');
INSERT INTO public.weapons VALUES (862, 'CarPart_Gun_Cannon_epic');
INSERT INTO public.weapons VALUES (863, 'CarPart_Gun_BigCannon_EX_rare');
INSERT INTO public.weapons VALUES (864, 'CarPart_Gun_Mortar_Revert');
INSERT INTO public.weapons VALUES (865, 'CarPart_WheelDroneDeployer');
INSERT INTO public.weapons VALUES (866, 'CarPart_HomingMissileLauncherBurstR_legend');
INSERT INTO public.weapons VALUES (867, 'CarPart_HomingMissileLauncher_epic');
INSERT INTO public.weapons VALUES (868, 'CarPart_Gun_Syfy_ParticleBeam');
INSERT INTO public.weapons VALUES (869, 'CarPart_Gun_Plasma_Cutter');
INSERT INTO public.weapons VALUES (870, 'CarPart_Gun_Catapult');
INSERT INTO public.weapons VALUES (871, 'CarPart_Gun_BigCannon_EX_Preepic');
INSERT INTO public.weapons VALUES (872, 'CarPart_Gun_Machinegun_epic');
INSERT INTO public.weapons VALUES (873, 'CarPart_Gun_Cannon_Legend');
INSERT INTO public.weapons VALUES (874, 'CarPart_Gun_MineLauncher_Legend');
INSERT INTO public.weapons VALUES (875, 'Cabin_Tribal_Hog');
INSERT INTO public.weapons VALUES (876, 'CarPart_Gun_Machinegun_Corner');
INSERT INTO public.weapons VALUES (877, 'CarPart_PowerGiver_epic');
INSERT INTO public.weapons VALUES (878, 'CarPart_Syfy_DeployAmmo');
INSERT INTO public.weapons VALUES (879, 'CarPart_Gun_MineTrap');
INSERT INTO public.weapons VALUES (880, 'CarPart_Gun_Shotgun_epic');
INSERT INTO public.weapons VALUES (881, 'CarPart_Quadrocopter_rare');
INSERT INTO public.weapons VALUES (882, 'CarPart_Gun_Minigun');
INSERT INTO public.weapons VALUES (883, 'CarPart_Gun_SMG_Epic');
INSERT INTO public.weapons VALUES (884, 'CarPart_Gun_BigCannon_Free_Preepic');
INSERT INTO public.weapons VALUES (885, 'CarPart_Gun_Shotgun_Preepic');
INSERT INTO public.weapons VALUES (886, 'CarPart_Gun_GrenadeLauncher_Shotgun');
INSERT INTO public.weapons VALUES (887, 'CarPart_Gun_Lcannon_epic');
INSERT INTO public.weapons VALUES (888, 'CarPart_Drill_epic');
INSERT INTO public.weapons VALUES (889, 'CarPart_TurretDeployer_rare');
INSERT INTO public.weapons VALUES (890, 'CarPart_Gun_GrenadeLauncher_Burst');
INSERT INTO public.weapons VALUES (891, 'CarPart_PowerGiverExplosive_legend');
INSERT INTO public.weapons VALUES (892, 'CarPart_Gun_WheelRocket');
INSERT INTO public.weapons VALUES (893, 'CarPart_Gun_MiddleRangeShotgun_legend');
INSERT INTO public.weapons VALUES (894, 'CarPart_Gun_Shotgun_Frontal');
INSERT INTO public.weapons VALUES (895, 'CarPart_Gun_SMG');
INSERT INTO public.weapons VALUES (896, 'CarPart_Gun_SMG_Legend');
INSERT INTO public.weapons VALUES (897, 'CarPart_AutoGuidedCourseGun_Nurs_Preepic');
INSERT INTO public.weapons VALUES (898, 'CarPart_ChainSaw_epic');
INSERT INTO public.weapons VALUES (899, 'CarPart_Barrel');
INSERT INTO public.weapons VALUES (900, 'CarPart_Gun_Machinegun');
INSERT INTO public.weapons VALUES (901, 'CarPart_Gun_CloseCombatCannon');
INSERT INTO public.weapons VALUES (902, 'CarPart_Roundsaw_rare');
INSERT INTO public.weapons VALUES (903, 'CarPart_Gun_Plasma_Drill');
INSERT INTO public.weapons VALUES (904, 'CarPart_Gun_Shotgun');
INSERT INTO public.weapons VALUES (905, 'CarPart_Gun_Shotgun_Fixed_epic');
INSERT INTO public.weapons VALUES (906, 'CarPart_Gun_Flamethrower_frontal');
INSERT INTO public.weapons VALUES (907, 'CarPart_Harvester_legend');
INSERT INTO public.weapons VALUES (908, 'CarPart_WheelDroneDeployer_epic');
INSERT INTO public.weapons VALUES (909, 'CarPart_TurretDeployerMissile_epic');
INSERT INTO public.weapons VALUES (910, 'CarPart_Quadrocopter_preepic');
INSERT INTO public.weapons VALUES (911, 'CarPart_Gun_Blast_ClassicCrossbow');
INSERT INTO public.weapons VALUES (912, 'CarPart_Quadrocopter_Syfy');
INSERT INTO public.weapons VALUES (913, 'CarPart_Quadrocopter_epic');
INSERT INTO public.weapons VALUES (914, 'CarPart_Gun_ShotGun_Garbage');
INSERT INTO public.weapons VALUES (915, 'CarPart_ModuleAmmoBig_epic');
INSERT INTO public.weapons VALUES (916, 'CarPart_Gun_NailGun_epic');
INSERT INTO public.weapons VALUES (917, 'CarPart_Gun_NailGun_rare');
INSERT INTO public.weapons VALUES (918, 'CarPart_Gun_BigCannon_EX_epic');
INSERT INTO public.weapons VALUES (919, 'CarPart_Gun_Harpoon');
INSERT INTO public.weapons VALUES (920, 'CarPart_ChainSaw_dble_epic');
INSERT INTO public.weapons VALUES (921, 'CarPart_Gun_Machinegun_rare');
INSERT INTO public.weapons VALUES (922, 'CarPart_Gun_Cannon_Preepic');
INSERT INTO public.weapons VALUES (923, 'CarPart_PowerGiver_legend');
INSERT INTO public.weapons VALUES (924, 'CarPart_ModuleAmmo_rare');
INSERT INTO public.weapons VALUES (925, 'CarPart_Gun_Shotgun_Fixed_Rare');
INSERT INTO public.weapons VALUES (926, 'CarPart_Gun_Syfy_FusionRifle');
INSERT INTO public.weapons VALUES (927, 'CarPart_Gun_Revolver_epic');
INSERT INTO public.weapons VALUES (928, 'CarPart_Gun_ShotGun_Garbage_legend');
INSERT INTO public.weapons VALUES (929, 'CarPart_Gun_CannonMinigun_legend');
INSERT INTO public.weapons VALUES (930, 'CarPart_PowerGiverExplosive_epic');
INSERT INTO public.weapons VALUES (931, 'CarPart_Gun_Syfy_ShotGun');
INSERT INTO public.weapons VALUES (932, 'CarPart_Gun_BigCannon_Free_epic');
INSERT INTO public.weapons VALUES (933, 'CarPart_PowerGiver_rare');
INSERT INTO public.weapons VALUES (934, 'CarPart_Gun_Grenade_Launcher_epic');
INSERT INTO public.weapons VALUES (935, 'CarPart_Gun_Missile_3x_Front_epic');
INSERT INTO public.weapons VALUES (936, 'CarPart_Gun_Carabine');
INSERT INTO public.weapons VALUES (937, 'CarPart_Gun_SmartMachinegun');
INSERT INTO public.weapons VALUES (938, 'CarPart_Gun_Syfy_Plazma');
INSERT INTO public.weapons VALUES (939, 'CarPart_Gun_SniperCrossbow');
INSERT INTO public.weapons VALUES (940, 'CarPart_kamikazeDroneDeployer');
INSERT INTO public.weapons VALUES (941, 'CarPart_Gun_GrenadeLauncher_Auto');
INSERT INTO public.weapons VALUES (942, 'Cabin_InnateMelee');
INSERT INTO public.weapons VALUES (943, 'CarPart_Gun_Plasma_Drill_legendary');
INSERT INTO public.weapons VALUES (944, 'CarPart_Gun_BigCannon_Free_T34_epic');
INSERT INTO public.weapons VALUES (945, 'CarPart_Gun_CannonLong_legend');
INSERT INTO public.weapons VALUES (946, 'CarPart_AutoGuidedCourseGun_epic');
INSERT INTO public.weapons VALUES (947, 'CarPart_Improv_HomingMissileLauncher_epic');
INSERT INTO public.weapons VALUES (948, 'CarPart_AutoGuidedCourseGun_rare');
INSERT INTO public.weapons VALUES (949, 'CarPart_SpearExplosive');
INSERT INTO public.weapons VALUES (950, 'CarPart_Gun_Coilgun_Legend');
INSERT INTO public.weapons VALUES (951, 'CarPart_Gun_BigCannon_Free_rare');
INSERT INTO public.weapons VALUES (952, 'CarPart_Gun_Cannon_rare');
INSERT INTO public.weapons VALUES (953, 'CarPart_Gun_Shotgun_rare');
INSERT INTO public.weapons VALUES (954, 'CarPart_PowerGiver_epic2');
INSERT INTO public.weapons VALUES (955, 'CarPart_PlasmaSaw_preepic');
INSERT INTO public.weapons VALUES (956, 'CarPart_Gun_BigCannon_Free_legend');
INSERT INTO public.weapons VALUES (957, 'CarPart_Gun_MiddleRangeShotgun');
INSERT INTO public.weapons VALUES (958, 'CarPart_Gun_Machinegun_Frontal');
INSERT INTO public.weapons VALUES (959, 'CarPart_Gun_MineLauncher');
INSERT INTO public.weapons VALUES (960, 'CarPart_Gun_Machinegun_Starter');
INSERT INTO public.weapons VALUES (961, 'CarPart_Gun_BigCannon_EX');
INSERT INTO public.weapons VALUES (962, 'CarPart_HomingMissileLauncherSupport_epic');
INSERT INTO public.weapons VALUES (963, 'CarPart_LanceExplosive');
INSERT INTO public.weapons VALUES (964, 'CarPart_Gun_SniperSelfDamage_epic');
INSERT INTO public.weapons VALUES (965, 'CarPart_Gun_Syfy_FusionRifle_epic');
INSERT INTO public.weapons VALUES (966, 'CarPart_Gun_Syfy_Tesla');
INSERT INTO public.weapons VALUES (967, 'CarPart_Gun_BigCannon_Free_Relic');
INSERT INTO public.weapons VALUES (968, 'CarPart_Gun_Machinegun_Frontal_Preepic');
INSERT INTO public.weapons VALUES (969, 'CarPart_Gun_DroneLauncher_epic');
INSERT INTO public.weapons VALUES (970, 'CarPart_Gun_Machinegun_Legendary');
INSERT INTO public.weapons VALUES (971, 'CarPart_Gun_TurretHarpoonLauncher_legendary');
INSERT INTO public.weapons VALUES (972, 'CarPart_Gun_DoubleCrossbow');
INSERT INTO public.weapons VALUES (973, 'CarPart_Gun_Flamethrower_fixed');
INSERT INTO public.weapons VALUES (974, 'CarPart_Gun_Syfy_Plazma_Legend');
INSERT INTO public.weapons VALUES (975, 'CarPart_Gun_ClassicCrossbow');
INSERT INTO public.weapons VALUES (976, 'CarPart_Gun_TempoCrossbow');
INSERT INTO public.weapons VALUES (977, 'CarPart_Gun_MGL_rare');
INSERT INTO public.weapons VALUES (978, 'CarPart_Gun_Lcannon_Preepic');
INSERT INTO public.weapons VALUES (979, 'CarPart_Gun_Shotgun_Frontal_Preepic');
INSERT INTO public.weapons VALUES (980, 'CarPart_Gun_ShotGun_Garbage_epic');
INSERT INTO public.weapons VALUES (981, 'CarPart_HomingMissileLauncherLockOn_epic');
INSERT INTO public.weapons VALUES (982, 'CarPart_Gun_Cannon_Oneshot_preepic');
INSERT INTO public.weapons VALUES (983, 'CarPart_Gun_BigCannon_EX_Legend');
INSERT INTO public.weapons VALUES (984, 'CarPart_Gun_Missile_3xSpiral_Legend');
INSERT INTO public.weapons VALUES (985, 'CarPart_Gun_LightningGun');
INSERT INTO public.weapons VALUES (986, 'CarPart_Gun_MissileLauncherPlasma_epic');
INSERT INTO public.weapons VALUES (987, 'CarPart_Gun_Shotgun_legend');
INSERT INTO public.weapons VALUES (988, 'CarPart_Gun_BigCannon_EX_Relic');
INSERT INTO public.weapons VALUES (989, 'CarPart_Gun_Shotgun_Corner');
INSERT INTO public.weapons VALUES (990, 'CarPart_Gun_Syfy_Tesla_relic');
INSERT INTO public.weapons VALUES (991, 'CarPart_AutoGuidedCourseGun_Epic2');
INSERT INTO public.weapons VALUES (992, 'CarPart_Gun_ShotGun_Garbage_relic');
INSERT INTO public.weapons VALUES (993, 'CarPart_Gun_Machinegun_Relic');


--
-- Name: build_parts_build_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('public.build_parts_build_id_seq', 1, false);


--
-- Name: builds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('public.builds_id_seq', 22567, true);


--
-- Name: match_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('public.match_player_id_seq', 18649, true);


--
-- Name: medal_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('public.medal_types_id_seq', 641, true);


--
-- Name: parts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('public.parts_id_seq', 10812, true);


--
-- Name: player_rounds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('public.player_rounds_id_seq', 26301, true);


--
-- Name: resources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('public.resources_id_seq', 48, true);


--
-- Name: rounds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('public.rounds_id_seq', 1665, true);


--
-- Name: score_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('public.score_types_id_seq', 54, true);


--
-- Name: uploads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('public.uploads_id_seq', 2355, true);


--
-- Name: weapons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('public.weapons_id_seq', 993, true);


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

