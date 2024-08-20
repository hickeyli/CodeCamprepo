--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: celestial_object; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.celestial_object (
    celestial_object_id integer NOT NULL,
    name character varying(255) NOT NULL,
    type text NOT NULL,
    mass numeric NOT NULL,
    visible boolean NOT NULL
);


ALTER TABLE public.celestial_object OWNER TO freecodecamp;

--
-- Name: celestial_object_celestial_object_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.celestial_object_celestial_object_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.celestial_object_celestial_object_id_seq OWNER TO freecodecamp;

--
-- Name: celestial_object_celestial_object_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.celestial_object_celestial_object_id_seq OWNED BY public.celestial_object.celestial_object_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_type text NOT NULL,
    age numeric NOT NULL,
    discovered boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer,
    diameter integer NOT NULL,
    tidally_locked boolean NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_id integer,
    radius integer NOT NULL,
    orbit_period numeric NOT NULL,
    habitable boolean NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer,
    mass numeric NOT NULL,
    temperature integer NOT NULL,
    active boolean NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: celestial_object celestial_object_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_object ALTER COLUMN celestial_object_id SET DEFAULT nextval('public.celestial_object_celestial_object_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: celestial_object; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.celestial_object VALUES (1, 'Comet Halley', 'Comet', 2.2, true);
INSERT INTO public.celestial_object VALUES (2, 'Ceres', 'Dwarf Planet', 0.94, true);
INSERT INTO public.celestial_object VALUES (3, 'Pluto', 'Dwarf Planet', 1.31, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13.51, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10.0, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 12.0, true);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 9.0, false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Elliptical', 11.0, true);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 'Lenticular', 8.5, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, 3474, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22, true);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12, true);
INSERT INTO public.moon VALUES (4, 'Io', 11, 3643, true);
INSERT INTO public.moon VALUES (5, 'Europa', 11, 3121, true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 11, 5262, true);
INSERT INTO public.moon VALUES (7, 'Callisto', 11, 4821, true);
INSERT INTO public.moon VALUES (8, 'Titan', 12, 5149, true);
INSERT INTO public.moon VALUES (9, 'Rhea', 12, 1528, true);
INSERT INTO public.moon VALUES (10, 'Triton', 10, 2706, true);
INSERT INTO public.moon VALUES (11, 'Oberon', 12, 1523, true);
INSERT INTO public.moon VALUES (12, 'Hyperion', 12, 270, true);
INSERT INTO public.moon VALUES (13, 'Enceladus', 12, 504, true);
INSERT INTO public.moon VALUES (14, 'Mimas', 12, 396, true);
INSERT INTO public.moon VALUES (15, 'Dione', 12, 1123, true);
INSERT INTO public.moon VALUES (16, 'Tethys', 12, 1060, true);
INSERT INTO public.moon VALUES (17, 'Umbriel', 12, 1169, true);
INSERT INTO public.moon VALUES (18, 'Ariel', 12, 1158, true);
INSERT INTO public.moon VALUES (19, 'Miranda', 12, 471, true);
INSERT INTO public.moon VALUES (20, 'Charon', 11, 1208, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 6371, 365.25, true);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 3389, 687.0, false);
INSERT INTO public.planet VALUES (3, 'Venus', 1, 6052, 224.7, false);
INSERT INTO public.planet VALUES (4, 'Proxima b', 4, 7166, 11.2, true);
INSERT INTO public.planet VALUES (5, 'Vulcan', 3, 8050, 345.3, false);
INSERT INTO public.planet VALUES (6, 'Sirius b', 2, 8372, 456.0, false);
INSERT INTO public.planet VALUES (7, 'Alpha Centauri Bb', 3, 7654, 365.0, false);
INSERT INTO public.planet VALUES (8, 'Arcturus A', 6, 9000, 400.0, false);
INSERT INTO public.planet VALUES (9, 'Vega c', 5, 4545, 234.0, true);
INSERT INTO public.planet VALUES (10, 'Neptune', 1, 24622, 60182.0, false);
INSERT INTO public.planet VALUES (11, 'Jupiter', 1, 71492, 4333.0, false);
INSERT INTO public.planet VALUES (12, 'Saturn', 1, 60268, 10759.0, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1.989, 5778, true);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 2.063, 9940, true);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 2, 1.1, 5790, true);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 2, 0.123, 3042, true);
INSERT INTO public.star VALUES (5, 'Vega', 3, 2.135, 9602, true);
INSERT INTO public.star VALUES (6, 'Arcturus', 4, 1.085, 4286, false);


--
-- Name: celestial_object_celestial_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.celestial_object_celestial_object_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: celestial_object celestial_object_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_object
    ADD CONSTRAINT celestial_object_name_key UNIQUE (name);


--
-- Name: celestial_object celestial_object_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_object
    ADD CONSTRAINT celestial_object_pkey PRIMARY KEY (celestial_object_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

