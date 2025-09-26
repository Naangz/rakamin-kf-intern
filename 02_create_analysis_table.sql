-- Membuat atau mengganti tabel baru bernama kf_tabel_analisa di dataset kimia_farma
CREATE OR REPLACE TABLE `rakamin-kf-analytics-473210.kimia_farma.kf_tabel_analisa` AS

-- Memilih data dari tabel transaksi final dan menggabungkan dengan tabel lain
SELECT
  -- Kolom transaksi dari tabel transaksi final
  ft.transaction_id,
  ft.date,
  ft.branch_id,
  
  -- Menambahkan informasi cabang dari tabel kantor_cabang
  kc.branch_name,
  kc.kota,
  kc.provinsi,
  kc.rating AS rating_cabang,
  
  -- Nama customer dari transaksi
  ft.customer_name,
  
  -- Informasi produk
  ft.product_id,
  p.product_name,
  
  -- Harga aktual dan diskon
  ft.actual_price,
  ft.discount_percentage,
  
  -- Rating transaksi
  ft.rating AS rating_transaksi,
  
  -- Menghitung nett_sales (harga setelah diskon)
  ft.actual_price * (1 - ft.discount_percentage/100) AS nett_sales,
  
  -- Menghitung persentase gross profit berdasarkan tier harga
  CASE 
    WHEN ft.actual_price <= 50000 THEN 10
    WHEN ft.actual_price <= 100000 THEN 15  
    WHEN ft.actual_price <= 300000 THEN 20
    WHEN ft.actual_price <= 500000 THEN 25
    ELSE 30
  END AS persentase_gross_laba,
  
  -- Menghitung nett_profit = nett_sales * persentase gross profit
  (ft.actual_price * (1 - ft.discount_percentage/100)) * 
  (CASE 
    WHEN ft.actual_price <= 50000 THEN 0.10
    WHEN ft.actual_price <= 100000 THEN 0.15  
    WHEN ft.actual_price <= 300000 THEN 0.20
    WHEN ft.actual_price <= 500000 THEN 0.25
    ELSE 0.30
  END) AS nett_profit

-- Sumber data utama: tabel transaksi final
FROM `rakamin-kf-analytics-473210.kimia_farma.kf_final_transaction` ft

-- Join dengan tabel kantor cabang untuk menambahkan informasi cabang
LEFT JOIN `rakamin-kf-analytics-473210.kimia_farma.kf_kantor_cabang` kc 
  ON ft.branch_id = kc.branch_id

-- Join dengan tabel produk untuk menambahkan informasi produk
LEFT JOIN `rakamin-kf-analytics-473210.kimia_farma.kf_product` p 
  ON ft.product_id = p.product_id;