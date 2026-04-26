# Integral Body & Soul - Sitio Web

Sitio web profesional para la estética **Integral Body & Soul**. Una página moderna y responsiva que presenta servicios de tratamientos reductores, faciales terapéuticos y bienestar holístico.

## 🎨 Características

✨ **Diseño Moderno y Responsivo**
- Adaptable a todos los dispositivos (móvil, tablet, desktop)
- Interfaz intuitiva y fácil de navegar
- Animaciones suaves y atractivas

🖼️ **Secciones**
- Hero: Introducción impactante
- Servicios: Presentación de tratamientos principales
- Tratamientos: Detalle de procedimientos disponibles
- Diferenciales: Razones para elegirnos
- Ubicación: Mapa interactivo (Century Tower)
- Contacto: Formulario y canales de comunicación

📱 **Características Técnicas**
- HTML5 semántico
- CSS3 moderno con variables
- JavaScript vanilla para interactividad
- Font Awesome para iconos
- Google Fonts integradas
- Accesibilidad mejorada

## 📂 Estructura del Proyecto

```
Pagina Web Maryan/
├── index.html          # Página principal
├── styles.css          # Estilos CSS
├── script.js           # Funcionalidad JavaScript
├── assets/             # Carpeta de recursos
│   └── logo.png        # Logo de la empresa
├── .gitignore          # Archivo de ignorados de Git
├── package.json        # Configuración del proyecto
├── README.md           # Este archivo
└── LICENSE             # Licencia del proyecto
```

## 🚀 Configuración Rápida

### Opción 1️⃣: Clonar y Ejecutar Localmente

```bash
# Clonar el repositorio
git clone https://github.com/TU_USUARIO/pagina-integral-body-soul.git

# Entrar a la carpeta
cd pagina-integral-body-soul

# Abrir en navegador (simplemente abre index.html)
# O usa un servidor local:
python -m http.server 8000
# Accede a http://localhost:8000
```

### Opción 2️⃣: Configuración Automática con GitHub

#### Paso 1: Crear Repositorio en GitHub
1. Ve a [GitHub.com](https://github.com) y crea una cuenta (si no tienes)
2. Haz clic en "New Repository"
3. Nómbralo: `pagina-integral-body-soul`
4. Descripción: "Sitio web de la estética Integral Body & Soul"
5. Elige "Public" o "Private"
6. Haz clic en "Create repository"

#### Paso 2: Inicializar Git Localmente
```bash
# Navega a la carpeta del proyecto
cd "c:\Users\AIAcr\Desktop\Proyectos Visual1\Pagina Web Maryan"

# Inicializar repositorio Git
git init

# Agregar todos los archivos
git add .

# Hacer commit inicial
git commit -m "Inicial: Estructura completa del sitio web"

# Agregar repositorio remoto (reemplaza USERNAME y REPO)
git remote add origin https://github.com/USERNAME/pagina-integral-body-soul.git

# Cambiar rama a main (si es necesario)
git branch -M main

# Hacer push al repositorio
git push -u origin main
```

#### Paso 3: Configurar Actualización Automática
Para que los cambios se suban automáticamente a GitHub, puedes usar:

**Opción A: GitHub Desktop**
- Descarga [GitHub Desktop](https://desktop.github.com)
- Abre el repositorio
- Haz cambios en los archivos
- Los cambios aparecerán en GitHub Desktop
- Haz clic en "Commit to main"
- Luego "Push origin"

**Opción B: Script de Actualización Automática (PowerShell)**

Crea un archivo `auto-sync.ps1` en la carpeta del proyecto:

```powershell
# auto-sync.ps1
Write-Host "Sincronizando cambios con GitHub..."

cd "c:\Users\AIAcr\Desktop\Proyectos Visual1\Pagina Web Maryan"

git add .
git commit -m "Actualización automática: $(Get-Date)"
git push origin main

Write-Host "¡Sincronización completada!"
```

Para ejecutar automáticamente cada día:
1. Abre "Programador de tareas" de Windows
2. Crea una nueva tarea
3. Establece que ejecute: `powershell.exe -ExecutionPolicy Bypass -File "ruta\auto-sync.ps1"`
4. Configura la frecuencia (ej: diaria a las 22:00)

**Opción C: Usar GitHub Actions (CI/CD)**

Crea una carpeta `.github/workflows` y un archivo `deploy.yml`:

```yaml
name: Auto Deploy

on:
  push:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - name: Deploy
      run: |
        echo "Sitio desplegado automáticamente"
```

## 🛠️ Personalización

### Cambiar Información de Contacto
En `index.html`, busca y reemplaza:
- `+57 (1) 000-0000` → Tu teléfono
- `info@integralbodysoul.com` → Tu email

### Cambiar Horarios
En la sección de contacto, modifica:
```html
<p>Lun-Vie: 9:00 AM - 7:00 PM<br>Sábado: 9:00 AM - 5:00 PM</p>
```

### Agregar Logo
- Reemplaza `assets/logo.png` con tu logo (nombre debe ser igual)
- Asegúrate de que sea PNG o SVG

### Cambiar Colores
En `styles.css`, modifica las variables:
```css
:root {
    --primary-color: #4db8c4;      /* Color principal (azul-turquesa) */
    --secondary-color: #2c3e50;    /* Color secundario (azul oscuro) */
    --accent-color: #e8f4f8;       /* Color de acentos (azul claro) */
    /* ... más variables */
}
```

## 📍 Ubicación en Mapa

Para actualizar la ubicación del mapa en `index.html`:
1. Ve a [Google Maps](https://maps.google.com)
2. Busca "Century Tower"
3. Haz clic en "Compartir"
4. Ve a la pestaña "Insertar un mapa"
5. Copia el código `<iframe>`
6. Reemplaza el mapa actual en la sección `#ubicacion`

## 📧 Formulario de Contacto

El formulario actualmente muestra un mensaje. Para conectarlo a un backend:

1. **Crear un backend simple** (Node.js, Python, etc.)
2. **Actualizar la URL en `script.js`**:
```javascript
const response = await fetch('https://tu-servidor.com/api/mensajes', {
```
3. **Guardar mensajes en base de datos**

## 🌐 Desplegar en Internet

### Opción 1: GitHub Pages (GRATIS)
1. Ve a la configuración del repositorio
2. Busca "Pages"
3. Selecciona "Deploy from a branch"
4. Elige "main" → "root"
5. Guarda
6. **¡Listo!** Tu sitio estará en: `https://USERNAME.github.io/pagina-integral-body-soul`

### Opción 2: Hosting Profesional
- **Netlify**: Conecta tu GitHub y despliega automáticamente
- **Vercel**: Similar a Netlify, muy fácil
- **000webhost**: Hosting gratuito tradicional
- **Hostinger**: Hosting económico con dominio propio

## 📋 Checklist de Actualización

- [ ] Agregar logo en `assets/logo.png`
- [ ] Actualizar teléfono en contacto
- [ ] Cambiar email de contacto
- [ ] Actualizar ubicación del mapa
- [ ] Revisar colores y que coincidan con branding
- [ ] Probar en dispositivos móviles
- [ ] Vincular con redes sociales
- [ ] Conectar formulario de contacto

## 🔒 Seguridad

- No subas información sensible (contraseñas, claves)
- Usa `.gitignore` para archivos privados
- Mantén dependencias actualizadas
- Revisa regularmente los archivos

## 📞 Soporte y Mejoras Futuras

**Características que podrías agregar:**
- Blog de tips de belleza
- Galería antes/después
- Sistema de reservas en línea
- Chat en vivo
- Integración con WhatsApp Business
- Testimonios de clientes
- Precios y paquetes especiales

## 📜 Licencia

Este proyecto está bajo licencia MIT. Úsalo libremente.

## ✨ Notas Finales

Este sitio es totalmente responsivo y moderno. Actualiza regularmente los contenidos y mantén la información de contacto al día. Los clientes potenciales valoran la facilidad para comunicarse.

**¡Buena suerte con tu estética!** 💆‍♀️✨

---

**Última actualización:** Abril 2026
**Versión:** 1.0.0
