-- ============================================
-- DATABASE SISTEM INVENTARIS TOKO RETAIL
-- Mata Kuliah: Pengembangan Web Sisi Server
-- Kelas: BB244 | STIKOM Bali 2025/2026
-- ============================================

CREATE DATABASE IF NOT EXISTS db_inventaris;
USE db_inventaris;

-- Tabel Produk
CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama_produk VARCHAR(100) NOT NULL,
    tipe ENUM('Laptop', 'Smartphone') NOT NULL,
    merek VARCHAR(50) NOT NULL,
    harga DECIMAL(15,2) NOT NULL DEFAULT 0,
    stok INT NOT NULL DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabel Transaksi (Pengurangan Stok)
CREATE TABLE IF NOT EXISTS transactions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    jumlah INT NOT NULL,
    keterangan VARCHAR(255),
    tanggal TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data Awal Produk
INSERT INTO products (nama_produk, tipe, merek, harga, stok) VALUES
('ThinkPad X1 Carbon', 'Laptop', 'Lenovo', 25000000, 10),
('MacBook Air M2', 'Laptop', 'Apple', 18500000, 7),
('Acer Aspire 5', 'Laptop', 'Acer', 8500000, 3),
('iPhone 15 Pro', 'Smartphone', 'Apple', 17000000, 4),
('Samsung Galaxy S24', 'Smartphone', 'Samsung', 12000000, 8),
('Xiaomi 14', 'Smartphone', 'Xiaomi', 8000000, 2);
