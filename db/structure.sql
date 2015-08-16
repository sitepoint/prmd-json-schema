CREATE TABLE "schema_migrations" ("version" varchar NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE TABLE "accounts" ("id" binary(16) PRIMARY KEY, "email" varchar, "encrypted_password" varchar, "password_salt" varchar NOT NULL, "jti" varchar, "reset_password_token" varchar, "refresh_token" varchar, "reset_password_sent_at" datetime, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO schema_migrations (version) VALUES ('20150804133709');

