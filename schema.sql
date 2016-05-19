CREATE TABLE schema_migrations (id BIGINT UNIQUE NOT NULL);
CREATE TABLE documents (
id    INTEGER PRIMARY KEY AUTOINCREMENT,
name  VARCHAR(512),
project_id INTEGER NOT NULL,
FOREIGN KEY(project_id) REFERENCES projects(id) ON DELETE CASCADE
);
CREATE TABLE sentences (
id      INTEGER PRIMARY KEY AUTOINCREMENT,
tokens  TEXT,
tags    TEXT,
document_id INTEGER NOT NULL, num_edits INTEGER DEFAULT 0,
FOREIGN KEY(document_id) REFERENCES documents(id) ON DELETE CASCADE
);
CREATE TABLE tagsets (
id              INTEGER PRIMARY KEY AUTOINCREMENT,
name            VARCHAR(512) NOT NULL UNIQUE,
tags            TEXT NOT NULL,
empty_tag       VARCHAR(32) NOT NULL,
documentation   TEXT
);
CREATE TABLE projects(
id          INTEGER PRIMARY KEY AUTOINCREMENT,
name        VARCHAR(512) NOT NULL UNIQUE,
tagset_id   INTEGER NOT NULL,
description TEXT,
FOREIGN KEY(tagset_id) REFERENCES tagsets(id)
);
