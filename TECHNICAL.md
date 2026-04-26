# 🛠️ INFORMACIÓN TÉCNICA

## Infraestructura del Proyecto

### Stack Tecnológico
- **Frontend**: HTML5, CSS3, JavaScript Vanilla
- **Hosting**: GitHub Pages (opcional)
- **Versionamiento**: Git + GitHub
- **Deploy**: Automático con GitHub Actions (opcional)

### Navegadores Soportados
- Chrome 90+
- Firefox 88+
- Safari 14+
- Edge 90+
- Mobile: iOS Safari 12+, Chrome Mobile, Samsung Internet

### Performance
- Tamaño inicial: ~50KB
- Carga sin dependencias externas pesadas
- CSS crítico inline para faster rendering
- Imágenes optimizadas
- Cero bloqueadores de render

---

## Estructura de Archivos Detallada

```
pagina-integral-body-soul/
│
├── 📄 index.html                    # Página principal
├── 🎨 styles.css                   # Estilos CSS (~ 12KB)
├── ⚙️ script.js                     # Funcionalidad JS (~ 3KB)
│
├── 📂 assets/                       # Carpeta de recursos
│   └── 📸 logo.png                  # Logo de la empresa
│
├── 📂 .github/                      # Configuración de GitHub
│   └── 📂 workflows/
│       └── validate.yml             # CI/CD automático
│
├── 📂 .vscode/                      # Configuración de VS Code
│   └── settings.json                # Preferencias del editor
│
├── 📝 README.md                     # Documentación principal
├── 📋 GITHUB-SETUP.md              # Guía paso a paso GitHub
├── 📋 TECHNICAL.md                 # Este archivo
├── 📄 package.json                  # Metadatos del proyecto
├── 📄 .gitignore                    # Archivos ignorados por Git
│
├── 🔄 sync-github.ps1              # Script PowerShell (recomendado)
├── 🔄 sync-github.bat              # Script Batch
│
└── 📄 LICENSE                       # Licencia MIT

```

---

## Dependencias Externas (importadas desde CDN)

| Recurso | URL | Propósito |
|---------|-----|----------|
| Google Fonts | Playfair Display, Poppins | Tipografía profesional |
| Font Awesome | CDN | Iconografía |
| Mapas | Google Maps Embed | Ubicación |

---

## Guía de Personalización

### Cambiar Colores Primarios

En `styles.css`, línea 2-6:
```css
:root {
    --primary-color: #4db8c4;        /* Azul-turquesa - Cambiar aquí */
    --secondary-color: #2c3e50;      /* Azul oscuro */
    --accent-color: #e8f4f8;         /* Azul claro */
    --text-dark: #2c3e50;
    --text-light: #7f8c8d;
    /* ... */
}
```

**Paletas recomendadas para estética:**
- Pasteles: `#FFB6C1`, `#E6F0FF`, `#FFE4E1`
- Naturales: `#8B7355`, `#D4A574`, `#E8D4B8`
- Moderno: `#667BC6`, `#DA7297`, `#FADA7A`

### Agregar Nueva Sección

Estructura HTML básica:
```html
<section id="mi-seccion" class="mi-clase">
    <div class="container">
        <h2>Título de la Sección</h2>
        <p class="section-subtitle">Subtítulo</p>
        <!-- Contenido -->
    </div>
</section>
```

Estilos CSS mínimos:
```css
.mi-clase {
    background: var(--white);
    padding: 5rem 2rem;
}

/* Responsive */
@media (max-width: 768px) {
    .mi-clase {
        padding: 3rem 1rem;
    }
}
```

---

## Optimización SEO

### Meta Tags configurados:
- `<meta name="description">` ✓
- `<meta name="viewport">` ✓
- `<meta charset="UTF-8">` ✓

### Para mejorar SEO:

1. **Google Search Console**
   - Ve a [search.google.com/search-console](https://search.google.com/search-console)
   - Añade tu sitio
   - Valida propiedad

2. **Metatags adicionales** (agregar en `<head>`):
```html
<meta name="keywords" content="estética, depilación, faciales, reducción">
<meta name="author" content="Integral Body & Soul">
<meta property="og:title" content="Integral Body & Soul">
<meta property="og:description" content="Estética profesional & holística">
<meta property="og:image" content="URL-del-logo">
```

3. **Sitemap.xml** (crear en raíz):
```xml
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url>
    <loc>https://tudominio.com/</loc>
    <lastmod>2026-04-26</lastmod>
    <priority>1.0</priority>
  </url>
</urlset>
```

---

## Testing & Validación

### Herramientas Recomendadas

1. **Validadores HTML/CSS/JS:**
   - [W3C HTML Validator](https://validator.w3.org)
   - [W3C CSS Validator](https://jigsaw.w3.org/css-validator)
   - [JSHint](https://jshint.com)

2. **Testing Responsivo:**
   - Chrome DevTools (F12)
   - [Responsively App](https://responsively.app)
   - Navegadores reales: iPhone, Android, iPad

3. **Performance:**
   - [Google PageSpeed Insights](https://pagespeed.web.dev)
   - [GTmetrix](https://gtmetrix.com)
   - [WebPageTest](https://www.webpagetest.org)

---

## Accesibilidad

### Características A11y implementadas:
- ✓ Contraste de colores suficiente
- ✓ Texto alt en imágenes
- ✓ Navegación por teclado
- ✓ Semántica HTML correcta
- ✓ Focus visible en enlaces

### Para mejorar:
```html
<!-- Agregar lang -->
<html lang="es">

<!-- ARIA labels -->
<button aria-label="Menú principal">...</button>

<!-- Roles -->
<nav role="navigation">...</nav>

<!-- Skip links -->
<a href="#contenido" class="skip-link">Saltar a contenido principal</a>
```

---

## Seguridad

### Buenas Prácticas Implementadas:
- ✓ Sin dependencias innecesarias
- ✓ No almacena datos sensibles localmente
- ✓ HTTPS en GitHub Pages (automático)
- ✓ CSP headers (configurar en hosting)
- ✓ Validación de formularios

### Para producción:
```
# .htaccess (si usas Apache)
<IfModule mod_ssl.c>
    Header always set Strict-Transport-Security "max-age=31536000; includeSubDomains"
    Header always set X-Content-Type-Options "nosniff"
    Header always set X-Frame-Options "DENY"
</IfModule>
```

---

## Uso de Git Avanzado

### Branching Strategy

```bash
# Rama principal (producción)
git branch main

# Rama de desarrollo
git branch develop

# Rama de features
git branch feature/nueva-seccion

# Cambiar de rama
git checkout develop

# Crear y cambiar en un comando
git checkout -b feature/nueva-seccion

# Fusionar ramas
git merge feature/nueva-seccion

# Ver todas las ramas
git branch -a

# Eliminar rama
git branch -d feature/nueva-seccion
```

### Commit Semántico

```
feat: Agregar nueva sección de testimonios
fix: Corregir responsive en móvil
docs: Actualizar README.md
style: Ajustar espaciado en cards
refactor: Optimizar selectores CSS
perf: Optimizar carga de imágenes
test: Agregar validación de formulario
```

---

## Deployment Avanzado

### Opciones Alternativas a GitHub Pages:

1. **Netlify**
   - Conectar repositorio GitHub
   - Automático en cada push
   - Subdominio gratis

2. **Vercel**
   - Similar a Netlify
   - Excelente para proyectos estáticos
   - Inclluye Analytics gratis

3. **Hosting Tradicional**
   - FTP a servidor
   - SSH deployment
   - Custom domain

---

## Monitoreo y Analytics

### Agregar Google Analytics:

```html
<!-- En <head> -->
<!-- Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=GA_ID"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'GA_ID');
</script>
```

Reemplaza `GA_ID` con tu ID de Google Analytics.

---

## Mantenimiento

### Tareas Mensuales:
- [ ] Revisar analytics
- [ ] Actualizar información de servicios
- [ ] Responder mensajes de formulario
- [ ] Backup del repositorio

### Tareas Anuales:
- [ ] Revisar y actualizar colores de branding
- [ ] Audit de accesibilidad
- [ ] Actualizar políticas de privacidad
- [ ] Revisar certificados SSL (si aplica)

---

## Resources Útiles

### Documentación:
- [MDN Web Docs](https://developer.mozilla.org)
- [Web.dev](https://web.dev)
- [CSS Tricks](https://css-tricks.com)

### Herramientas:
- [Can I Use](https://caniuse.com) - Compatibilidad de navegadores
- [Regex101](https://regex101.com) - Probador de expresiones regulares
- [Diff Checker](https://www.diffchecker.com) - Comparar archivos

### Comunidades:
- Stack Overflow
- GitHub Discussions
- Dev.to
- CSS Tricks

---

## Versionamiento

| Versión | Fecha | Cambios |
|---------|-------|---------|
| 1.0.0 | 2026-04-26 | Lanzamiento inicial |

---

**Última actualización:** 26 de abril de 2026
