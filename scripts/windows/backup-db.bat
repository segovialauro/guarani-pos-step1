@echo off
setlocal

set DB_HOST=localhost
set DB_PORT=5432
set DB_NAME=guarani_pos
set DB_USER=postgres
set BACKUP_DIR=%~dp0..\..\backups

if not exist "%BACKUP_DIR%" mkdir "%BACKUP_DIR%"

for /f %%i in ('powershell -NoProfile -Command "Get-Date -Format yyyyMMdd-HHmmss"') do set TS=%%i
set BACKUP_FILE=%BACKUP_DIR%\guarani_pos_%TS%.sql

echo ============================================
echo   Guarani POS - Backup de base de datos
echo ============================================
echo.

where pg_dump >nul 2>nul
if errorlevel 1 (
  echo [ERROR] pg_dump no esta disponible en PATH.
  echo Instala PostgreSQL o agrega su carpeta bin al PATH.
  exit /b 1
)

set /p PGPASSWORD=Contrasena de PostgreSQL: 

echo Generando backup en:
echo %BACKUP_FILE%
echo.

call pg_dump -h %DB_HOST% -p %DB_PORT% -U %DB_USER% -d %DB_NAME% -F p -f "%BACKUP_FILE%"
if errorlevel 1 (
  echo.
  echo [ERROR] No se pudo generar el backup.
  exit /b 1
)

echo.
echo Backup generado correctamente.
echo Archivo: %BACKUP_FILE%
exit /b 0
