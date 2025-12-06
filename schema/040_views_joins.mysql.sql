-- Auto-generated from joins-mysql.yaml (map@sha1:DA70105A5B799F72A56FEAB71A5171F946A770D2)
-- engine: mysql
-- view:   merkle_latest

CREATE OR REPLACE ALGORITHM=TEMPTABLE SQL SECURITY INVOKER VIEW vw_merkle_latest AS
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
