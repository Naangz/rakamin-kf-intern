-- =================================================================
-- Kimia Farma Performance Analytics - Create Base Tables
-- Project: BigQuery Data Import from CSV files
-- Author: [Your Name]
-- Date: September 2025
-- =================================================================

-- Create dataset if not exists
CREATE SCHEMA IF NOT EXISTS `rakamin-kf-analytics-473210.kimia_farma`;

-- Import CSV files to BigQuery tables:
-- 1. kffinaltransaction.csv → kf_final_transaction
-- 2. kfinventory.csv → kf_inventory  
-- 3. kfkantorcabang.csv → kf_kantor_cabang
-- 4. kfproduct.csv → kf_product

-- Note: CSV import dilakukan melalui BigQuery Console UI
-- Tables created: kf_final_transaction, kf_inventory, kf_kantor_cabang, kf_product
