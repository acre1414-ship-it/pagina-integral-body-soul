#!/bin/bash
# Script para sincronizar automáticamente con GitHub (para macOS/Linux)
# Guardar como: sync-github.sh
# Hacer ejecutable: chmod +x sync-github.sh
# Ejecutar: ./sync-github.sh

set -e

PROYECTO_PATH="c:\Users\AIAcr\Desktop\Proyectos Visual1\Pagina Web Maryan"
MENSAJE="${1:-Actualización automática}"

echo "========================================"
echo "📤 Sincronizador GitHub"
echo "========================================"
echo ""

# Ir a la carpeta del proyecto
cd "$PROYECTO_PATH" || exit 1

# Verificar que es un repositorio git
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "❌ Error: No se encontró repositorio git"
    echo "Ejecuta primero: git init"
    exit 1
fi

echo "📁 Carpeta: $PROYECTO_PATH"
echo ""

# Verificar si hay cambios
echo "🔍 Verificando cambios..."
if git diff-index --quiet HEAD --; then
    echo "✓ No hay cambios para sincronizar"
    echo ""
    exit 0
fi

echo "✓ Se encontraron cambios"
echo ""

# Agregar todos los cambios
echo "📝 1. Agregando cambios..."
git add .

# Crear mensaje con timestamp
FECHA=$(date '+%Y-%m-%d %H:%M')
MENSAJE_COMPLETO="$MENSAJE - $FECHA"

# Hacer commit
echo "💾 2. Haciendo commit..."
git commit -m "$MENSAJE_COMPLETO"

# Hacer push
RAMA=$(git rev-parse --abbrev-ref HEAD)
echo "⬆️  3. Haciendo push a GitHub (rama: $RAMA)..."
git push origin $RAMA

echo ""
echo "========================================"
echo "✅ ¡Sincronización completada!"
echo "========================================"
echo "Mensaje: $MENSAJE_COMPLETO"
echo ""
