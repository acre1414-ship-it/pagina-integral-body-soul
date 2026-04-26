@echo off
REM Script para sincronizar automáticamente cambios con GitHub
REM Uso: Ejecuta este archivo desde la carpeta del proyecto

echo Sincronizando cambios con GitHub...
echo.

REM Ir a la carpeta del proyecto
cd /d "c:\Users\AIAcr\Desktop\Proyectos Visual1\Pagina Web Maryan"

REM Validar que estamos en un repositorio git
git rev-parse --git-dir >nul 2>&1
if errorlevel 1 (
    echo Error: No se encontró repositorio git
    echo Ejecuta primero: git init
    pause
    exit /b 1
)

REM Agregar todos los cambios
echo 1. Agregando cambios...
git add .

REM Verificar si hay cambios para hacer commit
git diff-index --quiet HEAD --
if errorlevel 1 (
    REM Hacer commit
    for /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
    for /f "tokens=1-2 delims=/:" %%a in ('time /t') do (set mytime=%%a:%%b)
    
    echo 2. Haciendo commit...
    git commit -m "Actualización automática: %mydate% %mytime%"
    
    echo 3. Haciendo push a GitHub...
    git push origin main
    
    if errorlevel 0 (
        echo.
        echo ✓ ¡Sincronización completada exitosamente!
    ) else (
        echo.
        echo ✗ Error en la sincronización. Verifica tu conexión a internet.
    )
) else (
    echo No hay cambios para sincronizar
)

echo.
pause
