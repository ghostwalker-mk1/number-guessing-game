--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guessing_game;
--
-- Name: number_guessing_game; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guessing_game WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guessing_game OWNER TO freecodecamp;

\connect number_guessing_game

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(22) NOT NULL,
    game_counter integer DEFAULT 0,
    best_guess integer DEFAULT 0
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (179, 'user_1684275296857', 2, 45);
INSERT INTO public.users VALUES (178, 'user_1684275296858', 5, 126);
INSERT INTO public.users VALUES (181, 'user_1684275309095', 2, 73);
INSERT INTO public.users VALUES (180, 'user_1684275309096', 5, 462);
INSERT INTO public.users VALUES (183, 'user_1684275322005', 2, 75);
INSERT INTO public.users VALUES (182, 'user_1684275322006', 5, 81);
INSERT INTO public.users VALUES (185, 'user_1684275332637', 2, 178);
INSERT INTO public.users VALUES (184, 'user_1684275332638', 5, 55);
INSERT INTO public.users VALUES (187, 'user_1684275348193', 2, 580);
INSERT INTO public.users VALUES (186, 'user_1684275348194', 5, 6);
INSERT INTO public.users VALUES (189, 'user_1684275360699', 2, 36);
INSERT INTO public.users VALUES (188, 'user_1684275360700', 5, 176);
INSERT INTO public.users VALUES (191, 'user_1684275380992', 2, 271);
INSERT INTO public.users VALUES (190, 'user_1684275380993', 5, 143);
INSERT INTO public.users VALUES (193, 'user_1684275393960', 2, 414);
INSERT INTO public.users VALUES (192, 'user_1684275393961', 3, 305);
INSERT INTO public.users VALUES (224, 'user_1684275790543', 2, 230);
INSERT INTO public.users VALUES (223, 'user_1684275790544', 5, 52);
INSERT INTO public.users VALUES (226, 'user_1684277875559', 2, 386);
INSERT INTO public.users VALUES (225, 'user_1684277875560', 5, 232);
INSERT INTO public.users VALUES (228, 'user_1684278212242', 2, 671);
INSERT INTO public.users VALUES (227, 'user_1684278212243', 4, 579);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 228, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

