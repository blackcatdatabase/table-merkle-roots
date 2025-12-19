-- Auto-generated from schema-views-postgres.yaml (map@sha1:5C6FE96DC2067A978A357A1DCB8631B46C71D429)
-- engine: postgres
-- table:  merkle_roots

-- Contract view for [merkle_roots]
CREATE OR REPLACE VIEW vw_merkle_roots AS
SELECT
  id,
  subject_table,
  period_start,
  period_end,
  root_hash,
  UPPER(encode(root_hash,'hex')) AS root_hash_hex,
  proof_uri,
  status,
  created_at
FROM merkle_roots;
