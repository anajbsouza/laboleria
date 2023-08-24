--
-- PostgreSQL database dump
--

-- Dumped from database version 14.9 (Homebrew)
-- Dumped by pg_dump version 14.9 (Homebrew)

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
-- Name: cakes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cakes (
    id integer NOT NULL,
    name character varying NOT NULL,
    price numeric NOT NULL,
    image character varying,
    description text
);


--
-- Name: cakes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cakes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cakes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cakes_id_seq OWNED BY public.cakes.id;


--
-- Name: clients; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.clients (
    id integer NOT NULL,
    name character varying NOT NULL,
    address character varying,
    phone character varying
);


--
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.clients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.clients_id_seq OWNED BY public.clients.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    clientid integer NOT NULL,
    cakeid integer NOT NULL,
    quantity integer NOT NULL,
    createdat timestamp without time zone DEFAULT now() NOT NULL,
    totalprice numeric NOT NULL
);


--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: cakes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cakes ALTER COLUMN id SET DEFAULT nextval('public.cakes_id_seq'::regclass);


--
-- Name: clients id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clients ALTER COLUMN id SET DEFAULT nextval('public.clients_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Data for Name: cakes; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cakes VALUES (1, 'Bolo de pote', 13.00, 'https://www.google.com/search?q=bolo&client=safari&sca_esv=559287649&rls=en&sxsrf=AB5stBh-_uIT_fpK6KENu7tRW8TKUks_vw:1692767153700&tbm=isch&source=iu&ictx=1&vet=1&fir=TIhVjrtRzuBttM%252Cz906jzS8zOEMDM%252C%252Fm%252F0fszt%253Bj6k5ZW9d0nsK6M%252C5aej9r8hCIfw9M%252C_%253BoDJsbNplo-K02M%252CVThBw7JH2ph9JM%252C_%253BcCeek1D_lEYrDM%252C8716SFq_EaHD6M%252C_%253BKBAqoOsyhpxuHM%252C9coOMo4NOEBMtM%252C_&usg=AI4_-kTUyWkt9-4Bp7qmdsziFWQ5DkJ8-Q&sa=X&ved=2ahUKEwjTzoiHgfKAAxUfL7kGHUwDAIcQ_B16BAhTEAE#imgrc=TIhVjrtRzuBttM', 'Bolo de chocolate com recheio de leite ninho');
INSERT INTO public.cakes VALUES (2, 'Bolo de chocolate', 13, 'https://www.google.com/search?q=bolo&client=safari&sca_esv=559287649&rls=en&sxsrf=AB5stBh-_uIT_fpK6KENu7tRW8TKUks_vw:1692767153700&tbm=isch&source=iu&ictx=1&vet=1&fir=TIhVjrtRzuBttM%252Cz906jzS8zOEMDM%252C%252Fm%252F0fszt%253Bj6k5ZW9d0nsK6M%252C5aej9r8hCIfw9M%252C_%253BoDJsbNplo-K02M%252CVThBw7JH2ph9JM%252C_%253BcCeek1D_lEYrDM%252C8716SFq_EaHD6M%252C_%253BKBAqoOsyhpxuHM%252C9coOMo4NOEBMtM%252C_&usg=AI4_-kTUyWkt9-4Bp7qmdsziFWQ5DkJ8-Q&sa=X&ved=2ahUKEwjTzoiHgfKAAxUfL7kGHUwDAIcQ_B16BAhTEAE#imgrc=TIhVjrtRzuBttM', 'Bolo de chocolate');
INSERT INTO public.cakes VALUES (3, 'Bolo de morango', 13, 'https://www.google.com/search?q=bolo&client=safari&sca_esv=559287649&rls=en&sxsrf=AB5stBh-_uIT_fpK6KENu7tRW8TKUks_vw:1692767153700&tbm=isch&source=iu&ictx=1&vet=1&fir=TIhVjrtRzuBttM%252Cz906jzS8zOEMDM%252C%252Fm%252F0fszt%253Bj6k5ZW9d0nsK6M%252C5aej9r8hCIfw9M%252C_%253BoDJsbNplo-K02M%252CVThBw7JH2ph9JM%252C_%253BcCeek1D_lEYrDM%252C8716SFq_EaHD6M%252C_%253BKBAqoOsyhpxuHM%252C9coOMo4NOEBMtM%252C_&usg=AI4_-kTUyWkt9-4Bp7qmdsziFWQ5DkJ8-Q&sa=X&ved=2ahUKEwjTzoiHgfKAAxUfL7kGHUwDAIcQ_B16BAhTEAE#imgrc=TIhVjrtRzuBttM', 'Bolo de morango');
INSERT INTO public.cakes VALUES (4, 'Bolo de baunilha', 13, 'https://www.google.com/search?q=bolo&client=safari&sca_esv=559287649&rls=en&sxsrf=AB5stBh-_uIT_fpK6KENu7tRW8TKUks_vw:1692767153700&tbm=isch&source=iu&ictx=1&vet=1&fir=TIhVjrtRzuBttM%252Cz906jzS8zOEMDM%252C%252Fm%252F0fszt%253Bj6k5ZW9d0nsK6M%252C5aej9r8hCIfw9M%252C_%253BoDJsbNplo-K02M%252CVThBw7JH2ph9JM%252C_%253BcCeek1D_lEYrDM%252C8716SFq_EaHD6M%252C_%253BKBAqoOsyhpxuHM%252C9coOMo4NOEBMtM%252C_&usg=AI4_-kTUyWkt9-4Bp7qmdsziFWQ5DkJ8-Q&sa=X&ved=2ahUKEwjTzoiHgfKAAxUfL7kGHUwDAIcQ_B16BAhTEAE#imgrc=TIhVjrtRzuBttM', 'Bolo de baunilha');


--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.clients VALUES (1, 'Fulana', 'Rua tal', '2199999999');
INSERT INTO public.clients VALUES (2, 'Ana Júlia', 'RJ', '6140028922');


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.orders VALUES (1, 1, 1, 2, '2023-08-23 02:58:04.076', 26);
INSERT INTO public.orders VALUES (2, 2, 3, 1, '2023-08-24 00:47:08.187', 13);
INSERT INTO public.orders VALUES (3, 2, 4, 1, '2023-08-24 00:47:17.254', 26);
INSERT INTO public.orders VALUES (4, 2, 2, 2, '2023-08-24 00:47:30.899', 26);


--
-- Name: cakes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cakes_id_seq', 4, true);


--
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.clients_id_seq', 2, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.orders_id_seq', 4, true);


--
-- Name: cakes cakes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cakes
    ADD CONSTRAINT cakes_pkey PRIMARY KEY (id);


--
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: orders orders_cakeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_cakeid_fkey FOREIGN KEY (cakeid) REFERENCES public.cakes(id);


--
-- Name: orders orders_clientid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_clientid_fkey FOREIGN KEY (clientid) REFERENCES public.clients(id);


--
-- Name: TABLE cakes; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.cakes TO bolo;


--
-- Name: SEQUENCE cakes_id_seq; Type: ACL; Schema: public; Owner: -
--

GRANT SELECT,USAGE ON SEQUENCE public.cakes_id_seq TO bolo;


--
-- Name: TABLE clients; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.clients TO bolo;


--
-- Name: SEQUENCE clients_id_seq; Type: ACL; Schema: public; Owner: -
--

GRANT SELECT,USAGE ON SEQUENCE public.clients_id_seq TO bolo;


--
-- Name: TABLE orders; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.orders TO bolo;


--
-- Name: SEQUENCE orders_id_seq; Type: ACL; Schema: public; Owner: -
--

GRANT SELECT,USAGE ON SEQUENCE public.orders_id_seq TO bolo;


--
-- PostgreSQL database dump complete
--

