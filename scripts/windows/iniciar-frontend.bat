@echo off
setlocal

set ROOT=%~dp0..\..
pushd "%ROOT%\frontend"

echo ============================================
echo   Guarani POS - Iniciando frontend
echo ============================================
echo.
call npm start

popd
exit /b %errorlevel%
