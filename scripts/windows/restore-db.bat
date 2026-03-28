@echo off
setlocal

set DB_HOST=localhost
set DB_PORT=5432
set DB_NAME=guarani_pos
set DB_USER=postgres

echo ============================================
echo   Guarani POS - Restauracion de base
echo ============================================
echo.

where psql >nul 2>nul
if errorlevel 1 (
  echo [ERROR] psql no esta disponible en PATH.
  echo Instala PostgreSQL o agrega su carpeta bin al PATH.
  exit /b 1
)

if "%~1"=="" (
  echo Uso:
  echo restore-db.bat RUTA_DEL_ARCHIVO_SQL
  exit /b 1
)

if not exist "%~1" (
  echo [ERROR] El archivo indicado no existe.
  exit /b 1
)

set /p PGPASSWORD=Contrasena de PostgreSQL: 

echo.
echo Restaurando desde:
echo %~1
echo.

call psql -h %DB_HOST% -p %DB_PORT% -U %DB_USER% -d %DB_NAME% -f "%~1"
if errorlevel 1 (
  echo.
  echo [ERROR] No se pudo restaurar la base de datos.
  exit /b 1
)

echo.
echo Restauracion completada correctamente.
exit /b 0
