-- Auto-generated from schema-map-postgres.yaml (map@sha1:8C4F2BC1C4D22EE71E27B5A7968C71E32D8D884D)
-- engine: postgres
-- table:  merkle_roots

CREATE INDEX IF NOT EXISTS idx_merkle_subject ON merkle_roots (subject_table);

CREATE INDEX IF NOT EXISTS idx_merkle_created ON merkle_roots (created_at);
