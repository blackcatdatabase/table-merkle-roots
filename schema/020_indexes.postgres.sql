-- Auto-generated from schema-map-postgres.yaml (map@sha1:6D9B52237D942B2B3855FD0F5500331B935A7C62)
-- engine: postgres
-- table:  merkle_roots

CREATE INDEX IF NOT EXISTS idx_merkle_subject ON merkle_roots (subject_table);

CREATE INDEX IF NOT EXISTS idx_merkle_created ON merkle_roots (created_at);
