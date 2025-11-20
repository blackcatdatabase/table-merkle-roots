# 📦 Merkle Roots

![SQL](https://img.shields.io/badge/SQL-MySQL%208.0%2B-4479A1?logo=mysql&logoColor=white) ![License](https://img.shields.io/badge/license-BlackCat%20Proprietary-red) ![Status](https://img.shields.io/badge/status-stable-informational) ![Generated](https://img.shields.io/badge/generated-from%20schema--map-blue)

<!-- Auto-generated from schema-map-postgres.psd1 @ 62c9c93 (2025-11-20T21:38:11+01:00) -->

> Schema package for table **merkle_roots** (repo: `merkle-roots`).

## Files
```
schema/
  001_table.sql
  020_indexes.sql
  # (no foreign keys declared in map)
```

## Quick apply
```bash
# Apply schema (Linux/macOS):
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < schema/001_table.sql
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < schema/020_indexes.sql
```

```powershell
# Apply schema (Windows PowerShell):
mysql -h $env:DB_HOST -u $env:DB_USER -p$env:DB_PASS $env:DB_NAME < schema/001_table.sql
mysql -h $env:DB_HOST -u $env:DB_USER -p$env:DB_PASS $env:DB_NAME < schema/020_indexes.sql
```

## Docker quickstart
```bash
# Spin up a throwaway MySQL and apply just this package:
docker run --rm -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=app -p 3307:3306 -d mysql:8
sleep 15
mysql -h 127.0.0.1 -P 3307 -u root -proot app < schema/001_table.sql
mysql -h 127.0.0.1 -P 3307 -u root -proot app < schema/020_indexes.sql
```

## Columns
| Column | Type | Null | Default | Extra |
|-------:|:-----|:----:|:--------|:------|
| id | BIGINT | — | AS | PK |
| subject_table | VARCHAR(64) | NO | — |  |
| period_start | TIMESTAMPTZ(6) | NO | — |  |
| period_end | TIMESTAMPTZ(6) | NO | — |  |
| root_hash | BYTEA | NO | — |  |
| proof_uri | VARCHAR(512) | — | — |  |
| status | VARCHAR(32) | NO | 'pending' |  |
| leaf_count | BIGINT | NO | — |  |
| created_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) |  |

## Relationships
- No outgoing foreign keys.

```mermaid
erDiagram
  MERKLE_ROOTS {
    INT id PK
    VARCHAR subject_table
    TIMESTAMPTZ period_start
    TIMESTAMPTZ period_end
    BYTEA root_hash
    VARCHAR proof_uri
    VARCHAR status
    INT leaf_count
    TIMESTAMPTZ created_at
  }
```

## Indexes
- 2 deferred index statement(s) in schema/020_indexes.sql.

## Notes
- Generated from the umbrella repository **blackcat-database** using `scripts/schema-map.psd1`.
- To change the schema, update the map and re-run the generators.

## License
Distributed under the **BlackCat Store Proprietary License v1.0**. See `LICENSE`.
