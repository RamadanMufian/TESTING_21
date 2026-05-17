@echo off
title Setup & Install Dependencies (LTX-Video)
cd /d "%~dp0"
color 0E

echo.
echo  ============================================================
echo   SETUP - Install Semua Dependencies
echo   RTX 4050 6GB - LTX Video Project
echo  ============================================================
echo.

:: Step 1: Buat venv
echo  [1/4] Membuat virtual environment...
if exist "venv\Scripts\python.exe" (
    echo         venv sudah ada, skip.
) else (
    python -m venv venv
    if errorlevel 1 (
        echo [ERROR] Gagal membuat venv! Pastikan Python sudah terinstal.
        pause
        exit /b 1
    )
    echo         venv berhasil dibuat!
)
echo.

:: Step 2: Upgrade PIP
echo  [2/4] Meng-upgrade PIP...
"venv\Scripts\python.exe" -m pip install --upgrade pip

:: Step 3: Install PyTorch CUDA
echo.
echo  [3/4] Install PyTorch dengan CUDA 12.1...
echo        (File ~2.5GB, butuh waktu...)
echo.
"venv\Scripts\python.exe" -m pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121

echo.

:: Step 4: Install FastAPI & dependencies AI
echo  [4/4] Install pustaka Diffusers, FastAPI, dan lainnya...
"venv\Scripts\python.exe" -m pip install fastapi==0.115.0 uvicorn==0.30.0 python-multipart aiofiles python-dotenv
"venv\Scripts\python.exe" -m pip install diffusers transformers accelerate sentencepiece protobuf opencv-python
"venv\Scripts\python.exe" -m pip install imageio imageio-ffmpeg huggingface_hub hf_transfer bitsandbytes pyngrok nest-asyncio

echo.
echo  ============================================================
echo   SETUP SELESAI!
echo   
echo   Langkah berikutnya:
echo   Silakan klik ganda "start_server.bat" untuk menyalakan server lokal.
echo  ============================================================
echo.
pause
