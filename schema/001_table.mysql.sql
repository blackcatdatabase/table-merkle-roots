-- Auto-generated from schema-map-mysql.yaml (map@sha1:09DF9CA612D1573E058190CC207FA257C05AEC1F)
-- engine: mysql
-- table:  merkle_roots

CREATE TABLE IF NOT EXISTS merkle_roots (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  subject_table VARCHAR(64) NOT NULL,
  period_start DATETIME(6) NOT NULL,
  period_end DATETIME(6) NOT NULL,
  root_hash BINARY(32) NOT NULL,
  proof_uri VARCHAR(512) NULL,
  status VARCHAR(32) NOT NULL DEFAULT 'pending',
  leaf_count BIGINT UNSIGNED NOT NULL,
  created_at DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  UNIQUE KEY uq_merkle_subject_period (subject_table, period_start, period_end),
  INDEX idx_merkle_subject (subject_table),
  INDEX idx_merkle_created (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
