<!-- Auto-generated from schema-map-postgres.psd1 @ 62c9c93 (2025-11-20T21:38:11+01:00) -->
# Definition – merkle_roots

Per-period Merkle root snapshots for append-only data.

## Columns
| Column | Type | Null | Default | Description | Notes |
|-------:|:-----|:----:|:--------|:------------|:------|
| id | BIGINT | — | AS | Surrogate primary key. |  |
| subject_table | VARCHAR(64) | NO | — | Table being summarized. |  |
| period_start | TIMESTAMPTZ(6) | NO | — | Start timestamp of the covered period. |  |
| period_end | TIMESTAMPTZ(6) | NO | — | End timestamp of the covered period. |  |
| root_hash | BYTEA | NO | — | Merkle root hash (bytea). |  |
| proof_uri | VARCHAR(512) | — | — | Optional URI pointing to notarized proof bundles. |  |
| status | VARCHAR(32) | NO | 'pending' | Lifecycle state of the Merkle root (pending/anchored/verified/failed). |  |
| leaf_count | BIGINT | NO | — | Number of leaves included. |  |
| created_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | When the root was stored. |  |