--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.4

-- Started on 2022-12-14 13:39:46

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
-- TOC entry 210 (class 1259 OID 17154)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 17153)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.category ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 212 (class 1259 OID 17160)
-- Name: image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.image (
    id integer NOT NULL,
    file_name character varying(255),
    product_id integer NOT NULL
);


ALTER TABLE public.image OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 17159)
-- Name: image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.image ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 214 (class 1259 OID 17166)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    count integer NOT NULL,
    date_time timestamp without time zone,
    number character varying(255),
    price real NOT NULL,
    status integer,
    person_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 17165)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.orders ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 216 (class 1259 OID 17172)
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    id integer NOT NULL,
    birthday text NOT NULL,
    email text NOT NULL,
    firstname text NOT NULL,
    lastname text NOT NULL,
    login character varying(50),
    password character varying(255),
    patronymic text,
    phone_number text NOT NULL,
    role character varying(255)
);


ALTER TABLE public.person OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 17171)
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.person ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 218 (class 1259 OID 17180)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    date_time_of_created timestamp without time zone,
    description text NOT NULL,
    price real NOT NULL,
    seller character varying(255) NOT NULL,
    title text NOT NULL,
    warehouse character varying(255) NOT NULL,
    category_id integer NOT NULL,
    CONSTRAINT product_price_check CHECK ((price >= (1)::double precision))
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17189)
-- Name: product_cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_cart (
    id integer NOT NULL,
    person_id integer,
    product_id integer
);


ALTER TABLE public.product_cart OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17188)
-- Name: product_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.product_cart ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.product_cart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 217 (class 1259 OID 17179)
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.product ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3265 (class 0 OID 17154)
-- Dependencies: 210
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.category (id, name) VALUES (1, 'Вечериночные');
INSERT INTO public.category (id, name) VALUES (2, 'Детективные');
INSERT INTO public.category (id, name) VALUES (3, 'Детские');


--
-- TOC entry 3267 (class 0 OID 17160)
-- Dependencies: 212
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.image (id, file_name, product_id) VALUES (1, '81ee2927-f501-4730-bbb2-0d7013376f51.1.jpg', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (2, '1358ceed-a504-464d-9cfe-a7d96baaa3ac.2.jpg', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (3, '330366b5-fdc9-47e5-a4e4-16c49affdd83.3.jpg', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (4, '2d5c671e-0496-47dc-886c-82343318fce1.4.jpg', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (5, 'abd3c587-2ac1-4be0-9697-655080fe7c47.5.jpg', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (6, 'd8e5a3a9-b8bc-45a3-908f-3e1a4b77924b.1.jpg', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (7, '3ae0890e-560d-4d5b-8ebd-ae239f93b629.2.jpg', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (8, 'cc417760-ef82-4b97-a1b1-b403c4cb91b1.3.jpg', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (9, '85f6905c-c6ff-438d-a56f-7c2cc3c98821.4.jpg', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (10, 'f4689677-4bec-4c58-9d98-1c3d7dc4b6da.5.jpg', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (11, '291ed1b2-3382-402a-bb1e-21b4b50cfc63.1.jpg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (12, '2e40af8b-bd85-4258-8bf2-deb7d414e488.2.jpg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (13, '04bc3e6b-b85f-4c37-ad46-779fe3fdabca.3.jpg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (14, '194d84dc-fef7-4e47-937c-d5357f9c4138.4.jpg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (15, 'abba2929-b5e1-479d-b5b5-e6b0af536a80.5.jpg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (16, '9ac0dff7-60fd-418f-9811-4feab3cb019d.1.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (17, '4c294ab2-8ab9-4c4a-9bc9-9218b7b6a88a.2.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (18, '4adb645f-5227-4ebc-ba89-799b2a392dc4.3.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (19, 'dca74fc7-d62b-41e3-b371-a9e80403b5bd.4.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (20, '414a8bd1-9295-4d9a-8b70-e9fa9a082896.5.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (21, 'b7de4a9f-c441-4d39-8c36-401da7384034.1.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (22, '14e67887-44c4-4941-b44c-913569c4777b.2.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (23, '2676d71d-5319-4d2c-80cc-f59ff17654fa.3.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (24, '882b1252-6629-43dc-9444-dd82e1b39b43.4.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (25, '537316d6-c706-4d0a-b057-09cf3513e041.5.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (26, '62b848c4-0191-43cb-b2c7-35c8869da58e.1.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (27, '5f8f14f8-d94c-4f39-9850-f19e1cc57469.2.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (28, '6a736d1c-bdc6-471a-b018-231ebeaec969.3.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (29, 'a5ab28b9-0b43-45fa-ba0b-71b33609c1b9.4.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (30, '2e58ef5f-71c0-4584-8ef2-765c6aab451f.5.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (31, '4e6c8033-f8b6-499c-88c9-af7fa6da1421.1.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (32, 'aa678dbf-0ae6-4807-97c3-3be2946a54fb.2.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (33, '55c95d6b-45a4-4af9-837e-f69ab7b69b44.3.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (34, 'ce3931e2-e5e1-4f6e-bf1a-92f2de5d3e14.4.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (35, '7940d6da-33c0-477f-ada3-f5fca591c935.5.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (36, 'ced789e5-c07c-49b5-b8cb-7d6bee8b300e.1.jpg', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (37, '80497559-b79f-492d-9baa-47d3a4a8ce57.3.jpg', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (38, '1f9d1732-c88c-4e57-afbd-9ded7ba21a8e.4.jpg', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (39, 'd7989c55-aadf-4c98-904d-0f075b5a13d0.2.jpg', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (40, 'e4b3f37a-2de8-47c0-a53e-9d712b6ef6df.5.jpg', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (46, '362162af-0acb-4c36-8a2c-8492fcfc9133.1.jpg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (47, 'ec881cf5-30de-4a7d-bd00-a6c2300cd1ec.2.jpg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (48, '3b68fb09-356f-4572-b9a0-2517b3228680.3.jpg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (49, '9afedc09-6e77-4c3f-bc48-2c2f100288a9.4.jpg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (50, 'b0f87a5d-bdea-49b4-a9d9-ec42fbb87f8c.5.jpg', 10);


--
-- TOC entry 3269 (class 0 OID 17166)
-- Dependencies: 214
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (1, 1, '2022-12-07 01:05:43.746851', 'eafa56d5-24ce-426a-af12-d56c7b2177f0', 990, 2, 2, 1);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (2, 1, '2022-12-07 03:36:25.090428', '2c13c780-0f6a-4efe-8c02-5f610b45f138', 2990, 2, 2, 2);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (6, 1, '2022-12-12 00:19:25.313369', '2be5afef-0ddb-41d0-ae2f-e12d8ed69db9', 2990, 1, 2, 2);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (7, 1, '2022-12-12 01:19:25.475609', '6a18722f-f160-4fac-97b6-792fae3fc1dc', 1290, 1, 2, 5);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (3, 1, '2022-12-07 03:37:39.544126', 'f7b5d80d-ff94-4c13-a670-6e92071f4cae', 1290, 2, 3, 5);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (8, 1, '2022-12-14 10:12:50.122879', 'ac0fac0a-631e-4547-a41c-f5e3afd5c6e5', 1590, 1, 6, 3);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (9, 1, '2022-12-14 10:39:24.328896', 'b8dca018-1102-40e3-abf8-9a3663b4162e', 1590, 1, 7, 3);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (10, 1, '2022-12-14 10:46:36.829388', '447a4fd7-086d-4eb2-a0dc-4fdf3231b8a1', 1290, 1, 8, 8);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (11, 1, '2022-12-14 10:55:38.320105', 'dbe4c3bb-4207-4ff3-b226-67fcfb9e021f', 1590, 1, 9, 3);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (4, 1, '2022-12-07 22:11:00.933878', '388eb573-e238-42f6-8530-f68159158fee', 1590, 3, 2, 3);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (5, 1, '2022-12-07 22:11:00.943392', '388eb573-e238-42f6-8530-f68159158fee', 1090, 1, 2, 6);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (13, 1, '2022-12-14 12:20:46.319212', '104b0183-302b-40b4-a48f-37534cdc516e', 1090, 1, 12, 6);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (14, 1, '2022-12-14 12:31:31.661351', 'd71d20ce-1e7a-4364-ba09-5175cb76c66d', 1090, 1, 15, 6);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (12, 1, '2022-12-14 12:13:41.597559', '088edf52-b03d-4392-9f3d-9bd13b2019d7', 3100, 0, 11, 4);


--
-- TOC entry 3271 (class 0 OID 17172)
-- Dependencies: 216
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.person (id, birthday, email, firstname, lastname, login, password, patronymic, phone_number, role) VALUES (1, '03.12.1996', 'eksbad1996@gmail.com', 'Ксения', 'Ефимова', 'admin', '$2a$10$MJWYHkcUHeF9mK/MR5D9eeYshToGiEyskeFFN1D7to64mxFKmQiUa', 'Сергеевна', '89058382112', 'ROLE_ADMIN');
INSERT INTO public.person (id, birthday, email, firstname, lastname, login, password, patronymic, phone_number, role) VALUES (7, '06.08.1989', 'sidorov@gmail.com', 'Сергей', 'Сидоров', 'user_test5', '$2a$10$JR2aoZeuLQmGbV2n5HRNIOmQNMSzRLZZ2vaWpyTKQzvypNlhscpbm', 'Сергеевич', '89014569685', 'ROLE_USER');
INSERT INTO public.person (id, birthday, email, firstname, lastname, login, password, patronymic, phone_number, role) VALUES (8, '05.04.1993', 'sid@mail.ru', 'Юлия', 'Сидорова', 'user_test6', '$2a$10$zPicsMMbSp3hbpTmagxCsuJrRcDupt4RUf1fvmpKuRMxjdlcEW1Vq', 'Андреевна', '89052147889', 'ROLE_USER');
INSERT INTO public.person (id, birthday, email, firstname, lastname, login, password, patronymic, phone_number, role) VALUES (9, '25.01.1989', 'koz89@mail.ru', 'Марина', 'Козлова', 'user_test7', '$2a$10$u9slbXQHifPZ73JauS3lCOvwA60LzViZcO3F3KumgcAMqrtxuWhLC', 'Владимировна', '89124567887', 'ROLE_USER');
INSERT INTO public.person (id, birthday, email, firstname, lastname, login, password, patronymic, phone_number, role) VALUES (3, '22.07.1993', 'petrov@gmail.com', 'Иван', 'Петров', 'user_test2', '$2a$10$AHVSWRLC0pkU8U8iXKm/hOCrPYJaAnIWGfOWP7Be5myeAVgqiBKIW', 'Петрович', '89121231881', 'ROLE_ADMIN');
INSERT INTO public.person (id, birthday, email, firstname, lastname, login, password, patronymic, phone_number, role) VALUES (10, '05.12.2004', 'kris@mail.ru', 'Кристина', 'Иванова', 'user_test8', '$2a$10$IUPdZdOX9ATIubJgGBKbGOU8EyAW0LhwGXV/fU5R4WTm8QudzkGyW', 'Петровна', '89174561232', 'ROLE_USER');
INSERT INTO public.person (id, birthday, email, firstname, lastname, login, password, patronymic, phone_number, role) VALUES (11, '06.09.2001', 'ant123@mail.ru', 'Антонина', 'Сергеева', 'user_test9', '$2a$10$j0fOr8V1T7.Ys1xocp648e9tBQEI0UV5lk8mUYkmeOELltp/.Zq3e', 'Павловна', '89037894565', 'ROLE_USER');
INSERT INTO public.person (id, birthday, email, firstname, lastname, login, password, patronymic, phone_number, role) VALUES (6, '04.12.1998', 'ivanov1998@mail.ru', 'Михаил', 'Иванов', 'user_test4', '$2a$10$InvFdp7jXuUDsVG0P9CyuOICmvVlcMvrZvRsW5trY5Yr88Qqf3LLu', 'Петрович', '89051478996', 'ROLE_ADMIN');
INSERT INTO public.person (id, birthday, email, firstname, lastname, login, password, patronymic, phone_number, role) VALUES (12, '01.01.2000', 'titov@gmail.com', 'Данил', 'Титов', 'useruser123', '$2a$10$Zeo7x0dX1UqhDpc29iZXd.cjwL2FFeMJZLG.hhf9Au0dTpSrCc4t6', 'Евгеньевич', '89124568585', 'ROLE_USER');
INSERT INTO public.person (id, birthday, email, firstname, lastname, login, password, patronymic, phone_number, role) VALUES (14, '14.06.1995', 'petrovaaaa@gmail.com', 'Екатерина', 'Петрова', 'User12345', '$2a$10$7ryjrZONLzbcKTJQ76tCie08Ja6WObLUkynZpglFTeXs1pBm3vG6m', 'Сергеевна', '89058431544', 'ROLE_USER');
INSERT INTO public.person (id, birthday, email, firstname, lastname, login, password, patronymic, phone_number, role) VALUES (15, '15.05.1990', 'eksbad@gmail.com', 'Екатерина', 'Сидоровa', 'user_test1234', '$2a$10$zZpAHcrSX6UfWU0YDBFzTuhADuvbSELMrOxDsrcjK7M7BI2Rd/HM6', 'Ивановна', '89058431202', 'ROLE_USER');
INSERT INTO public.person (id, birthday, email, firstname, lastname, login, password, patronymic, phone_number, role) VALUES (2, '15.05.1990', 'ivan123@mail.ru', 'Иван', 'Иванов', 'user_test1', '$2a$10$bl1wSUDVNSZo05SFt7MyCu2OLk3VP8jGtPjX67iBZcMx51JkEtETG', 'Иванович', '89121231213', 'ROLE_USER');


--
-- TOC entry 3273 (class 0 OID 17180)
-- Dependencies: 218
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (5, '2022-12-07 00:54:33.226011', 'Добро пожаловать в Сайдвуд – тихий и умиротворённый город... до недавнего времени. Полиция уже сбилась с ног в попытках разгадать загадочное убийство, но тут вмешались потусторонние силы.

Один из игроков станет призраком жертвы и будет помогать детективам раскрыть дело. Единственный способ взаимодействия детективов и призрака – общение через мистический почтовый ящик, в который сыщикам предстоит складывать изображения всевозможных найденных улик. Призрак же, в свою очередь, оставляет там лишь некоторые из таких улик в качестве подсказок, остальным же уготована учесть бесследно исчезнуть. Поторопитесь, ведь время бежит, и вот уже осталось буквально несколько дней до того момента, как призрак потеряет контакт с этим миром.

И самое главное – не терять бдительности, ведь среди детективов вполне могут скрываться убийца со своими сообщниками, которые всячески будут запутывать всех остальных. Всё для того, чтобы помешать расследованию!
', 1290, 'Экономикус', 'Письма призрака ', 'Москва', 2);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (6, '2022-12-07 00:55:22.715468', 'Он всматривался в лица собравшихся в баре сквозь густой дым сигары. Музыканты играли негромкий блюз, напиток в стакане пах пряно и терпко. Певичка на сцене была вне подозрений – её алиби было столь же безупречным, как и её голос. Но вот тот парень с поднятым воротником и в надвинутой кепке вызывал серьезное беспокойство. Он вполне мог быть маньяком – тем, кто был причиной его бессонницы, а также нескольких смертей прямо на темных улицах укрытого дождем города...

В этой игре на дедукцию и логику вам предстоит погрузиться в атмосферу криминальных драм. Бандиты располагают возможностью творить свои злодеяния, а полицейские и сыщики – выслеживать и останавливать их. Карточки ролей, определяющие способности, распределяются между персонажами случайным образом перед каждой партией, так что помните – внешность может быть обманчива.

Прячьтесь, маскируйтесь, допрашивайте, выдвигайте обвинения, и истина откроется вам. Какой бы неожиданной и горькой она ни была...
', 1090, 'GaGa Games', 'Нуар ', 'Новосибирск', 2);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (3, NULL, 'Что любят гномы больше чем свою бороду, эль и принцесс? Конечно же добывать золото! Вот и наши гномы в настольной игре "Гномы-вредители" отправились на поиски золота в тёмную шахту, полную золотых самородков. Но чтобы до них добраться, гномам придётся пройти длинный путь по лабиринтам подземелья. К сожалению, не все гномы хотят добыть золото, кто-то пытается помешать своим братьям. Таких гномов называют вредителями и среди вас такие точно тоже есть...', 1590, 'Стиль Жизни', 'Гномы ', 'Новосибирск', 1);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (4, NULL, 'Лондон, наши дни. Вы только что вышли из кабинета комиссара. Вам поручено расследование гибели бедолаги в Гайд-парке. Вы не новичок, но когда речь идёт о смерти, всегда становится не по себе, а в данном случае подробности преступления, откровенно настораживают...', 3100, 'Hobby World', 'Место преступления ', 'Челябинск', 2);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (7, '2022-12-07 00:56:15.963904', 'Легенда гласит, что знаменитая стратегия "Шакал" была придумана в МГУ в 70-х годах прошлого века, хотя никаких документальных подтверждений этому событию, увы, нет. Так или иначе, это полностью отечественная игра, рассчитанная на наш менталитет.

Первое издание увидело свет в 2009 году, а несколькими годами позднее "Шакал" получил титул "Лучшая стратегия 2012 года". С тех пор было выпущено несколько разных изданий игры, а также дополнение. Версия, которая перед вами сейчас, пожалуй, может считаться самой удобной, ведь в неё уже включено дополнение, а также рамка для острова. Плюс к этому, в правилах вы найдёте ответы на вопросы по различным нюансам и тонкостям игры и словарь морских ругательств в качестве бонуса.

Цель игры осталась прежней – ваша команда попадает на остров в надежде отыскать сокровища и впоследствии перенести его на свой корабль. Сам остров состоит из множества клеток, каждая из которых приготовила для вас сюрприз – будь то полёт на воздушном шаре или же встреча с крокодилом. Открывайте новые земли, сражайтесь с конкурентами и станьте единоличными обладателями большого пиратского клада!
', 2490, 'Magellan', 'Шакал: Остров Сокровищ ', 'Челябинск', 3);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (8, '2022-12-07 00:57:18.274281', 'Всем известно, что Черепахи очень не любят спешить, но иногда даже им приходится побегать... …за лакомым кусочком сочной капусты, например! И уж тем более, когда до неё лапкой подать, а в панцирь дышат такие же упорные любители свежей зелени! Тут начинаются настоящие "Черепашьи бега"! Однако, черепашки быстро устают и непременно воспользуются шансом прокатиться верхом на товарище. Правда, кто знает, куда Вас занесёт такая поездочка?.. Можете представить, что творится на нашем импровизированном гоночном треке? Правильно, веселье!', 1290, 'Hobby World', 'Черепашьи бега', 'Москва', 3);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (10, '2022-12-07 00:59:00.193355', 'Жили – не тужили жители в нашем замке, пока не появились в один прекрасный (скорее, ужасный) день издалека злобные тролли. Судя по их злобным мордам они собрались захватить нашу крепость! Придётся встать на защиту и дать должный отпор зелёным злыдням!', 990, 'Fireside Games', 'Моя первая осада замка ', 'Новосибирск', 3);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (1, NULL, 'Если вы решили приобрести одну из самых популярных настольных игр, чтобы поиграть в неё в кругу семьи, рекомендуем ознакомиться с оригинальной версией "Неудержимых единорожек" для игроков от 12 лет.
Данное же издание изобилует смелыми, откровенными, а порой и непотребными иллюстрациями и шутками и предназначено только для взрослой и, желательно, морально закалённой аудитории!
', 990, 'Hobby World', 'Неудержимые единорожки ', 'Челябинск', 1);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (2, NULL, 'Случилось страшное: глобальная катастрофа, конец света, апокалипсис – кому как больше нравится. Чтобы выжить, вам срочно нужно попасть в бункер, но в вашей группе слишком много людей, на всех внутри не хватит ни провизии, ни места. А значит кому-то придётся остаться снаружи и пытаться выжить там. Вы же не хотите скитаться по отравленным пустошам в поисках глотка воды, которая ещё и может оказаться отравленной или радиоактивной? Тогда постарайтесь убедить остальных, что без вас им никак не выжить! Внутрь попадут только самые полезные члены группы. Вы получаете случайный набор карт, который определяет ваш пол, возраст, состояние здоровья, профессию и другие черты, а ваша задача – убедить остальных, что этот набор характеристик весьма и весьма эффективен. Как убедить остальных, что ваше гомеопатическое хобби принесёт им пользу? Попробуйте и узнаете, а заодно и прокачаете навык ораторского мастерства!', 2990, 'Экономикус', 'Бункер ', 'Москва', 2);


--
-- TOC entry 3275 (class 0 OID 17189)
-- Dependencies: 220
-- Data for Name: product_cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product_cart (id, person_id, product_id) VALUES (13, 2, 7);
INSERT INTO public.product_cart (id, person_id, product_id) VALUES (20, 10, 6);


--
-- TOC entry 3281 (class 0 OID 0)
-- Dependencies: 209
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 3, true);


--
-- TOC entry 3282 (class 0 OID 0)
-- Dependencies: 211
-- Name: image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.image_id_seq', 75, true);


--
-- TOC entry 3283 (class 0 OID 0)
-- Dependencies: 213
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 14, true);


--
-- TOC entry 3284 (class 0 OID 0)
-- Dependencies: 215
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.person_id_seq', 15, true);


--
-- TOC entry 3285 (class 0 OID 0)
-- Dependencies: 219
-- Name: product_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_cart_id_seq', 26, true);


--
-- TOC entry 3286 (class 0 OID 0)
-- Dependencies: 217
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 15, true);


--
-- TOC entry 3102 (class 2606 OID 17158)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 3104 (class 2606 OID 17164)
-- Name: image image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);


--
-- TOC entry 3106 (class 2606 OID 17170)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3108 (class 2606 OID 17178)
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- TOC entry 3118 (class 2606 OID 17193)
-- Name: product_cart product_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT product_cart_pkey PRIMARY KEY (id);


--
-- TOC entry 3114 (class 2606 OID 17187)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 3110 (class 2606 OID 17197)
-- Name: person uk_2ldqhx89sy06ya51rrnndhwmc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT uk_2ldqhx89sy06ya51rrnndhwmc UNIQUE (phone_number);


--
-- TOC entry 3112 (class 2606 OID 17195)
-- Name: person uk_fwmwi44u55bo4rvwsv0cln012; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT uk_fwmwi44u55bo4rvwsv0cln012 UNIQUE (email);


--
-- TOC entry 3116 (class 2606 OID 17199)
-- Name: product uk_qka6vxqdy1dprtqnx9trdd47c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c UNIQUE (title);


--
-- TOC entry 3120 (class 2606 OID 17205)
-- Name: orders fk1b0m4muwx1t377w9if3w6wwqn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- TOC entry 3122 (class 2606 OID 17215)
-- Name: product fk1mtsbur82frn64de7balymq9s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk1mtsbur82frn64de7balymq9s FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- TOC entry 3121 (class 2606 OID 17210)
-- Name: orders fk787ibr3guwp6xobrpbofnv7le; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk787ibr3guwp6xobrpbofnv7le FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3119 (class 2606 OID 17200)
-- Name: image fkgpextbyee3uk9u6o2381m7ft1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1 FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3123 (class 2606 OID 17225)
-- Name: product_cart fkhpnrxdy3jhujameyod08ilvvw; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3124 (class 2606 OID 17220)
-- Name: product_cart fksgnkc1ko2i1o9yr2p63ysq3rn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn FOREIGN KEY (person_id) REFERENCES public.person(id);


-- Completed on 2022-12-14 13:39:46

--
-- PostgreSQL database dump complete
--

