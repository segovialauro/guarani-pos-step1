@echo off
setlocal

set ROOT=%~dp0..\..
pushd "%ROOT%\backend"

echo ============================================
echo   Guarani POS - Inicializacion base cliente
echo ============================================
echo.
echo Este modo debe usarse solo una vez sobre una base vacia.
echo.
call mvn spring-boot:run "-Dspring-boot.run.profiles=setup"

popd
exit /b %errorlevel%
