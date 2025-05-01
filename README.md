# Aplikasi Kasir Toko Mainan Cahaya
Aplikasi sistem penjualan berbasis web menggunakan framework codeigniter 4.

## Persyaratan
 - Semua persyaratan mengacu ke dokumentasi codeigniter 4. [Dokumentasi](https://codeigniter.com/user_guide/intro/requirements.html)

## Cara Install
 - Download project ini. `git clone https://github.com/VaniaRusprameswari/kasir_toko_mainan` 
 - Masuk ke direktori `cd kasir_toko_mainan`
 - Jalankan `composer update` untuk mendownload dependensinya.
 - Ganti nama file `env.sampel` menjadi `.env`
 - Ubah kofigurasi databasenya :
    - `database.default.hostname = localhost`
    - `database.default.database = kasir_toko_mainan`
    - `database.default.username = root`
    - `database.default.password = `
    - `database.default.DBDriver = MySQLi`
 - Buat nama database `kasir_toko_mainan` kemudian import file `kasir_toko_mainan.sql`
 - Jalankan aplikasi `php spark serve` kemudian buka urlnya `http://localhost:8080/`
 - Akun untuk login :
    - Username : superadmin / admin / kasir
    - Password : superadmin / admin / kasir
