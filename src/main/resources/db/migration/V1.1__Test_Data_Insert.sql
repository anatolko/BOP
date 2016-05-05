--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.0
-- Dumped by pg_dump version 9.5.0

-- Started on 2016-04-22 12:37:20

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- TOC entry 2225 (class 0 OID 16689)
-- Dependencies: 198
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO user_roles (id, name) VALUES (1, 'ROLE_ADMIN');
INSERT INTO user_roles (id, name) VALUES (2, 'ROLE_MODERATOR');
INSERT INTO user_roles (id, name) VALUES (3, 'ROLE_USER');
INSERT INTO user_roles (id, name) VALUES (4, 'ROLE_ANONYMOUS');


--
-- TOC entry 2251 (class 0 OID 0)
-- Dependencies: 197
-- Name: user_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_roles_id_seq', 4, true);


--
-- TOC entry 2220 (class 0 OID 16441)
-- Dependencies: 193
-- Data for Name: plants; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO plants (id, plant_code, description, parent_plant_id) VALUES (1, 'RULIP', 'Lipetsk plant', NULL);
INSERT INTO plants (id, plant_code, description, parent_plant_id) VALUES (2, 'SKHLO', 'Slovakia Hlohovec', NULL);
INSERT INTO plants (id, plant_code, description, parent_plant_id) VALUES (3, 'SKSLA', 'Slovakia Sladko', NULL);
INSERT INTO plants (id, plant_code, description, parent_plant_id) VALUES (4, 'RR', 'Hlohovec subsite', 2);
INSERT INTO plants (id, plant_code, description, parent_plant_id) VALUES (5, 'IP', 'Hlohovec subsite', 2);


--
-- TOC entry 2248 (class 0 OID 0)
-- Dependencies: 185
-- Name: plants_sec; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('plants_sec', 5, true);

--
-- TOC entry 2217 (class 0 OID 16420)
-- Dependencies: 190
-- Data for Name: obs_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO obs_categories (id, name, plant_id) VALUES (1, '{"ru":"Средства индивидуальной защиты","en":"Personal protective equipment"}', 1);
INSERT INTO obs_categories (id, name, plant_id) VALUES (2, '{"ru":"Реакция сотрудника","en":"Employee reaction"}', 1);
INSERT INTO obs_categories (id, name, plant_id) VALUES (3, '{"ru":"Положение, поведение сотрудника","en":"tmp"}', 1);
INSERT INTO obs_categories (id, name, plant_id) VALUES (4, '{"ru":"Инструменты и оборудование","en":"tmp"}', 1);
INSERT INTO obs_categories (id, name, plant_id) VALUES (5, '{"ru":"Процедуры порядка и чистоты","en":"tmp"}', 1);

--
-- TOC entry 2245 (class 0 OID 0)
-- Dependencies: 182
-- Name: obs_cat_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('obs_cat_id', 5, true);


--
-- TOC entry 2218 (class 0 OID 16427)
-- Dependencies: 191
-- Data for Name: obs_departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO obs_departments (id, name, plant_id) VALUES (1, '{"ru":"Столовая","en":"Canteen"}', 1);
INSERT INTO obs_departments (id, name, plant_id) VALUES (4, '{"ru":"Участок мокрого волочения","en":"Wet wire drawning"}', 1);
INSERT INTO obs_departments (id, name, plant_id) VALUES (5, '{"ru":"Участок навивки канатов","en":"Bunching"}', 1);

--
-- TOC entry 2246 (class 0 OID 0)
-- Dependencies: 183
-- Name: obs_dep_sec; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('obs_dep_sec', 5, true);


--
-- TOC entry 2219 (class 0 OID 16434)
-- Dependencies: 192
-- Data for Name: obs_fields; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO obs_fields (id, cat_id, name, description) VALUES (2, 1, '{"ru":"Голова","en":"Head"}', NULL);
INSERT INTO obs_fields (id, cat_id, name, description) VALUES (4, 1, '{"ru":"Глаза и лицо","en":"Eyes and face"}', NULL);
INSERT INTO obs_fields (id, cat_id, name, description) VALUES (5, 1, '{"ru":"Органы дыхания","en":"Respiratory organs"}', NULL);
INSERT INTO obs_fields (id, cat_id, name, description) VALUES (7, 1, '{"ru":"Уши","en":"Ears"}', NULL);
INSERT INTO obs_fields (id, cat_id, name, description) VALUES (9, 1, '{"ru":"Руки","en":"Arms"}', NULL);
INSERT INTO obs_fields (id, cat_id, name, description) VALUES (10, 1, '{"ru":"Туловище","en":"Body"}', NULL);
INSERT INTO obs_fields (id, cat_id, name, description) VALUES (12, 1, '{"ru":"Ноги и ступни","en":"Legs"}', NULL);
INSERT INTO obs_fields (id, cat_id, name, description) VALUES (13, 2, '{"ru":"Не надевает СИЗ","en":"Not wearing PPE"}', NULL);
INSERT INTO obs_fields (id, cat_id, name, description) VALUES (14, 2, '{"ru":"Не меняет положение в работе","en":"tmp"}', NULL);
INSERT INTO obs_fields (id, cat_id, name, description) VALUES (15, 2, '{"ru":"Прекращает работу","en":"tmp"}', NULL);
INSERT INTO obs_fields (id, cat_id, name, description) VALUES (16, 2, '{"ru":"Не проводт блокировку/маркировку/заземление","en":"tmp"}', NULL);
INSERT INTO obs_fields (id, cat_id, name, description) VALUES (18, 2, '{"ru":"Не меняет оборудование или инструмент","en":"tmp"}', NULL);
INSERT INTO obs_fields (id, cat_id, name, description) VALUES (19, 2, '{"ru":"Работает в часах, кольцах и т.п.","en":"tmp"}', NULL);
INSERT INTO obs_fields (id, cat_id, name, description) VALUES (20, 2, '{"ru":"Не убраны длинные волосы","en":"tmp"}', NULL);
INSERT INTO obs_fields (id, cat_id, name, description) VALUES (21, 2, '{"ru":"На производстве используются мобильные телефоны","en":"tmp"}', NULL);
INSERT INTO obs_fields (id, cat_id, name, description) VALUES (22, 3, '{"ru":"Находится между/в/на объектаъ","en":"tmp"}', NULL);
INSERT INTO obs_fields (id, cat_id, name, description) VALUES (23, 3, '{"ru":"Бьет по объекту/объект попадает по нему","en":"tmp"}', NULL);
INSERT INTO obs_fields (id, cat_id, name, description) VALUES (24, 3, '{"ru":"Работа на высоте","en":"tmp"}', NULL);
INSERT INTO obs_fields (id, cat_id, name, description) VALUES (25, 3, '{"ru":"Контакт с высокой температурой","en":"tmp"}', NULL);
INSERT INTO obs_fields (id, cat_id, name, description) VALUES (26, 3, '{"ru":"Работа с электрооборудованием","en":"tmp"}', NULL);
INSERT INTO obs_fields (id, cat_id, name, description) VALUES (27, 3, '{"ru":"Работа с химвеществами","en":"tmp"}', NULL);
INSERT INTO obs_fields (id, cat_id, name, description) VALUES (28, 3, '{"ru":"Повторяющиеся движения","en":"tmp"}', NULL);
INSERT INTO obs_fields (id, cat_id, name, description) VALUES (30, 3, '{"ru":"Опасное положение","en":"tmp"}', NULL);
INSERT INTO obs_fields (id, cat_id, name, description) VALUES (31, 4, '{"ru":"Не соответствует выполняемой работе","en":"tmp"}', NULL);
INSERT INTO obs_fields (id, cat_id, name, description) VALUES (32, 4, '{"ru":"Неправильное использование","en":"tmp"}', NULL);
INSERT INTO obs_fields (id, cat_id, name, description) VALUES (33, 4, '{"ru":"Непригодно для работы","en":"tmp"}', NULL);
INSERT INTO obs_fields (id, cat_id, name, description) VALUES (35, 5, '{"ru":"Непригодные","en":"tmp"}', NULL);
INSERT INTO obs_fields (id, cat_id, name, description) VALUES (36, 5, '{"ru":"Невыполненные","en":"tmp"}', NULL);
INSERT INTO obs_fields (id, cat_id, name, description) VALUES (38, 5, '{"ru":"Неизвестные","en":"tmp"}', NULL);
INSERT INTO obs_fields (id, cat_id, name, description) VALUES (39, 5, '{"ru":"Неустановленные","en":"tmp"}', NULL);


--
-- TOC entry 2247 (class 0 OID 0)
-- Dependencies: 184
-- Name: obs_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('obs_fields_id_seq', 39, true);

--
-- TOC entry 2221 (class 0 OID 16448)
-- Dependencies: 194
-- Data for Name: user_departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO user_departments (id, name, plant_id) VALUES (1, '{"ru":"Отдел кадров","en":"HR"}', 1);


--
-- TOC entry 2249 (class 0 OID 0)
-- Dependencies: 186
-- Name: user_departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_departments_id_seq', 1, true);


--
-- TOC entry 2222 (class 0 OID 16455)
-- Dependencies: 195
-- Data for Name: user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO user_groups (id, name, cards_count, plant_id) VALUES (1, 'L', 1, 1);
INSERT INTO user_groups (id, name, cards_count, plant_id) VALUES (4, 'H', 2, 1);
INSERT INTO user_groups (id, name, cards_count, plant_id) VALUES (5, 'L', 2, 4);
INSERT INTO user_groups (id, name, cards_count, plant_id) VALUES (6, 'H', 4, 4);
INSERT INTO user_groups (id, name, cards_count, plant_id) VALUES (7, 'L', 2, 5);
INSERT INTO user_groups (id, name, cards_count, plant_id) VALUES (8, 'H', 4, 5);
INSERT INTO user_groups (id, name, cards_count, plant_id) VALUES (9, 'L', 2, 3);
INSERT INTO user_groups (id, name, cards_count, plant_id) VALUES (10, 'H', 4, 3);


--
-- TOC entry 2250 (class 0 OID 0)
-- Dependencies: 187
-- Name: user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_groups_id_seq', 10, true);





--
-- TOC entry 2223 (class 0 OID 16460)
-- Dependencies: 196
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO users (id, first_name, last_name, ad_account, user_department_id, user_group_id, plant_id, email, role_id, passhash) VALUES (1, 'Анатолий', 'Яшкин', 'anatoly.yashkin', 1, 1, 1, 'anatoly.yashkin@gmail.com', 1, '$2a$10$iO8Gf8Dv4QjP.flnNP8Zzei3cs.cVKsiW5zoYG0n5UnroSmn.fpNe');
INSERT INTO users (id, first_name, last_name, ad_account, user_department_id, user_group_id, plant_id, email, role_id, passhash) VALUES (6, 'Евлампий', 'Моторов', 'e.motor', 1, 1, 1, 'e.motorov@gmail.com', 2, '$2a$10$Ta.uqv7t8fovlw4uVEjKpuzT8nx9gbtAKpOIeT3GQqMkI3Fqdk0dW');


--
-- TOC entry 2252 (class 0 OID 0)
-- Dependencies: 188
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 6, true);

--
-- TOC entry 2216 (class 0 OID 16413)
-- Dependencies: 189
-- Data for Name: cards; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cards (id, card_date, obs_date, obs_department_id, plant_id, selected_fields, comment, user_group_id, selected_categories, user_department_id, user_id) VALUES (62, '2015-09-03 14:33:51.881', '2015-09-01 08:33:31', 4, 4, '{"fields":[2,36]}', 'комментарий', 1, '{"categories":[1,5]}', 1, 1);
INSERT INTO cards (id, card_date, obs_date, obs_department_id, plant_id, selected_fields, comment, user_group_id, selected_categories, user_department_id, user_id) VALUES (63, '2015-09-03 14:35:30.698', '2015-09-03 14:35:24', 5, 4, '{"fields":[5,23]}', NULL, 1, '{"categories":[1,3]}', 1, 1);
INSERT INTO cards (id, card_date, obs_date, obs_department_id, plant_id, selected_fields, comment, user_group_id, selected_categories, user_department_id, user_id) VALUES (64, '2015-09-03 14:44:06.253', '2015-09-01 09:43:45', 4, 4, '{"fields":[12,19]}', 'ssssssss', 1, '{"categories":[1,2]}', 1, 1);
INSERT INTO cards (id, card_date, obs_date, obs_department_id, plant_id, selected_fields, comment, user_group_id, selected_categories, user_department_id, user_id) VALUES (65, '2015-09-03 14:45:40.813', '2015-09-03 14:45:35', 1, 4, '{"fields":[22]}', NULL, 1, '{"categories":[3]}', 1, 1);
INSERT INTO cards (id, card_date, obs_date, obs_department_id, plant_id, selected_fields, comment, user_group_id, selected_categories, user_department_id, user_id) VALUES (66, '2015-09-03 14:45:44.918', '2015-09-03 14:45:42', 1, 4, '{"fields":[10]}', NULL, 1, '{"categories":[1]}', 1, 1);
INSERT INTO cards (id, card_date, obs_date, obs_department_id, plant_id, selected_fields, comment, user_group_id, selected_categories, user_department_id, user_id) VALUES (67, '2015-09-03 14:45:49.001', '2015-09-03 14:45:46', 1, 4, '{"fields":[15,18]}', NULL, 1, '{"categories":[2]}', 1, 1);
INSERT INTO cards (id, card_date, obs_date, obs_department_id, plant_id, selected_fields, comment, user_group_id, selected_categories, user_department_id, user_id) VALUES (68, '2015-09-03 14:46:10.445', '2015-09-03 14:46:07', 1, 4, '{"fields":[15]}', NULL, 1, '{"categories":[2]}', 1, 1);
INSERT INTO cards (id, card_date, obs_date, obs_department_id, plant_id, selected_fields, comment, user_group_id, selected_categories, user_department_id, user_id) VALUES (69, '2015-09-03 14:48:04.41', '2015-09-03 14:48:00', 1, 4, '{"fields":[2,7]}', NULL, 1, '{"categories":[1]}', 1, 1);
INSERT INTO cards (id, card_date, obs_date, obs_department_id, plant_id, selected_fields, comment, user_group_id, selected_categories, user_department_id, user_id) VALUES (70, '2015-09-03 14:58:47.326', '2015-09-03 14:58:41', 1, 4, '{"fields":[]}', NULL, 1, '{"categories":[]}', 1, 1);
INSERT INTO cards (id, card_date, obs_date, obs_department_id, plant_id, selected_fields, comment, user_group_id, selected_categories, user_department_id, user_id) VALUES (71, '2015-09-03 20:15:04.643', '2015-09-01 14:14:26', 4, 4, '{"fields":[35]}', 'ужас!', 1, '{"categories":[5]}', 1, 1);
INSERT INTO cards (id, card_date, obs_date, obs_department_id, plant_id, selected_fields, comment, user_group_id, selected_categories, user_department_id, user_id) VALUES (72, '2015-09-03 20:49:07.709', '2015-09-03 20:49:03', 1, 4, '{"fields":[19,15]}', NULL, 1, '{"categories":[2]}', 1, 1);
INSERT INTO cards (id, card_date, obs_date, obs_department_id, plant_id, selected_fields, comment, user_group_id, selected_categories, user_department_id, user_id) VALUES (73, '2015-09-03 20:50:03.692', '2015-09-03 20:50:01', 1, 4, '{"fields":[]}', NULL, 1, '{"categories":[]}', 1, 1);
INSERT INTO cards (id, card_date, obs_date, obs_department_id, plant_id, selected_fields, comment, user_group_id, selected_categories, user_department_id, user_id) VALUES (74, '2015-09-03 21:53:14.439', '2015-09-03 21:53:08', 1, 4, '{"fields":[]}', NULL, 1, '{"categories":[]}', 1, 1);
INSERT INTO cards (id, card_date, obs_date, obs_department_id, plant_id, selected_fields, comment, user_group_id, selected_categories, user_department_id, user_id) VALUES (75, '2015-09-07 10:35:11.653', '2015-09-07 10:34:56', 1, 4, '{"fields":[38]}', NULL, 1, '{"categories":[5]}', 1, 1);
INSERT INTO cards (id, card_date, obs_date, obs_department_id, plant_id, selected_fields, comment, user_group_id, selected_categories, user_department_id, user_id) VALUES (76, '2016-01-26 08:29:31.29', '2016-01-26 10:29:06', 1, 1, '{"fields":[15]}', 'ыц', 1, '{"categories":[2]}', 1, 1);
INSERT INTO cards (id, card_date, obs_date, obs_department_id, plant_id, selected_fields, comment, user_group_id, selected_categories, user_department_id, user_id) VALUES (77, '2016-01-27 15:36:38.272', '2016-01-25 13:36:19', 4, 1, '{"fields":[5,33]}', 'Тест, тест', 1, '{"categories":[1,4]}', 1, 1);
INSERT INTO cards (id, card_date, obs_date, obs_department_id, plant_id, selected_fields, comment, user_group_id, selected_categories, user_department_id, user_id) VALUES (78, '2016-01-28 14:46:14.101', '2016-01-28 14:46:01', 4, 1, '{"fields":[38,35,39]}', 'урааа', 1, '{"categories":[3,5]}', 1, 1);
INSERT INTO cards (id, card_date, obs_date, obs_department_id, plant_id, selected_fields, comment, user_group_id, selected_categories, user_department_id, user_id) VALUES (79, '2016-01-28 14:46:33.299', '2016-01-28 14:46:21', 5, 1, '{"fields":[]}', 'еще раз ура', 1, '{"categories":[1,3,4,2]}', 1, 1);
INSERT INTO cards (id, card_date, obs_date, obs_department_id, plant_id, selected_fields, comment, user_group_id, selected_categories, user_department_id, user_id) VALUES (80, '2016-01-28 14:48:00.03', '2016-01-28 14:47:54', 1, 1, '{"fields":[]}', '', 1, '{"categories":[2]}', 1, 1);
INSERT INTO cards (id, card_date, obs_date, obs_department_id, plant_id, selected_fields, comment, user_group_id, selected_categories, user_department_id, user_id) VALUES (115, '2016-04-05 11:39:00.382', '2016-04-05 11:38:52', 1, 1, '{"fields":[14]}', '{"comment":"sw"}', 1, '{"categories":[2]}', 1, 1);
INSERT INTO cards (id, card_date, obs_date, obs_department_id, plant_id, selected_fields, comment, user_group_id, selected_categories, user_department_id, user_id) VALUES (116, '2016-04-05 11:40:18.397', '2016-04-05 11:40:11', 4, 1, '{"fields":[4]}', '"sw"', 1, '{"categories":[1]}', 1, 1);
INSERT INTO cards (id, card_date, obs_date, obs_department_id, plant_id, selected_fields, comment, user_group_id, selected_categories, user_department_id, user_id) VALUES (117, '2016-04-05 11:43:47.649', '2016-04-05 11:43:36', 4, 1, '{"fields":[14,21,15,2,12,10]}', 'привет', 1, '{"categories":[2,1]}', 1, 1);
INSERT INTO cards (id, card_date, obs_date, obs_department_id, plant_id, selected_fields, comment, user_group_id, selected_categories, user_department_id, user_id) VALUES (118, '2016-04-05 11:50:21.446', '2016-04-04 11:50:06', 5, 1, '{"fields":[10,2,38,36]}', 'раз раз', 1, '{"categories":[1,5]}', 1, 1);
INSERT INTO cards (id, card_date, obs_date, obs_department_id, plant_id, selected_fields, comment, user_group_id, selected_categories, user_department_id, user_id) VALUES (119, '2016-04-05 12:09:09.146', '2016-04-04 12:08:51', 1, 1, '{"fields":[4,18,19,26]}', 'одын, одны', 1, '{"categories":[1,2,3]}', 1, 1);
INSERT INTO cards (id, card_date, obs_date, obs_department_id, plant_id, selected_fields, comment, user_group_id, selected_categories, user_department_id, user_id) VALUES (120, '2016-04-05 12:13:16.432', '2016-04-05 12:13:03', 4, 1, '{"fields":[12,31]}', 'тададада', 1, '{"categories":[1,4]}', 1, 1);
INSERT INTO cards (id, card_date, obs_date, obs_department_id, plant_id, selected_fields, comment, user_group_id, selected_categories, user_department_id, user_id) VALUES (122, '2016-04-21 11:21:09.859', '2016-04-19 10:20:56', 1, 1, '{"fields":[20,13]}', 'sw', 1, '{"categories":[2]}', 1, 1);
INSERT INTO cards (id, card_date, obs_date, obs_department_id, plant_id, selected_fields, comment, user_group_id, selected_categories, user_department_id, user_id) VALUES (123, '2016-04-21 11:24:29.618', '2016-04-19 11:24:20', 4, 1, '{"fields":[7]}', 'привет', 1, '{"categories":[1]}', 1, 1);
INSERT INTO cards (id, card_date, obs_date, obs_department_id, plant_id, selected_fields, comment, user_group_id, selected_categories, user_department_id, user_id) VALUES (124, '2016-04-21 11:49:29.525', '2016-04-21 11:49:18', 4, 1, '{"fields":[2,26]}', 'новая карта', 1, '{"categories":[1,3]}', 1, 1);
INSERT INTO cards (id, card_date, obs_date, obs_department_id, plant_id, selected_fields, comment, user_group_id, selected_categories, user_department_id, user_id) VALUES (125, '2016-04-22 07:36:21.638', '2016-04-20 07:36:08', 5, 1, '{"fields":[5,2]}', 'еще карта', 1, '{"categories":[1]}', 1, 1);
INSERT INTO cards (id, card_date, obs_date, obs_department_id, plant_id, selected_fields, comment, user_group_id, selected_categories, user_department_id, user_id) VALUES (126, '2016-04-22 10:04:12.272', '2016-04-22 10:03:58', 1, 1, '{"fields":[2,5,20,30]}', 'sw', 1, '{"categories":[1,2,3]}', 1, 1);
INSERT INTO cards (id, card_date, obs_date, obs_department_id, plant_id, selected_fields, comment, user_group_id, selected_categories, user_department_id, user_id) VALUES (121, '2016-04-18 13:50:19.313', '2016-04-05 13:50:07', 4, 1, '{"fields":[5,14]}', 'тест бд', 1, '{"categories":[1,2]}', 1, 1);
INSERT INTO cards (id, card_date, obs_date, obs_department_id, plant_id, selected_fields, comment, user_group_id, selected_categories, user_department_id, user_id) VALUES (127, '2016-04-22 10:10:35.07', '2016-04-22 10:10:27', 4, 1, '{"fields":[7]}', 'еще карта', 1, '{"categories":[1]}', 1, 1);
INSERT INTO cards (id, card_date, obs_date, obs_department_id, plant_id, selected_fields, comment, user_group_id, selected_categories, user_department_id, user_id) VALUES (128, '2016-04-22 10:20:34.04', '2016-04-22 10:20:21', 4, 1, '{"fields":[5,32]}', 'Первая карта', 1, '{"categories":[1,4]}', 1, 6);


--
-- TOC entry 2243 (class 0 OID 0)
-- Dependencies: 180
-- Name: cards_sec; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cards_sec', 5, true);


--
-- TOC entry 2244 (class 0 OID 0)
-- Dependencies: 181
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hibernate_sequence', 128, true);
