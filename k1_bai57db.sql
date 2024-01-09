--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

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
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    status boolean DEFAULT false
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: custumers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.customers ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.custumers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: phones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.phones (
    id integer NOT NULL,
    user_id integer NOT NULL,
    phone integer NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.phones OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(50),
    email character varying(50),
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    status boolean DEFAULT false,
    deleted_at timestamp with time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (id, email, password, created_at, updated_at, status) FROM stdin;
3	lien3@gmail.com\n	$2b$10$tNyvL.BORHuWvve0STA84u87ScKfAjYiiP2XsduUnMjd/TrxPU5r.	2024-01-07 02:12:41.977255+07	2024-01-07 02:12:41.977255+07	f
4	tuanhung@gmail.com	$2b$10$M.MUYPDd0z6YbLHZ0dB9Q.qkfQ.v624hnZxBDI/2PSKGkUp4zzR/q	2024-01-07 02:12:41.977255+07	2024-01-07 02:12:41.977255+07	f
1	trunglv@gmail.com	$2b$10$A1YXsG8lu4DgcJo5.An5A.InV5f4/x8ZKRO4UxxvhEM3m2wz6YD5K	2024-01-06 21:47:15.417492+07	2024-01-06 21:47:15.417492+07	t
2	hang16@gmail.com	$2b$10$YWFvvOu5PNFm7XJM324/Oef0eZ3XUerLGKaEWz3sOzjmkK2IZ7meG	2024-01-07 02:08:39.616658+07	2024-01-07 02:08:39.616658+07	t
18	ngocminh@gmail.com	$2b$10$/27UZ9r/UzZL/UR5ugA0KOsim7SWEXoBKTdwdHXC8YlpCuCdk/926	2024-01-09 23:15:15.611908+07	2024-01-09 23:15:15.611908+07	f
\.


--
-- Data for Name: phones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.phones (id, user_id, phone, created_at, updated_at) FROM stdin;
1	23	12345678	2024-01-07 21:36:18.184852+07	2024-01-07 21:36:18.184852+07
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, created_at, updated_at, status, deleted_at) FROM stdin;
16	aaaaa	user1@gmail.com	2024-01-07 20:33:00.706+07	2024-01-07 20:33:00.706+07	t	\N
17	2	user2@gmail.com	2024-01-07 20:33:09.989+07	2024-01-07 20:33:09.989+07	t	\N
18	3	user3@gmail.com	2024-01-07 20:33:19.56+07	2024-01-07 20:33:19.56+07	f	\N
19	4	user4@gmail.com	2024-01-07 20:33:28.228+07	2024-01-07 20:33:28.228+07	f	\N
20	5	user5@gmail.com	2024-01-07 20:33:36.992+07	2024-01-07 20:33:36.992+07	t	\N
21	6	user6@gmail.com	2024-01-07 20:33:47.131+07	2024-01-07 20:33:47.131+07	t	\N
22	7	user7@gmail.com	2024-01-07 20:33:56.373+07	2024-01-07 20:33:56.373+07	t	\N
23	8	user8@gmail.com	2024-01-07 20:34:03.863+07	2024-01-07 20:34:03.863+07	t	\N
24	9	user9@gmail.com	2024-01-07 20:34:13.852+07	2024-01-07 20:34:13.852+07	f	\N
25	10	user10@gmail.com	2024-01-07 20:34:29.651+07	2024-01-07 20:34:29.651+07	t	\N
26	11	user11@gmail.com	2024-01-07 20:35:06.756+07	2024-01-07 20:35:06.756+07	t	\N
\.


--
-- Name: custumers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.custumers_id_seq', 18, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 26, true);


--
-- Name: customers custumers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT custumers_pkey PRIMARY KEY (id);


--
-- Name: phones phone_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phones
    ADD CONSTRAINT phone_pkey PRIMARY KEY (id, user_id, phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: phones phone_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phones
    ADD CONSTRAINT phone_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) NOT VALID;


--
-- PostgreSQL database dump complete
--

