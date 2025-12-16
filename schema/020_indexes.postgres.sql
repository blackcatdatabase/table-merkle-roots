-- Auto-generated from schema-map-postgres.yaml (map@sha1:FAEA49A5D5F8FAAD9F850D0F430ED451C5C1D707)
-- engine: postgres
-- table:  merkle_roots

CREATE INDEX IF NOT EXISTS idx_merkle_subject ON merkle_roots (subject_table);

CREATE INDEX IF NOT EXISTS idx_merkle_created ON merkle_roots (created_at);
