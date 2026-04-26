# Script para conectar proyecto a GitHub y hacer push
# Uso: .\setup-github.ps1

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "   SETUP GITHUB - INTEGRAL BODY & SOUL"
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Variables
$PROYECTO_PATH = "c:\Users\AIAcr\Desktop\Proyectos Visual1\Pagina Web Maryan"
$RAMA = "main"

# Paso 1: Verificar Git
Write-Host "[1] Verificando Git..." -ForegroundColor Yellow
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "ERROR: Git no esta instalado" -ForegroundColor Red
    Write-Host "Descargalo en: https://git-scm.com/download/win" -ForegroundColor Yellow
    exit 1
}
Write-Host "[OK] Git instalado: $(git --version)" -ForegroundColor Green
Write-Host ""

# Paso 2: Ir a la carpeta
Write-Host "[2] Accediendo a la carpeta del proyecto..." -ForegroundColor Yellow
Set-Location -Path $PROYECTO_PATH
Write-Host "[OK] Carpeta: $PROYECTO_PATH" -ForegroundColor Green
Write-Host ""

# Paso 3: Obtener datos del usuario
Write-Host "[3] Ingresa tus datos de GitHub" -ForegroundColor Yellow
Write-Host ""

$USERNAME = Read-Host "Usuario de GitHub"
if ([string]::IsNullOrWhiteSpace($USERNAME)) {
    Write-Host "ERROR: Usuario no puede estar vacio" -ForegroundColor Red
    exit 1
}

$REPO = Read-Host "Nombre del repositorio (default: pagina-integral-body-soul)" 
if ([string]::IsNullOrWhiteSpace($REPO)) {
    $REPO = "pagina-integral-body-soul"
}

$EMAIL = Read-Host "Email de GitHub"
if ([string]::IsNullOrWhiteSpace($EMAIL)) {
    Write-Host "ERROR: Email no puede estar vacio" -ForegroundColor Red
    exit 1
}

$NAME = Read-Host "Tu nombre (para commits)"
if ([string]::IsNullOrWhiteSpace($NAME)) {
    $NAME = "Usuario"
}

Write-Host ""
Write-Host "[OK] Datos confirmados:" -ForegroundColor Green
Write-Host "    Usuario: $USERNAME"
Write-Host "    Repositorio: $REPO"
Write-Host "    Email: $EMAIL"
Write-Host "    Nombre: $NAME"
Write-Host ""

# Paso 4: Verificar repositorio
$URL_REPO = "https://github.com/$USERNAME/$REPO.git"
Write-Host "[4] Verificando repositorio en GitHub" -ForegroundColor Yellow
Write-Host "URL: $URL_REPO" -ForegroundColor Cyan
Write-Host ""
Write-Host "IMPORTANTE: Asegura que el repositorio existe en GitHub" -ForegroundColor Yellow
Write-Host "Si no existe, createlo en: https://github.com/new" -ForegroundColor Yellow
Write-Host ""

$CONFIRMAR = Read-Host "El repositorio ya existe en GitHub? (s/n)"
if ($CONFIRMAR -ne "s" -and $CONFIRMAR -ne "S") {
    Write-Host ""
    Write-Host "Por favor, crea el repositorio en GitHub y vuelve aqui." -ForegroundColor Yellow
    Read-Host "Presiona Enter cuando hayas creado el repositorio"
}
Write-Host ""

# Paso 5: Inicializar Git
Write-Host "[5] Inicializando Git" -ForegroundColor Yellow

if (Test-Path ".git") {
    Write-Host "[OK] Git ya esta inicializado" -ForegroundColor Green
} else {
    Write-Host "[*] Inicializando nuevo repositorio..."
    git init
    Write-Host "[OK] Git inicializado" -ForegroundColor Green
}

# Configurar usuario
Write-Host "[*] Configurando usuario de Git..."
git config user.name "$NAME"
git config user.email "$EMAIL"
Write-Host "[OK] Usuario configurado" -ForegroundColor Green
Write-Host ""

# Paso 6: Agregar archivos
Write-Host "[6] Agregando archivos" -ForegroundColor Yellow
Write-Host "[*] git add ..."
git add .
Write-Host "[OK] Archivos agregados" -ForegroundColor Green
Write-Host ""

# Paso 7: Hacer commit
Write-Host "[7] Creando commit inicial" -ForegroundColor Yellow
Write-Host "[*] git commit ..."
git commit -m "Initial commit: Sitio web Integral Body & Soul"
Write-Host "[OK] Commit creado" -ForegroundColor Green
Write-Host ""

# Paso 8: Configurar rama
Write-Host "[8] Configurando rama principal" -ForegroundColor Yellow
$RAMA_ACTUAL = git rev-parse --abbrev-ref HEAD
if ($RAMA_ACTUAL -ne $RAMA) {
    Write-Host "[*] Renombrando rama a $RAMA..."
    git branch -M $RAMA
    Write-Host "[OK] Rama: $RAMA" -ForegroundColor Green
} else {
    Write-Host "[OK] Rama ya es: $RAMA" -ForegroundColor Green
}
Write-Host ""

# Paso 9: Agregar remoto
Write-Host "[9] Conectando con GitHub" -ForegroundColor Yellow

$EXISTE_REMOTO = git remote -v 2>$null | Select-String "origin"

if ($EXISTE_REMOTO) {
    Write-Host "[OK] Remoto origin ya esta configurado" -ForegroundColor Green
    $CAMBIAR = Read-Host "Cambiar la URL del repositorio? (s/n)"
    if ($CAMBIAR -eq "s" -or $CAMBIAR -eq "S") {
        git remote set-url origin $URL_REPO
        Write-Host "[OK] URL actualizada" -ForegroundColor Green
    }
} else {
    Write-Host "[*] git remote add origin..."
    git remote add origin $URL_REPO
    Write-Host "[OK] Remoto agregado" -ForegroundColor Green
}
Write-Host ""

# Paso 10: Push
Write-Host "[10] Haciendo push a GitHub" -ForegroundColor Yellow
Write-Host ""
Write-Host "NOTA: Si pide contrasena, copia tu Personal Access Token" -ForegroundColor Yellow
Write-Host "Crea uno en: https://github.com/settings/tokens" -ForegroundColor Yellow
Write-Host ""

Write-Host "[*] Enviando cambios a GitHub..."
git push -u origin $RAMA

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "        EXITO! Proyecto en GitHub"
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "[OK] URL del repositorio:" -ForegroundColor Green
    Write-Host "    $URL_REPO" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Proximospasos para publicar en internet:" -ForegroundColor Yellow
    Write-Host "1. Ve a: $URL_REPO" -ForegroundColor Gray
    Write-Host "2. Settings > Pages" -ForegroundColor Gray
    Write-Host "3. Source: Deploy from a branch > main > /" -ForegroundColor Gray
    Write-Host "4. Espera 2 minutos" -ForegroundColor Gray
    Write-Host "5. Tu sitio estara en:" -ForegroundColor Gray
    Write-Host "   https://$USERNAME.github.io/$REPO" -ForegroundColor Cyan
    Write-Host ""
} else {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Red
    Write-Host "           ERROR en PUSH"
    Write-Host "========================================" -ForegroundColor Red
    Write-Host ""
    Write-Host "Posibles soluciones:" -ForegroundColor Yellow
    Write-Host "1. Verifica tu conexion a internet" -ForegroundColor Gray
    Write-Host "2. Usa Personal Access Token (no contrasena)" -ForegroundColor Gray
    Write-Host "3. Crea token: https://github.com/settings/tokens" -ForegroundColor Gray
    Write-Host "4. Marca permiso 'repo'" -ForegroundColor Gray
    Write-Host ""
    Write-Host "Para reintentar:" -ForegroundColor Cyan
    Write-Host "   git push -u origin $RAMA" -ForegroundColor Gray
    Write-Host ""
}

Write-Host "========================================" -ForegroundColor Gray
Read-Host "Presiona Enter para cerrar"
