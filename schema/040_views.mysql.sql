-- Auto-generated from schema-views-mysql.yaml (map@sha1:FFA9A9D6FA9EE079B0DAEBB6FEE023C138E8FFA1)
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
