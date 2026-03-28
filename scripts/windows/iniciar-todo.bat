@echo off
setlocal

echo ============================================
echo   Guarani POS - Inicio rapido
echo ============================================
echo.

start "Guarani POS Backend" cmd /k ""%~dp0iniciar-backend.bat""
timeout /t 6 /nobreak >nul
start "Guarani POS Frontend" cmd /k ""%~dp0iniciar-frontend.bat""
timeout /t 6 /nobreak >nul
start "" "http://localhost:4200"

exit /b 0
