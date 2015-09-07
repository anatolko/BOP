/*
Navicat PGSQL Data Transfer

Source Server         : PostgreSQL
Source Server Version : 90404
Source Host           : localhost:5432
Source Database       : RULIPBOP
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90404
File Encoding         : 65001

Date: 2015-09-07 10:37:09
*/


-- ----------------------------
-- Sequence structure for cards_sec
-- ----------------------------
DROP SEQUENCE "cards_sec";
CREATE SEQUENCE "cards_sec"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 5
 CACHE 1;
SELECT setval('"public"."cards_sec"', 5, true);

-- ----------------------------
-- Sequence structure for hibernate_sequence
-- ----------------------------
DROP SEQUENCE "hibernate_sequence";
CREATE SEQUENCE "hibernate_sequence"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 75
 CACHE 1;
SELECT setval('"public"."hibernate_sequence"', 75, true);

-- ----------------------------
-- Sequence structure for obs_cat_id
-- ----------------------------
DROP SEQUENCE "obs_cat_id";
CREATE SEQUENCE "obs_cat_id"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 5
 CACHE 1;
SELECT setval('"public"."obs_cat_id"', 5, true);

-- ----------------------------
-- Sequence structure for obs_dep_sec
-- ----------------------------
DROP SEQUENCE "obs_dep_sec";
CREATE SEQUENCE "obs_dep_sec"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 5
 CACHE 1;
SELECT setval('"public"."obs_dep_sec"', 5, true);

-- ----------------------------
-- Sequence structure for obs_fields_id_seq
-- ----------------------------
DROP SEQUENCE "obs_fields_id_seq";
CREATE SEQUENCE "obs_fields_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 39
 CACHE 1;
SELECT setval('"public"."obs_fields_id_seq"', 39, true);

-- ----------------------------
-- Sequence structure for plants_sec
-- ----------------------------
DROP SEQUENCE "plants_sec";
CREATE SEQUENCE "plants_sec"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 5
 CACHE 1;
SELECT setval('"public"."plants_sec"', 5, true);

-- ----------------------------
-- Sequence structure for user_departments_id_seq
-- ----------------------------
DROP SEQUENCE "user_departments_id_seq";
CREATE SEQUENCE "user_departments_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;
SELECT setval('"public"."user_departments_id_seq"', 1, true);

-- ----------------------------
-- Sequence structure for user_groups_id_seq
-- ----------------------------
DROP SEQUENCE "user_groups_id_seq";
CREATE SEQUENCE "user_groups_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 10
 CACHE 1;
SELECT setval('"public"."user_groups_id_seq"', 10, true);

-- ----------------------------
-- Sequence structure for users_id_seq
-- ----------------------------
DROP SEQUENCE "users_id_seq";
CREATE SEQUENCE "users_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;
SELECT setval('"public"."users_id_seq"', 1, true);

-- ----------------------------
-- Table structure for cards
-- ----------------------------
DROP TABLE IF EXISTS "cards";
CREATE TABLE "cards" (
"id" int4 DEFAULT nextval('cards_sec'::regclass) NOT NULL,
"card_date" timestamp(6) NOT NULL,
"obs_date" timestamp(6) NOT NULL,
"ad_account" varchar(255) COLLATE "default" NOT NULL,
"user_department" varchar(255) COLLATE "default" NOT NULL,
"obs_department_id" int4 NOT NULL,
"plant_id" int4 NOT NULL,
"selected_fields" json,
"comment" varchar(1024) COLLATE "default",
"user_group_id" int4 NOT NULL,
"selected_categories" json
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of cards
-- ----------------------------
BEGIN;
INSERT INTO "cards" VALUES ('62', '2015-09-03 14:33:51.881', '2015-09-01 08:33:31', 'ayashkin', 'HR', '4', '4', '{"fields":[2,36]}', 'комментарий', '1', '{"categories":[1,5]}');
INSERT INTO "cards" VALUES ('63', '2015-09-03 14:35:30.698', '2015-09-03 14:35:24', 'ayashkin', 'HR', '5', '4', '{"fields":[5,23]}', null, '1', '{"categories":[1,3]}');
INSERT INTO "cards" VALUES ('64', '2015-09-03 14:44:06.253', '2015-09-01 09:43:45', 'ayashkin', 'HR', '4', '4', '{"fields":[12,19]}', 'ssssssss', '1', '{"categories":[1,2]}');
INSERT INTO "cards" VALUES ('65', '2015-09-03 14:45:40.813', '2015-09-03 14:45:35', 'ayashkin', 'HR', '1', '4', '{"fields":[22]}', null, '1', '{"categories":[3]}');
INSERT INTO "cards" VALUES ('66', '2015-09-03 14:45:44.918', '2015-09-03 14:45:42', 'ayashkin', 'HR', '1', '4', '{"fields":[10]}', null, '1', '{"categories":[1]}');
INSERT INTO "cards" VALUES ('67', '2015-09-03 14:45:49.001', '2015-09-03 14:45:46', 'ayashkin', 'HR', '1', '4', '{"fields":[15,18]}', null, '1', '{"categories":[2]}');
INSERT INTO "cards" VALUES ('68', '2015-09-03 14:46:10.445', '2015-09-03 14:46:07', 'ayashkin', 'HR', '1', '4', '{"fields":[15]}', null, '1', '{"categories":[2]}');
INSERT INTO "cards" VALUES ('69', '2015-09-03 14:48:04.41', '2015-09-03 14:48:00', 'ayashkin', 'HR', '1', '4', '{"fields":[2,7]}', null, '1', '{"categories":[1]}');
INSERT INTO "cards" VALUES ('70', '2015-09-03 14:58:47.326', '2015-09-03 14:58:41', 'ayashkin', 'HR', '1', '4', '{"fields":[]}', null, '1', '{"categories":[]}');
INSERT INTO "cards" VALUES ('71', '2015-09-03 20:15:04.643', '2015-09-01 14:14:26', 'ayashkin', 'HR', '4', '4', '{"fields":[35]}', 'ужас!', '1', '{"categories":[5]}');
INSERT INTO "cards" VALUES ('72', '2015-09-03 20:49:07.709', '2015-09-03 20:49:03', 'ayashkin', 'HR', '1', '4', '{"fields":[19,15]}', null, '1', '{"categories":[2]}');
INSERT INTO "cards" VALUES ('73', '2015-09-03 20:50:03.692', '2015-09-03 20:50:01', 'ayashkin', 'HR', '1', '4', '{"fields":[]}', null, '1', '{"categories":[]}');
INSERT INTO "cards" VALUES ('74', '2015-09-03 21:53:14.439', '2015-09-03 21:53:08', 'ayashkin', 'HR', '1', '4', '{"fields":[]}', null, '1', '{"categories":[]}');
INSERT INTO "cards" VALUES ('75', '2015-09-07 10:35:11.653', '2015-09-07 10:34:56', 'ayashkin', 'HR', '1', '4', '{"fields":[38]}', null, '1', '{"categories":[5]}');
COMMIT;

-- ----------------------------
-- Table structure for obs_categories
-- ----------------------------
DROP TABLE IF EXISTS "obs_categories";
CREATE TABLE "obs_categories" (
"id" int4 DEFAULT nextval('obs_cat_id'::regclass) NOT NULL,
"name" json NOT NULL,
"plant_id" int4 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of obs_categories
-- ----------------------------
BEGIN;
INSERT INTO "obs_categories" VALUES ('1', '{"ru":"Средства индивидуальной защиты","en":"Personal protective equipment"}', '1');
INSERT INTO "obs_categories" VALUES ('2', '{"ru":"Реакция сотрудника","en":"Employee reaction"}', '1');
INSERT INTO "obs_categories" VALUES ('3', '{"ru":"Положение, поведение сотрудника","en":"tmp"}', '1');
INSERT INTO "obs_categories" VALUES ('4', '{"ru":"Инструменты и оборудование","en":"tmp"}', '1');
INSERT INTO "obs_categories" VALUES ('5', '{"ru":"Процедуры порядка и чистоты","en":"tmp"}', '1');
COMMIT;

-- ----------------------------
-- Table structure for obs_departments
-- ----------------------------
DROP TABLE IF EXISTS "obs_departments";
CREATE TABLE "obs_departments" (
"id" int4 DEFAULT nextval('obs_dep_sec'::regclass) NOT NULL,
"name" json,
"plant_id" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of obs_departments
-- ----------------------------
BEGIN;
INSERT INTO "obs_departments" VALUES ('1', '{"ru":"Столовая","en":"Canteen"}', '1');
INSERT INTO "obs_departments" VALUES ('4', '{"ru":"Участок мокрого волочения","en":"Wet wire drawning"}', '1');
INSERT INTO "obs_departments" VALUES ('5', '{"ru":"Участок навивки канатов","en":"Bunching"}', '1');
COMMIT;

-- ----------------------------
-- Table structure for obs_fields
-- ----------------------------
DROP TABLE IF EXISTS "obs_fields";
CREATE TABLE "obs_fields" (
"id" int4 DEFAULT nextval('obs_fields_id_seq'::regclass) NOT NULL,
"cat_id" int4 NOT NULL,
"name" json NOT NULL,
"description" json
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of obs_fields
-- ----------------------------
BEGIN;
INSERT INTO "obs_fields" VALUES ('2', '1', '{"ru":"Голова","en":"Head"}', null);
INSERT INTO "obs_fields" VALUES ('4', '1', '{"ru":"Глаза и лицо","en":"Eyes and face"}', null);
INSERT INTO "obs_fields" VALUES ('5', '1', '{"ru":"Органы дыхания","en":"Respiratory organs"}', null);
INSERT INTO "obs_fields" VALUES ('7', '1', '{"ru":"Уши","en":"Ears"}', null);
INSERT INTO "obs_fields" VALUES ('9', '1', '{"ru":"Руки","en":"Arms"}', null);
INSERT INTO "obs_fields" VALUES ('10', '1', '{"ru":"Туловище","en":"Body"}', null);
INSERT INTO "obs_fields" VALUES ('12', '1', '{"ru":"Ноги и ступни","en":"Legs"}', null);
INSERT INTO "obs_fields" VALUES ('13', '2', '{"ru":"Не надевает СИЗ","en":"Not wearing PPE"}', null);
INSERT INTO "obs_fields" VALUES ('14', '2', '{"ru":"Не меняет положение в работе","en":"tmp"}', null);
INSERT INTO "obs_fields" VALUES ('15', '2', '{"ru":"Прекращает работу","en":"tmp"}', null);
INSERT INTO "obs_fields" VALUES ('16', '2', '{"ru":"Не проводт блокировку/маркировку/заземление","en":"tmp"}', null);
INSERT INTO "obs_fields" VALUES ('18', '2', '{"ru":"Не меняет оборудование или инструмент","en":"tmp"}', null);
INSERT INTO "obs_fields" VALUES ('19', '2', '{"ru":"Работает в часах, кольцах и т.п.","en":"tmp"}', null);
INSERT INTO "obs_fields" VALUES ('20', '2', '{"ru":"Не убраны длинные волосы","en":"tmp"}', null);
INSERT INTO "obs_fields" VALUES ('21', '2', '{"ru":"На производстве используются мобильные телефоны","en":"tmp"}', null);
INSERT INTO "obs_fields" VALUES ('22', '3', '{"ru":"Находится между/в/на объектаъ","en":"tmp"}', null);
INSERT INTO "obs_fields" VALUES ('23', '3', '{"ru":"Бьет по объекту/объект попадает по нему","en":"tmp"}', null);
INSERT INTO "obs_fields" VALUES ('24', '3', '{"ru":"Работа на высоте","en":"tmp"}', null);
INSERT INTO "obs_fields" VALUES ('25', '3', '{"ru":"Контакт с высокой температурой","en":"tmp"}', null);
INSERT INTO "obs_fields" VALUES ('26', '3', '{"ru":"Работа с электрооборудованием","en":"tmp"}', null);
INSERT INTO "obs_fields" VALUES ('27', '3', '{"ru":"Работа с химвеществами","en":"tmp"}', null);
INSERT INTO "obs_fields" VALUES ('28', '3', '{"ru":"Повторяющиеся движения","en":"tmp"}', null);
INSERT INTO "obs_fields" VALUES ('30', '3', '{"ru":"Опасное положение","en":"tmp"}', null);
INSERT INTO "obs_fields" VALUES ('31', '4', '{"ru":"Не соответствует выполняемой работе","en":"tmp"}', null);
INSERT INTO "obs_fields" VALUES ('32', '4', '{"ru":"Неправильное использование","en":"tmp"}', null);
INSERT INTO "obs_fields" VALUES ('33', '4', '{"ru":"Непригодно для работы","en":"tmp"}', null);
INSERT INTO "obs_fields" VALUES ('35', '5', '{"ru":"Непригодные","en":"tmp"}', null);
INSERT INTO "obs_fields" VALUES ('36', '5', '{"ru":"Невыполненные","en":"tmp"}', null);
INSERT INTO "obs_fields" VALUES ('38', '5', '{"ru":"Неизвестные","en":"tmp"}', null);
INSERT INTO "obs_fields" VALUES ('39', '5', '{"ru":"Неустановленные","en":"tmp"}', null);
COMMIT;

-- ----------------------------
-- Table structure for plants
-- ----------------------------
DROP TABLE IF EXISTS "plants";
CREATE TABLE "plants" (
"id" int4 DEFAULT nextval('plants_sec'::regclass) NOT NULL,
"plant_code" varchar(255) COLLATE "default" NOT NULL,
"description" varchar(255) COLLATE "default",
"parent_plant_id" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of plants
-- ----------------------------
BEGIN;
INSERT INTO "plants" VALUES ('1', 'RULIP', 'Lipetsk plant', null);
INSERT INTO "plants" VALUES ('2', 'SKHLO', 'Slovakia Hlohovec', null);
INSERT INTO "plants" VALUES ('3', 'SKSLA', 'Slovakia Sladko', null);
INSERT INTO "plants" VALUES ('4', 'RR', 'Hlohovec subsite', '2');
INSERT INTO "plants" VALUES ('5', 'IP', 'Hlohovec subsite', '2');
COMMIT;

-- ----------------------------
-- Table structure for user_departments
-- ----------------------------
DROP TABLE IF EXISTS "user_departments";
CREATE TABLE "user_departments" (
"id" int4 DEFAULT nextval('user_departments_id_seq'::regclass) NOT NULL,
"name" json NOT NULL,
"plant_id" int4 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of user_departments
-- ----------------------------
BEGIN;
INSERT INTO "user_departments" VALUES ('1', '{"ru":"Отдел кадров","en":"HR"}', '1');
COMMIT;

-- ----------------------------
-- Table structure for user_groups
-- ----------------------------
DROP TABLE IF EXISTS "user_groups";
CREATE TABLE "user_groups" (
"id" int4 DEFAULT nextval('user_groups_id_seq'::regclass) NOT NULL,
"name" varchar(35) COLLATE "default" NOT NULL,
"cards_count" int4 DEFAULT 0 NOT NULL,
"plant_id" int4 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of user_groups
-- ----------------------------
BEGIN;
INSERT INTO "user_groups" VALUES ('1', 'L', '1', '1');
INSERT INTO "user_groups" VALUES ('4', 'H', '2', '1');
INSERT INTO "user_groups" VALUES ('5', 'L', '2', '4');
INSERT INTO "user_groups" VALUES ('6', 'H', '4', '4');
INSERT INTO "user_groups" VALUES ('7', 'L', '2', '5');
INSERT INTO "user_groups" VALUES ('8', 'H', '4', '5');
INSERT INTO "user_groups" VALUES ('9', 'L', '2', '3');
INSERT INTO "user_groups" VALUES ('10', 'H', '4', '3');
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS "users";
CREATE TABLE "users" (
"id" int4 DEFAULT nextval('users_id_seq'::regclass) NOT NULL,
"first_name" varchar(255) COLLATE "default" NOT NULL,
"last_name" varchar(255) COLLATE "default",
"ad_account" varchar(255) COLLATE "default" NOT NULL,
"user_department_id" int4 NOT NULL,
"user_group_id" int4 NOT NULL,
"plant_id" int4 NOT NULL,
"admin" bool DEFAULT false NOT NULL,
"moderator" bool DEFAULT false NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO "users" VALUES ('1', 'Анатолий', 'Яшкин', 'anatoly.yashkin', '1', '1', '1', 't', 'f');
COMMIT;

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------
ALTER SEQUENCE "cards_sec" OWNED BY "cards"."id";
ALTER SEQUENCE "obs_cat_id" OWNED BY "obs_categories"."id";
ALTER SEQUENCE "obs_dep_sec" OWNED BY "obs_departments"."id";
ALTER SEQUENCE "obs_fields_id_seq" OWNED BY "obs_fields"."id";
ALTER SEQUENCE "plants_sec" OWNED BY "plants"."id";
ALTER SEQUENCE "user_departments_id_seq" OWNED BY "user_departments"."id";
ALTER SEQUENCE "user_groups_id_seq" OWNED BY "user_groups"."id";
ALTER SEQUENCE "users_id_seq" OWNED BY "users"."id";

-- ----------------------------
-- Uniques structure for table cards
-- ----------------------------
ALTER TABLE "cards" ADD UNIQUE ("id");

-- ----------------------------
-- Primary Key structure for table cards
-- ----------------------------
ALTER TABLE "cards" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table obs_categories
-- ----------------------------
ALTER TABLE "obs_categories" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table obs_departments
-- ----------------------------
ALTER TABLE "obs_departments" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table obs_fields
-- ----------------------------
ALTER TABLE "obs_fields" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table plants
-- ----------------------------
ALTER TABLE "plants" ADD UNIQUE ("id");

-- ----------------------------
-- Primary Key structure for table plants
-- ----------------------------
ALTER TABLE "plants" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table user_departments
-- ----------------------------
ALTER TABLE "user_departments" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table user_groups
-- ----------------------------
ALTER TABLE "user_groups" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table users
-- ----------------------------
ALTER TABLE "users" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Key structure for table "cards"
-- ----------------------------
ALTER TABLE "cards" ADD FOREIGN KEY ("user_group_id") REFERENCES "user_groups" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "cards" ADD FOREIGN KEY ("user_group_id") REFERENCES "user_groups" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "cards" ADD FOREIGN KEY ("plant_id") REFERENCES "plants" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "cards" ADD FOREIGN KEY ("obs_department_id") REFERENCES "obs_departments" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "cards" ADD FOREIGN KEY ("obs_department_id") REFERENCES "obs_departments" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "cards" ADD FOREIGN KEY ("plant_id") REFERENCES "plants" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "obs_categories"
-- ----------------------------
ALTER TABLE "obs_categories" ADD FOREIGN KEY ("plant_id") REFERENCES "plants" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "obs_categories" ADD FOREIGN KEY ("plant_id") REFERENCES "plants" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "obs_departments"
-- ----------------------------
ALTER TABLE "obs_departments" ADD FOREIGN KEY ("plant_id") REFERENCES "plants" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "obs_departments" ADD FOREIGN KEY ("plant_id") REFERENCES "plants" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "obs_fields"
-- ----------------------------
ALTER TABLE "obs_fields" ADD FOREIGN KEY ("cat_id") REFERENCES "obs_categories" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "obs_fields" ADD FOREIGN KEY ("cat_id") REFERENCES "obs_categories" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "plants"
-- ----------------------------
ALTER TABLE "plants" ADD FOREIGN KEY ("parent_plant_id") REFERENCES "plants" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "plants" ADD FOREIGN KEY ("parent_plant_id") REFERENCES "plants" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "plants" ADD FOREIGN KEY ("id") REFERENCES "plants" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "user_departments"
-- ----------------------------
ALTER TABLE "user_departments" ADD FOREIGN KEY ("plant_id") REFERENCES "plants" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "user_departments" ADD FOREIGN KEY ("plant_id") REFERENCES "plants" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "user_groups"
-- ----------------------------
ALTER TABLE "user_groups" ADD FOREIGN KEY ("plant_id") REFERENCES "plants" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "user_groups" ADD FOREIGN KEY ("plant_id") REFERENCES "plants" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "users"
-- ----------------------------
ALTER TABLE "users" ADD FOREIGN KEY ("plant_id") REFERENCES "plants" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "users" ADD FOREIGN KEY ("plant_id") REFERENCES "plants" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "users" ADD FOREIGN KEY ("user_group_id") REFERENCES "user_groups" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "users" ADD FOREIGN KEY ("user_department_id") REFERENCES "user_departments" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "users" ADD FOREIGN KEY ("user_department_id") REFERENCES "user_departments" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "users" ADD FOREIGN KEY ("user_group_id") REFERENCES "user_groups" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
