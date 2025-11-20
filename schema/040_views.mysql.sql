-- Auto-generated from schema-views-mysql.psd1 (map@db2f8b8)
-- engine: mysql
-- table:  merkle_roots
-- Contract view for [merkle_roots]
CREATE OR REPLACE ALGORITHM=MERGE SQL SECURITY INVOKER VIEW vw_merkle_roots AS
SELECT
  id,
  subject_table,
  period_start,
  period_end,
  root_hash,
  UPPER(HEX(root_hash)) AS root_hash_hex,
  proof_uri,
  status,
  created_at
FROM merkle_roots;

-- Auto-generated from schema-views-mysql.psd1 (map@db2f8b8)
-- engine: mysql
-- table:  merkle_roots_latest
-- Latest Merkle roots per table
CREATE OR REPLACE ALGORITHM=MERGE SQL SECURITY INVOKER VIEW vw_merkle_latest AS
WITH ranked AS (
  SELECT
    subject_table,
    period_start,
    period_end,
    leaf_count,
    root_hash,
    created_at,
    ROW_NUMBER() OVER (PARTITION BY subject_table ORDER BY created_at DESC) AS rn
  FROM merkle_roots
)
SELECT
  subject_table,
  period_start,
  period_end,
  leaf_count,
  UPPER(HEX(root_hash)) AS root_hash_hex,
  created_at
FROM ranked
WHERE rn = 1
ORDER BY subject_table;

