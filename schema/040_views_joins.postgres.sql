-- Auto-generated from joins-postgres.yaml (map@85230ed)
-- engine: postgres
-- view:   merkle_roots_latest

-- Latest Merkle roots per table
CREATE OR REPLACE VIEW vw_merkle_latest AS
SELECT DISTINCT ON (subject_table)
  subject_table,
  period_start,
  period_end,
  leaf_count,
  UPPER(encode(root_hash,'hex')) AS root_hash_hex,
  created_at
FROM merkle_roots
ORDER BY subject_table, created_at DESC;
