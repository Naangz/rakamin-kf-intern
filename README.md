# rakamin-kf-intern
# Kimia Farma Performance Analytics - BigQuery SQL Scripts

## Project Overview
Performance Analytics dashboard untuk evaluasi kinerja bisnis Kimia Farma tahun 2020-2023.

## Dataset Information
- **Source**: Rakamin Academy Final Project
- **Period**: 2020-2023
- **Tables**: 4 main tables, 1 analysis table, 2 comparison views

## Files Description

### 1. `01_create_base_table.sql`
Setup dataset dan import CSV files ke BigQuery tables.

### 2. `02_create_analysis_table.sql` 
Create main analysis table `kf_tabel_analisa` dengan kalkulasi:
- Nett Sales (setelah diskon)
- Gross Profit Percentage (berdasarkan price tier)
- Nett Profit (berdasarkan margin laba)

## Usage
1. Run scripts secara berurutan
2. Connect ke Looker Studio untuk visualisasi
3. Setup dashboard dengan filter controls

## Dashboard Requirements
- KPI Cards: Total Transaksi, Avg Rating, Total Profit, Total Revenue
- Time Series: Sales trend 2020-2023
- Bar Charts: Top provinces, branches, products
- Geo Map: Profit distribution across Indonesia
- Rating Analysis: Branch vs Transaction ratings

## Author
[Naangz] - Rakamin Academy Big Data Analytics Intern

## Link Dashboard
[[Looker Studio Dashboard URL](https://lookerstudio.google.com/reporting/8a4ff1ca-675f-4a05-8de7-131b1c1673c4)]
