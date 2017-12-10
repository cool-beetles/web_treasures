CREATE TABLE "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "types" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "addresses" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "street" varchar DEFAULT NULL, "city" varchar DEFAULT NULL, "zip_code" varchar DEFAULT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "storages" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar DEFAULT NULL, "address_id" integer DEFAULT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "owner_id" integer);
CREATE INDEX "index_storages_on_address_id" ON "storages" ("address_id");
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "first_name" varchar DEFAULT NULL, "last_name" varchar DEFAULT NULL, "age" integer DEFAULT NULL, "address_id" integer DEFAULT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_users_on_address_id" ON "users" ("address_id");
CREATE TABLE "rentals" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer DEFAULT NULL, "treasure_id" integer DEFAULT NULL, "start_date" date DEFAULT NULL, "due_date" date DEFAULT NULL, "return_date" date DEFAULT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_rentals_on_user_id" ON "rentals" ("user_id");
CREATE INDEX "index_rentals_on_treasure_id" ON "rentals" ("treasure_id");
CREATE TABLE "treasures" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "owner_id" integer DEFAULT NULL, "type_id" integer DEFAULT NULL, "storage_id" integer DEFAULT NULL, "trashed" boolean DEFAULT NULL, "title" varchar DEFAULT NULL, "description" varchar DEFAULT NULL, "special_note" varchar DEFAULT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_treasures_on_owner_id" ON "treasures" ("owner_id");
CREATE INDEX "index_treasures_on_type_id" ON "treasures" ("type_id");
CREATE INDEX "index_treasures_on_storage_id" ON "treasures" ("storage_id");
CREATE INDEX "index_storages_on_owner_id" ON "storages" ("owner_id");
INSERT INTO "schema_migrations" (version) VALUES
('20171128102235'),
('20171128102438'),
('20171128102624'),
('20171128103736'),
('20171128104403'),
('20171128105818'),
('20171129144935'),
('20171129145123'),
('20171129145212'),
('20171129145309'),
('20171201103626'),
('20171201104505'),
('20171201104828'),
('20171201105058'),
('20171201105235'),
('20171201105406'),
('20171201105555'),
('20171201105807'),
('20171201105923'),
('20171209141451'),
('20171210174435');


