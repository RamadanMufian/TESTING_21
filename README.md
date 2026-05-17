# 🎬 VAX Studio - AI Video Generator & Enhancer

VAX Studio adalah platform antarmuka web modern yang menggabungkan kemampuan AI generatif tingkat lanjut (menggunakan **LTX-Video**) dengan alat **Video Enhancement** (Penajaman & Penghalusan Gerak). 

Sistem ini dirancang secara revolusioner dengan arsitektur **Hybrid**: 
- **Frontend & Server Lokal**: Berjalan dengan sangat ringan di komputer/laptop Anda.
- **Engine GPU Cloud**: Berjalan sepenuhnya di **Kaggle** (menggunakan GPU 15GB VRAM gratis) tanpa membebani komputer Anda sama sekali!

---

## 🌟 Fitur Utama

1. **Text-to-Video (T2V)**: Ketik skenario/prompt (misal: "Seekor naga terbang di atas gunung es"), dan AI akan merender videonya dari nol.
2. **Image-to-Video (I2V)**: Unggah foto statis, dan AI akan membuatnya bergerak menjadi video berdurasi beberapa detik.
3. **Generative Video-to-Video (V2V)**: Unggah video Anda, tambahkan prompt modifikasi (misal: "Ubah ke gaya cyberpunk"), dan AI akan mengambil frame pertama dari video tersebut lalu merender ulang semesta video Anda.
4. **AI Video Enhancer**: Mesin Pasca-Produksi *built-in*!
   - **Upscaler**: Memperbesar resolusi video hingga 4x lipat menggunakan algoritma penajaman Lanczos & Denoising HQDN3D.
   - **Motion Smoothing**: Membuat pergerakan patah-patah menjadi mulus (60+ FPS) menggunakan Frame Blending/Interpolation.
   - **Face Restore**: Filter pengembalian detail ketajaman unsharp mask untuk menjaga kualitas subjek.

---

## 📋 Persyaratan Sistem

*   **OS**: Windows 10/11.
*   **Python**: Python 3.10 atau 3.11 (Wajib! Jangan gunakan versi 3.12+ agar PyTorch kompatibel).
*   **Akun Kaggle**: Untuk menumpang server GPU Gratis.
*   **Akun Ngrok**: Untuk membuat Terowongan (Tunnel) dari Kaggle ke komputer lokal Anda.

---

## ⚙️ Panduan Instalasi (Lokal)

1. Pastikan Anda sudah menginstal **Python (3.10/3.11)**.
2. Buka folder proyek ini.
3. Jalankan file `setup.bat` dengan cara klik dua kali (File ini akan otomatis membuat Virtual Environment `venv` dan menginstal semua pustaka yang dibutuhkan).
4. Selesai! Komputer Anda kini sudah siap bertindak sebagai Markas Pusat.

---

## 🚀 Panduan Penggunaan (Mulai Bekerja)

Penggunaan VAX Studio dibagi menjadi 2 tahap: **Menyalakan Mesin Kaggle**, lalu **Menyambungkannya ke Lokal**.

### TAHAP 1: Menyalakan Mesin AI di Kaggle
1. Buka [Kaggle.com](https://www.kaggle.com) dan buat Notebook baru (*New Notebook*).
2. Pergi ke Pengaturan (Panel Kanan Kaggle):
   - **ACCELERATOR**: Pilih `GPU T4 x2` atau `GPU P100` (sangat direkomendasikan).
   - **INTERNET**: Pastikan diatur ke `On`.
3. Klik tombol `File -> Import Notebook` lalu unggah file `VAX_Studio_Kaggle.ipynb` yang ada di dalam folder proyek Anda.
4. Jalankan (*Run All*) kode di notebook tersebut. 
5. Tunggu proses instalasi library (sekitar 1-2 menit). Di bagian paling bawah, notebook akan mencetak teks hijau: 
   `🎉 KONEKSI NGROK KAGGLE BERHASIL!` 
   `🔗 URL API Anda: https://xxxx-xxxx.ngrok-free.dev`
6. **Copy/Salin** URL API Ngrok tersebut! Mesin AI sekarang sudah hidup dan menanti instruksi.

### TAHAP 2: Menyalakan VAX Studio di Komputer Anda
1. Klik dua kali pada file `start_server.bat` di folder proyek Anda.
2. Jendela Command Prompt hitam (Terminal) akan terbuka dan server FastApi lokal akan berjalan di `http://localhost:8000`.
3. Buka browser Anda (Chrome/Firefox) lalu kunjungi salah satu halaman Web Frontend (misal: `frontend/index.html` atau `frontend/text2video.html`).
4. Di pojok kanan atas layar web, klik tombol **Settings (Logo Roda Gigi)**.
5. Tempelkan (**Paste**) URL Ngrok yang Anda salin dari Kaggle tadi ke dalam kolom *Backend/API URL*.
6. Klik **Connect**. Ikon indikator akan berubah menjadi **Hijau (Online)** lengkap dengan data status VRAM GPU Anda!

---

## 🎮 Cara Menggunakan Fitur Video-to-Video

Fitur ini adalah fitur yang paling canggih dan sangat bisa disesuaikan (*customizable*).

1. Unggah video Anda.
2. **Kolom Prompt:**
   - *Biarkan Kosong*: Jika Anda hanya ingin menggunakan fitur *Enhancer* murni (Menjernihkan/Memuluskan pergerakan) tanpa mengubah wujud benda di dalam video.
   - *Diisi Teks*: Jika Anda ingin AI mengekstrak frame pertama video Anda, dan menjadikannya bahan bakar untuk menciptakan (Generative) adegan yang sama sekali baru sesuai instruksi Teks Anda. (Lalu dilanjutkan dengan Enhancer).
3. **Pengaturan Durasi & Kualitas:**
   - **Durasi**: Atur berapa panjang video yang dirender (33, 65, atau 97 frame). 
   - **Steps**: Gunakan angka `40` untuk keseimbangan kualitas dan kecepatan rendering.
   - **CFG Scale**: Gunakan angka `3.5` untuk LTX-Video.
4. Klik **Transform Video** dan tunggu video Anda muncul di panel Galeri (kiri bawah)!

---

## 🔧 Pemecahan Masalah (Troubleshooting)

**1. Hasil Video Gepeng (Distorsi Rasio Aspek):**
Ini sudah diperbaiki secara sistematis menggunakan `ImageOps.fit`. Namun jika masih terjadi, pastikan input gambar awal Anda memiliki rasio resolusi *Widescreen* (misal 16:9).

**2. Ikon Koneksi Merah Terus:**
- Pastikan URL Ngrok yang disalin sudah benar (tidak ada karakter spasi berlebih).
- Cek tab *Cell* di Kaggle, jika proses berhenti (`RuntimeError`), tekan *Restart Session* dan *Run All* kembali di Kaggle.

**3. Error "Out of Memory" (OOM):**
Ini terjadi jika Anda mengaktifkan batas Frame (Durasi) yang terlalu panjang (>129 Frames) atau Resolusi yang terlalu besar di pengaturan. Kurangi jumlah *Frames* atau tutup semua proses Kaggle yang tak terpakai.

---
*Didesain dan dikembangkan dengan ❤️ untuk eksplorasi AI generasi berikutnya.*
