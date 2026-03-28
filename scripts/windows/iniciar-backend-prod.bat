@echo off
setlocal

set ROOT=%~dp0..\..
pushd "%ROOT%\backend"

echo ============================================
echo   Guarani POS - Iniciando backend produccion
echo ============================================
echo.
call mvn spring-boot:run "-Dspring-boot.run.profiles=prod"

popd
exit /b %errorlevel%
