@echo off
setlocal

set ROOT=%~dp0..\..
pushd "%ROOT%"

echo ============================================
echo   Guarani POS - Instalacion de dependencias
echo ============================================
echo.

where java >nul 2>nul
if errorlevel 1 (
  echo [ERROR] Java no esta instalado o no esta en PATH.
  goto :fail
)

where mvn >nul 2>nul
if errorlevel 1 (
  echo [ERROR] Maven no esta instalado o no esta en PATH.
  goto :fail
)

where node >nul 2>nul
if errorlevel 1 (
  echo [ERROR] Node.js no esta instalado o no esta en PATH.
  goto :fail
)

where npm >nul 2>nul
if errorlevel 1 (
  echo [ERROR] npm no esta instalado o no esta en PATH.
  goto :fail
)

echo [1/2] Descargando dependencias del backend...
call mvn -f backend\pom.xml dependency:go-offline
if errorlevel 1 goto :fail

echo.
echo [2/2] Instalando dependencias del frontend...
pushd frontend
call npm install
if errorlevel 1 (
  popd
  goto :fail
)
popd

echo.
echo Instalacion completada correctamente.
goto :end

:fail
echo.
echo La instalacion no pudo completarse.
popd
exit /b 1

:end
popd
exit /b 0
