# merkle_roots

Per-period Merkle root snapshots for append-only data.

## Columns
| Column | Type | Null | Default | Description |
| --- | --- | --- | --- | --- |
| created_at | mysql: DATETIME(6) / postgres: TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | When the root was stored. |
| id | BIGINT | NO |  | Surrogate primary key. |
| leaf_count | BIGINT | NO |  | Number of leaves included. |
| period_end | DATETIME(6) | NO |  | End timestamp of the covered period. |
| period_start | mysql: DATETIME(6) / postgres: TIMESTAMPTZ(6) | NO |  | Start timestamp of the covered period. |
| proof_uri | VARCHAR(512) | YES |  | Optional URI pointing to notarized proof bundles. |
| root_hash | mysql: BINARY(32) / postgres: BYTEA | NO |  | Merkle root hash (bytea). |
| status | VARCHAR(32) | NO | pending | Lifecycle state of the Merkle root (pending/anchored/verified/failed). |
| subject_table | VARCHAR(64) | NO |  | Table being summarized. |

## Engine Details

### mysql

Unique keys:
| Name | Columns |
| --- | --- |
| uq_merkle_subject_period | subject_table, period_start, period_end |

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_merkle_created | created_at | INDEX idx_merkle_created (created_at) |
| idx_merkle_subject | subject_table | INDEX idx_merkle_subject (subject_table) |
| uq_merkle_subject_period | subject_table,period_start,period_end | UNIQUE KEY uq_merkle_subject_period (subject_table, period_start, period_end) |

### postgres

Unique keys:
| Name | Columns |
| --- | --- |
| uq_merkle_subject_period | subject_table, period_start, period_end |

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_merkle_created | created_at | CREATE INDEX IF NOT EXISTS idx_merkle_created ON merkle_roots (created_at) |
| idx_merkle_subject | subject_table | CREATE INDEX IF NOT EXISTS idx_merkle_subject ON merkle_roots (subject_table) |
| uq_merkle_subject_period | subject_table,period_start,period_end | CONSTRAINT uq_merkle_subject_period UNIQUE (subject_table, period_start, period_end) |

## Engine differences

## Views
| View | Engine | Flags | File |
| --- | --- | --- | --- |
| vw_merkle_latest | mysql | algorithm=TEMPTABLE, security=INVOKER | [../schema/040_views_joins.mysql.sql](../schema/040_views_joins.mysql.sql) |
| vw_merkle_roots | mysql | algorithm=MERGE, security=INVOKER | [../schema/040_views.mysql.sql](../schema/040_views.mysql.sql) |
| vw_merkle_latest | postgres |  | [../schema/040_views_joins.postgres.sql](../schema/040_views_joins.postgres.sql) |
| vw_merkle_roots | postgres |  | [../schema/040_views.postgres.sql](../schema/040_views.postgres.sql) |
