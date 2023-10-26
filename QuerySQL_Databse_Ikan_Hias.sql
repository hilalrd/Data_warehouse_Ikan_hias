CREATE TABLE Pelanggan (
    Pelanggan_id INT,
    Nama VARCHAR(255),
    Alamat VARCHAR(255),
    No_HP INT,
    Email VARCHAR(255),
	PRIMARY KEY (Pelanggan_id));

CREATE TABLE Pemasok (
    Suplier_id INT,
    Nama VARCHAR(255),
    Alamat VARCHAR(255),
    No_HP INT,
	PRIMARY KEY (Suplier_id));

CREATE TABLE Stok_Produk (
	Product_id INT,
	Suplier_id INT,
    Nama VARCHAR(255),
	Jumlah_Produk INT,
    Harga INT,
	PRIMARY KEY (Product_id),
	FOREIGN KEY (Suplier_id) REFERENCES Pemasok(Suplier_id));

CREATE TABLE Penjualan (
    Sale_id INT,
	Pelanggan_id INT,
	Product_id INT,
    Jumlah_Produk_Terjual INT,
    Total_Penjualan INT,
	PRIMARY KEY (Sale_id),
	FOREIGN KEY (Pelanggan_id) REFERENCES Pelanggan(Pelanggan_id),
	FOREIGN KEY (Product_id) REFERENCES Stok_Produk(Product_id));

CREATE TABLE Pembayaran (
    Payment_id INT,
    Sale_id INT,
    Metode VARCHAR(255),
    Total_Pembayaran INT,
    Tanggal_Pembayaran DATE,
	PRIMARY KEY (Payment_id),
	FOREIGN KEY (Sale_id) REFERENCES Penjualan(Sale_id));

CREATE TABLE Pengiriman (
    Shipment_id INT,
    Sale_id INT,
    Alamat VARCHAR(255),
    No_Resi INT,
    Tanggal_Pengiriman DATE,
	PRIMARY KEY (Shipment_id),
	FOREIGN KEY (Sale_id) REFERENCES Penjualan(Sale_id));