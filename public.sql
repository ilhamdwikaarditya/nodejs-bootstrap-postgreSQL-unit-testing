/*
 Navicat Premium Data Transfer

 Source Server         : postgre
 Source Server Type    : PostgreSQL
 Source Server Version : 100003
 Source Host           : localhost:5432
 Source Catalog        : crudnodejs
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 100003
 File Encoding         : 65001

 Date: 20/09/2019 02:22:22
*/


-- ----------------------------
-- Sequence structure for sequence_bahan_makanan
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sequence_bahan_makanan";
CREATE SEQUENCE "public"."sequence_bahan_makanan" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 10
CACHE 1;

-- ----------------------------
-- Sequence structure for sequence_kategori_makanan
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sequence_kategori_makanan";
CREATE SEQUENCE "public"."sequence_kategori_makanan" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 2
CACHE 1;

-- ----------------------------
-- Sequence structure for sequence_resep_makanan
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sequence_resep_makanan";
CREATE SEQUENCE "public"."sequence_resep_makanan" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 2
CACHE 1;

-- ----------------------------
-- Table structure for bahan_makanan
-- ----------------------------
DROP TABLE IF EXISTS "public"."bahan_makanan";
CREATE TABLE "public"."bahan_makanan" (
  "id_bahan" int2 NOT NULL DEFAULT nextval('sequence_bahan_makanan'::regclass),
  "nama_bahan" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "jumlah" varchar(100) COLLATE "pg_catalog"."default",
  "satuan" varchar(100) COLLATE "pg_catalog"."default",
  "id_resep" int2 NOT NULL
)
;

-- ----------------------------
-- Records of bahan_makanan
-- ----------------------------
INSERT INTO "public"."bahan_makanan" VALUES (2, 'telor', '2', 'buah', 1);
INSERT INTO "public"."bahan_makanan" VALUES (3, 'minyak', '100', 'mililiter', 1);
INSERT INTO "public"."bahan_makanan" VALUES (4, 'bawang merah', '5', 'siung', 1);
INSERT INTO "public"."bahan_makanan" VALUES (5, 'bawang putih', '5', 'siung', 1);
INSERT INTO "public"."bahan_makanan" VALUES (6, 'ayam', '1', 'potong', 1);
INSERT INTO "public"."bahan_makanan" VALUES (7, 'sayur casim', '3', 'helai', 1);
INSERT INTO "public"."bahan_makanan" VALUES (8, 'kecap', '5', 'sendok makan', 1);
INSERT INTO "public"."bahan_makanan" VALUES (9, 'garam', '2', 'sendok teh', 1);
INSERT INTO "public"."bahan_makanan" VALUES (1, 'nasi putih', '1', 'piring', 1);

-- ----------------------------
-- Table structure for kategori_makanan
-- ----------------------------
DROP TABLE IF EXISTS "public"."kategori_makanan";
CREATE TABLE "public"."kategori_makanan" (
  "id_kategori" int2 NOT NULL DEFAULT nextval('sequence_kategori_makanan'::regclass),
  "nama_kategori" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "id_resep" int2 NOT NULL
)
;

-- ----------------------------
-- Records of kategori_makanan
-- ----------------------------
INSERT INTO "public"."kategori_makanan" VALUES (1, 'main coursex', 1);

-- ----------------------------
-- Table structure for resep_makanan
-- ----------------------------
DROP TABLE IF EXISTS "public"."resep_makanan";
CREATE TABLE "public"."resep_makanan" (
  "id_resep" int2 NOT NULL DEFAULT nextval('sequence_resep_makanan'::regclass),
  "nama_resep" varchar(100) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of resep_makanan
-- ----------------------------
INSERT INTO "public"."resep_makanan" VALUES (1, 'nasi goreng');
INSERT INTO "public"."resep_makanan" VALUES (2, 'bubur');
INSERT INTO "public"."resep_makanan" VALUES (3, 'gudeg');

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."sequence_bahan_makanan"', 22, true);
SELECT setval('"public"."sequence_kategori_makanan"', 9, true);
SELECT setval('"public"."sequence_resep_makanan"', 4, true);

-- ----------------------------
-- Primary Key structure for table bahan_makanan
-- ----------------------------
ALTER TABLE "public"."bahan_makanan" ADD CONSTRAINT "bahan_makanan_pkey" PRIMARY KEY ("id_bahan");

-- ----------------------------
-- Primary Key structure for table kategori_makanan
-- ----------------------------
ALTER TABLE "public"."kategori_makanan" ADD CONSTRAINT "kategori_makanan_pkey" PRIMARY KEY ("id_kategori");

-- ----------------------------
-- Primary Key structure for table resep_makanan
-- ----------------------------
ALTER TABLE "public"."resep_makanan" ADD CONSTRAINT "resep_makanan_pkey" PRIMARY KEY ("id_resep");

-- ----------------------------
-- Foreign Keys structure for table bahan_makanan
-- ----------------------------
ALTER TABLE "public"."bahan_makanan" ADD CONSTRAINT "bahan_makanan_id_resep_fkey" FOREIGN KEY ("id_resep") REFERENCES "resep_makanan" ("id_resep") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table kategori_makanan
-- ----------------------------
ALTER TABLE "public"."kategori_makanan" ADD CONSTRAINT "kategori_makanan_id_resep_fkey" FOREIGN KEY ("id_resep") REFERENCES "resep_makanan" ("id_resep") ON DELETE NO ACTION ON UPDATE NO ACTION;
