# Script de PowerShell para sincronizar automáticamente con GitHub
# Uso: .\sync-github.ps1

param(
    [string]$mensaje = "Actualización automática"
)

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "📤 Sincronizador GitHub" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Ir a la carpeta del proyecto
$proyectoPath = "c:\Users\AIAcr\Desktop\Proyectos Visual1\Pagina Web Maryan"
Set-Location -Path $proyectoPath

# Verificar que es un repositorio git
$gitDir = git rev-parse --git-dir 2>$null
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Error: No se encontró repositorio git" -ForegroundColor Red
    Write-Host "Ejecuta primero: git init" -ForegroundColor Yellow
    Read-Host "Presiona Enter para salir"
    exit 1
}

Write-Host "📁 Carpeta: $proyectoPath" -ForegroundColor Gray
Write-Host ""

# Verificar si hay cambios
Write-Host "🔍 Verificando cambios..." -ForegroundColor Yellow
$status = git status --porcelain

if ([string]::IsNullOrEmpty($status)) {
    Write-Host "✓ No hay cambios para sincronizar" -ForegroundColor Green
    Write-Host ""
    Read-Host "Presiona Enter para salir"
    exit 0
}

Write-Host "✓ Se encontraron cambios" -ForegroundColor Green
Write-Host ""
Write-Host "Cambios detectados:" -ForegroundColor Yellow
Write-Host $status
Write-Host ""

# Agregar todos los cambios
Write-Host "📝 1. Agregando cambios..." -ForegroundColor Cyan
git add .

# Crear mensaje de commit con timestamp
$fecha = Get-Date -Format "yyyy-MM-dd HH:mm"
$mensajeCompleto = "$mensaje - $fecha"

# Hacer commit
Write-Host "💾 2. Haciendo commit..." -ForegroundColor Cyan
git commit -m "$mensajeCompleto"

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Error en commit" -ForegroundColor Red
    Read-Host "Presiona Enter para salir"
    exit 1
}

# Obtener la rama actual
$rama = git rev-parse --abbrev-ref HEAD

# Hacer push
Write-Host "⬆️  3. Haciendo push a GitHub (rama: $rama)..." -ForegroundColor Cyan
git push origin $rama

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "✅ ¡Sincronización completada!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "Mensaje: $mensajeCompleto" -ForegroundColor Gray
    Write-Host ""
} else {
    Write-Host ""
    Write-Host "❌ Error en la sincronización" -ForegroundColor Red
    Write-Host "Verifica tu conexión a internet y configuración de Git" -ForegroundColor Yellow
    Write-Host ""
}

Read-Host "Presiona Enter para salir"
