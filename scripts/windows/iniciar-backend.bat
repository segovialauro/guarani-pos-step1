@echo off
setlocal

set ROOT=%~dp0..\..
pushd "%ROOT%\backend"

echo ============================================
echo   Guarani POS - Iniciando backend
echo ============================================
echo.
call mvn spring-boot:run

popd
exit /b %errorlevel%
