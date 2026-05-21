# 🛒 E-Commerce SQL Practice Database

## What's Inside

| File | Description |
|------|-------------|
| `ecommerce_db.sql` | Full database schema + seed data |
| `sql_practice_questions.sql` | 50 practice questions with answers |
| `README.md` | This file |

---

## Database Overview

**Database name:** `ecommerce_practice`

### Tables (7)
| Table | Rows | Description |
|-------|------|-------------|
| categories | 17 | Product categories (with parent hierarchy) |
| customers | 50 | Nigerian customer profiles |
| products | 40 | Products across all categories |
| orders | 120 | Orders placed 2022–2024 |
| order_items | ~220 | Line items per order |
| payments | 120 | Payment records per order |
| reviews | 30 | Product reviews and ratings |

### Views (2)
- **vw_order_summary** — Order totals with customer info
- **vw_product_sales** — Sales metrics aggregated per product

---

## How to Import

### MySQL Workbench
1. Open MySQL Workbench and connect to your server
2. Go to **Server → Data Import**
3. Choose "Import from Self-Contained File"
4. Select `ecommerce_db.sql` → Start Import

### Command Line
```bash
mysql -u root -p < ecommerce_db.sql
```

### TablePlus / DBeaver / Any SQL App
1. Connect to your MySQL server
2. Open a new query tab
3. Open `ecommerce_db.sql` and run the entire file
4. Refresh your schema browser

---

## Practice Questions — Difficulty Levels

| Level | Questions | Topics |
|-------|-----------|--------|
| ⭐ Beginner | Q1–Q10 | SELECT, WHERE, ORDER BY, basic aggregation |
| ⭐⭐ Elementary | Q11–Q20 | GROUP BY, HAVING, JOINs, LEFT JOIN |
| ⭐⭐⭐ Intermediate | Q21–Q30 | CTEs, subqueries, window functions, date math |
| ⭐⭐⭐⭐ Advanced | Q31–Q40 | RFM analysis, cohort analysis, pivoting, market basket |
| ⭐⭐⭐⭐⭐ Expert | Q41–Q50 | Stored procedures, recursive CTEs, data integrity, dashboard KPIs |

---

## Schema Diagram

```
categories ──< products ──< order_items >── orders ──── payments
                                               │
customers ─────────────────────────────────────┘
    │
    └──< reviews >── products
```

---

## Tips for Practice
- Always run `USE ecommerce_practice;` before any query
- Try writing each query yourself before looking at the answer
- The views (`vw_order_summary`, `vw_product_sales`) are shortcuts for common joins
- Currency is Nigerian Naira (₦) — amounts are in kobo-precision decimals

Good luck! 🚀
