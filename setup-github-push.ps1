# Script interactivo para conectar proyecto a GitHub y hacer push
# Este script automatiza todo el proceso de inicialización y push
# Ejecución: .\setup-github-push.ps1

Write-Host ""
Write-Host "╔════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║    CONFIGURACIÓN GITHUB - INTEGRAL BODY & SOUL    ║" -ForegroundColor Cyan
Write-Host "║        Conectar Proyecto y Hacer Push v1.0        ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

# Variables
$PROYECTO_PATH = "c:\Users\AIAcr\Desktop\Proyectos Visual1\Pagina Web Maryan"
$RAMA_PRINCIPAL = "main"

# ==================== PASO 1: VERIFICAR  ====================
Write-Host "📋 PASO 1: Validación Inicial" -ForegroundColor Yellow
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray

# Verificar que Git esté instalado
Write-Host "✓ Verificando Git..."
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "✗ Git no está instalado" -ForegroundColor Red
    Write-Host "Descargalo en: https://git-scm.com/download/win" -ForegroundColor Yellow
    Read-Host "Presiona Enter para salir"
    exit 1
}
Write-Host "✓ Git encontrado: $(git --version)" -ForegroundColor Green

# Verificar que la carpeta existe
Write-Host "✓ Verificando carpeta del proyecto..."
if (-not (Test-Path $PROYECTO_PATH)) {
    Write-Host "✗ Carpeta no encontrada: $PROYECTO_PATH" -ForegroundColor Red
    Read-Host "Presiona Enter para salir"
    exit 1
}
Write-Host "✓ Carpeta encontrada" -ForegroundColor Green

# Ir a la carpeta
Set-Location -Path $PROYECTO_PATH
Write-Host "✓ Carpeta activa: $PROYECTO_PATH" -ForegroundColor Green
Write-Host ""

# ==================== PASO 2: OBTENER DATOS GITHUB ====================
Write-Host "👤 PASO 2: Información de GitHub" -ForegroundColor Yellow
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray
Write-Host ""

$USUARIO_GITHUB = Read-Host "📌 Tu usuario de GitHub"
if ([string]::IsNullOrWhiteSpace($USUARIO_GITHUB)) {
    Write-Host "✗ Usuario vacío" -ForegroundColor Red
    exit 1
}

$NOMBRE_REPO = Read-Host "📌 Nombre del repositorio" -Default "pagina-integral-body-soul"

$EMAIL_GITHUB = Read-Host "📌 Tu email de GitHub"
if ([string]::IsNullOrWhiteSpace($EMAIL_GITHUB)) {
    Write-Host "✗ Email vacío" -ForegroundColor Red
    exit 1
}

$NOMBRE_USUARIO = Read-Host "📌 Tu nombre (para commits)" -Default "Usuario"

Write-Host ""
Write-Host "✓ Datos confirmados:" -ForegroundColor Green
Write-Host "  • Usuario: $USUARIO_GITHUB"
Write-Host "  • Repositorio: $NOMBRE_REPO"
Write-Host "  • Email: $EMAIL_GITHUB"
Write-Host "  • Nombre: $NOMBRE_USUARIO"
Write-Host ""

# ==================== PASO 3: VERIFICAR REPOSITORIO ====================
Write-Host "🔍 PASO 3: Verificación del Repositorio" -ForegroundColor Yellow
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray

$URL_REPO = "https://github.com/$USUARIO_GITHUB/$NOMBRE_REPO.git"

Write-Host "📍 URL del repositorio:"
Write-Host "   $URL_REPO" -ForegroundColor Cyan
Write-Host ""
Write-Host "⚠️  IMPORTANTE:" -ForegroundColor Yellow
Write-Host "   Asegúrate de que el repositorio EXISTS en GitHub"
Write-Host "   Si no existe aún, crea uno manualmente en:" -ForegroundColor Yellow
Write-Host "   https://github.com/new" -ForegroundColor Cyan
Write-Host ""

$RESPUESTA = Read-Host "¿El repositorio ya existe en GitHub? (s/n)" -Default "s"
if ($RESPUESTA -ne "s" -and $RESPUESTA -ne "S") {
    Write-Host ""
    Write-Host "👉 Pasos para crear el repositorio:" -ForegroundColor Yellow
    Write-Host "   1. Ve a https://github.com/new" -ForegroundColor Gray
    Write-Host "   2. Nombre: $NOMBRE_REPO" -ForegroundColor Gray
    Write-Host "   3. Descripción: Sitio web estética Integral Body & Soul" -ForegroundColor Gray
    Write-Host "   4. Elige 'Public'" -ForegroundColor Gray
    Write-Host "   5. Click en 'Create repository'" -ForegroundColor Gray
    Write-Host "   6. Vuelve aquí y presiona Enter" -ForegroundColor Gray
    Write-Host ""
    Read-Host "Presiona Enter cuando hayas creado el repositorio"
}

Write-Host ""

# ==================== PASO 4: INICIALIZAR GIT ====================
Write-Host "⚙️  PASO 4: Inicializando Git" -ForegroundColor Yellow
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray

# Verificar si ya existe .git
if (Test-Path ".git") {
    Write-Host "✓ Repositorio Git ya inicializado" -ForegroundColor Green
} else {
    Write-Host "→ Inicializando Git..."
    git init
    Write-Host "✓ Git inicializado" -ForegroundColor Green
}

# Configurar usuario
Write-Host "→ Configurando usuario Git..."
git config user.name "$NOMBRE_USUARIO"
git config user.email "$EMAIL_GITHUB"
Write-Host "✓ Usuario configurado: $NOMBRE_USUARIO ($EMAIL_GITHUB)" -ForegroundColor Green

Write-Host ""

# ==================== PASO 5: AGREGAR ARCHIVOS ====================
Write-Host "📝 PASO 5: Agregando Archivos" -ForegroundColor Yellow
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray

Write-Host "→ Agregando todos los archivos..."
git add .
Write-Host "✓ Archivos agregados" -ForegroundColor Green

# Ver estado
Write-Host ""
Write-Host "Estado actual:" -ForegroundColor Cyan
git status --short | Select-Object -First 10
Write-Host ""

# ==================== PASO 6: PRIMER COMMIT ====================
Write-Host "💾 PASO 6: Primer Commit" -ForegroundColor Yellow
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray

Write-Host "→ Creando primer commit..."
git commit -m "Initial commit: Sitio web Integral Body & Soul"
Write-Host "✓ Commit creado" -ForegroundColor Green

Write-Host ""

# ==================== PASO 7: CONFIGURAR RAMA ====================
Write-Host "🌿 PASO 7: Configurando Rama Principal" -ForegroundColor Yellow
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray

$RAMA_ACTUAL = git rev-parse --abbrev-ref HEAD
if ($RAMA_ACTUAL -ne $RAMA_PRINCIPAL) {
    Write-Host "→ Renombrando rama de '$RAMA_ACTUAL' a '$RAMA_PRINCIPAL'..."
    git branch -M $RAMA_PRINCIPAL
    Write-Host "✓ Rama renombrada a '$RAMA_PRINCIPAL'" -ForegroundColor Green
} else {
    Write-Host "✓ Rama ya es '$RAMA_PRINCIPAL'" -ForegroundColor Green
}

Write-Host ""

# ==================== PASO 8: AGREGAR REMOTO ====================
Write-Host "🔗 PASO 8: Conectando con GitHub" -ForegroundColor Yellow
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray

# Verificar si ya existe remoto
$REMOTO_EXISTENTE = git remote -v 2>$null | Select-String "origin"

if ($REMOTO_EXISTENTE) {
    Write-Host "✓ Remoto 'origin' ya configurado" -ForegroundColor Green
    Write-Host "  URL actual:"
    git remote -v | Select-String "origin" -First 1 | ForEach-Object { Write-Host "  $_" -ForegroundColor Gray }
    
    $CAMBIAR = Read-Host "¿Cambiar URL del remoto? (s/n)" -Default "n"
    if ($CAMBIAR -eq "s" -or $CAMBIAR -eq "S") {
        git remote set-url origin $URL_REPO
        Write-Host "✓ URL actualizada" -ForegroundColor Green
    }
} else {
    Write-Host "→ Agregando remoto 'origin'..."
    git remote add origin $URL_REPO
    Write-Host "✓ Remoto agregado" -ForegroundColor Green
}

Write-Host ""

# ==================== PASO 9: PUSH A GITHUB ====================
Write-Host "⬆️  PASO 9: Haciendo Push a GitHub" -ForegroundColor Yellow
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray

Write-Host ""
Write-Host "🔐 AUTENTICACIÓN:" -ForegroundColor Cyan
Write-Host "   GitHub puede pedir tu contraseña o un Personal Access Token" -ForegroundColor Gray
Write-Host ""
Write-Host "   Si pide contraseña pero no funciona:" -ForegroundColor Yellow
Write-Host "   1. Usa tu Personal Access Token en lugar de contraseña" -ForegroundColor Gray
Write-Host "   2. Crea uno en: https://github.com/settings/tokens" -ForegroundColor Gray
Write-Host ""

Write-Host "→ Haciendo push a GitHub..." -ForegroundColor Cyan
Write-Host ""

# Hacer push con salida en tiempo real
git push -u origin $RAMA_PRINCIPAL

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "╔════════════════════════════════════════════════════╗" -ForegroundColor Green
    Write-Host "║                    ✅ ¡ÉXITO!                      ║" -ForegroundColor Green
    Write-Host "╚════════════════════════════════════════════════════╝" -ForegroundColor Green
    Write-Host ""
    Write-Host "Tu proyecto está en GitHub:" -ForegroundColor Green
    Write-Host "🔗 $URL_REPO" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Próximos pasos:" -ForegroundColor Yellow
    Write-Host "1. Ve a $URL_REPO" -ForegroundColor Gray
    Write-Host "2. Ve a Settings → Pages" -ForegroundColor Gray
    Write-Host "3. Source: 'Deploy from a branch' → main → /" -ForegroundColor Gray
    Write-Host "4. Espera 2 minutos" -ForegroundColor Gray
    Write-Host "5. Tu sitio estará en:" -ForegroundColor Gray
    Write-Host "   https://$USUARIO_GITHUB.github.io/$NOMBRE_REPO" -ForegroundColor Cyan
    Write-Host ""
} else {
    Write-Host ""
    Write-Host "╔════════════════════════════════════════════════════╗" -ForegroundColor Red
    Write-Host "║                   ❌ ERROR EN PUSH                ║" -ForegroundColor Red
    Write-Host "╚════════════════════════════════════════════════════╝" -ForegroundColor Red
    Write-Host ""
    Write-Host "Posibles soluciones:" -ForegroundColor Yellow
    Write-Host "1. Verifica tu conexión a internet" -ForegroundColor Gray
    Write-Host "2. Usa Personal Access Token en lugar de contraseña" -ForegroundColor Gray
    Write-Host "3. Crea token en: https://github.com/settings/tokens" -ForegroundColor Gray
    Write-Host "4. Permisos requeridos: repo (marcar todas las opciones)" -ForegroundColor Gray
    Write-Host ""
    Write-Host "Comando para reintentar:" -ForegroundColor Cyan
    Write-Host "   git push -u origin $RAMA_PRINCIPAL" -ForegroundColor Gray
    Write-Host ""
}

Write-Host "═══════════════════════════════════════════════════" -ForegroundColor Gray
Read-Host "Presiona Enter para cerrar"
