-- Auto-generated from core/joins-postgres.yaml (map@sha1:29CF395A3A4C8964482083733F8E613ABFBEF5CC)
-- engine: postgres
-- view:   merkle_latest

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
