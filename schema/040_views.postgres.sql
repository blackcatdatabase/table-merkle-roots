-- Auto-generated from schema-views-postgres.psd1 (map@9d3471b)
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

-- Auto-generated from schema-views-postgres.psd1 (map@9d3471b)
-- engine: postgres
-- table:  merkle_roots_latest
-- Latest Merkle roots per table
CREATE OR REPLACE VIEW vw_merkle_latest AS
SELECT DISTINCT ON (subject_table)
  subject_table,
  period_start,
  period_end,
  leaf_count,
  UPPER(encode(root_hash,''hex'')) AS root_hash_hex,
  created_at
FROM merkle_roots
ORDER BY subject_table, created_at DESC;

