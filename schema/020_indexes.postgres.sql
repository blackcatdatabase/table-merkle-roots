-- Auto-generated from schema-map-postgres.yaml (map@94ebe6c)
-- engine: postgres
-- table:  merkle_roots

CREATE INDEX IF NOT EXISTS idx_merkle_subject ON merkle_roots (subject_table);

CREATE INDEX IF NOT EXISTS idx_merkle_created ON merkle_roots (created_at);
