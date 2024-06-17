# Fan Control untuk OpenWrt - Instalasi Otomatis

## Deskripsi

Aplikasi ini adalah sistem kontrol kipas sederhana untuk perangkat OpenWrt menggunakan transistor 2N2222 yang dikendalikan melalui GPIO. Aplikasi ini memungkinkan pengguna untuk mengatur kecepatan kipas berdasarkan suhu SOC (System on Chip) perangkat OpenWrt.

## Fitur

- Mengontrol kecepatan kipas berdasarkan suhu SOC.
- Konfigurasi suhu batas atas dan bawah untuk pengaturan kipas.
- Antarmuka pengguna berbasis LuCI untuk pengaturan dan konfigurasi.

## Instalasi Otomatis dengan Script

### Persyaratan

- Perangkat OpenWrt (contoh: Orange Pi Zero 3) dengan OS OpenWrt yang sudah terinstall.
- Koneksi internet yang stabil.
- Akses SSH ke perangkat OpenWrt.

### Langkah-langkah Instalasi

1. **Unduh dan Eksekusi Script Auto Install**

   Anda dapat menggunakan perintah `wget` atau `curl` untuk mengunduh dan menjalankan skrip `install.sh` secara otomatis.

   #### Menggunakan `wget`:

   ```sh
   wget -qO- https://raw.githubusercontent.com/teguh-stack/fancontrol/main/install.sh | sh
   ```

   #### Menggunakan `curl`:

   ```sh
   curl -s https://raw.githubusercontent.com/teguh-stack/fancontrol/main/install.sh | sh
   ```

2. **Proses Instalasi Otomatis**

   Skrip ini akan melakukan langkah-langkah berikut secara otomatis:
   - Mengkloning repository fancontrol dari GitHub.
   - Menyalin file konfigurasi ke direktori sistem yang tepat.
   - Mengatur izin eksekusi untuk skrip `fan_control.sh`.
   - Mengaktifkan service `fancontrol` agar berjalan saat startup.
   - Merestart LuCI untuk menerapkan perubahan.

3. **Konfigurasi Lanjutan**

   - Akses LuCI dari browser dengan URL `http://<IP_OpenWrt>/`.
   - Masuk ke menu **Services -> Fan Control**.
   - Konfigurasikan suhu batas atas dan bawah serta pin GPIO yang digunakan untuk mengontrol kipas.
   - Simpan konfigurasi dan periksa operasi kipas sesuai dengan suhu SOC perangkat OpenWrt.

4. **Penggunaan**

   - Pastikan kipas beroperasi sesuai dengan pengaturan yang telah Anda konfigurasi.
   - Uji coba dengan mengatur suhu SOC atau memonitor kinerja sistem untuk memverifikasi kontrol kipas.

## Troubleshooting

- Jika kipas tidak beroperasi seperti yang diharapkan, periksa konfigurasi GPIO dan suhu yang telah Anda atur.
- Periksa log sistem untuk menemukan dan memecahkan masalah potensial dalam operasi kipas.

## Kontribusi

Silakan berkontribusi dengan mem-fork repository ini, melakukan perubahan, dan mengajukan pull request untuk perbaikan atau peningkatan fitur.
