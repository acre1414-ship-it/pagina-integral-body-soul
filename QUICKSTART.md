# ⚡ INICIO RÁPIDO (5 MINUTOS)

## 📸 PASO 1: Guardar Logo (1 min)

1. Ya tienes la carpeta: `c:\Users\AIAcr\Desktop\Proyectos Visual1\Pagina Web Maryan\assets\`
2. **Copia y pega tu logo** en esa carpeta
3. Renómbralo exactamente como: `logo.png`

✅ **Listo**: El logo aparecerá en la página

---

## 🌐 PASO 2: Crear GitHub (2 min)

### 2.1 Crear Cuenta (si no tienes)
- Ve a [github.com](https://github.com)
- Haz clic en **Sign up**
- Completa email y contraseña

### 2.2 Crear Repositorio
1. En GitHub: ➕ (arriba) → **New repository**
2. Nombre: `pagina-integral-body-soul`
3. Descripción: `Sitio web estética Integral Body & Soul`
4. **Public** (para que se vea públicamente)
5. Haz clic en **Create repository**

✅ **Importante**: Copia la URL del repositorio (será algo como):
```
https://github.com/TU_USUARIO/pagina-integral-body-soul.git
```

---

## 💾 PASO 3: Subir a GitHub (2 min)

### Abre PowerShell en Windows:

```powershell
# 1. Ve a la carpeta del proyecto
cd "c:\Users\AIAcr\Desktop\Proyectos Visual1\Pagina Web Maryan"

# 2. Inicializar Git
git init

# 3. Agregar info personal
git config user.name "Tu Nombre"
git config user.email "tu-email@gmail.com"

# 4. Agregar archivos
git add .

# 5. Primer commit
git commit -m "Inicial: Sitio web Integral Body & Soul"

# 6. Cambiar rama a main
git branch -M main

# 7. Conectar con GitHub (REEMPLAZA LA URL)
git remote add origin https://github.com/TU_USUARIO/pagina-integral-body-soul.git

# 8. Subir a GitHub 🚀
git push -u origin main
```

> **Nota**: Te pedirá contraseña. Sigue las instrucciones que aparezcan.

✅ **Listo**: Tu proyecto está en GitHub

---

## 📱 PASO 4: Publicar en Internet (2 min)

1. En GitHub, ve a **Settings** ⚙️
2. Busca **Pages** en el menú izquierdo
3. En "Source":
   - Selecciona: **Deploy from a branch**
   - Branch: **main**
   - Carpeta: **/ (root)**
4. Haz clic en **Save**
5. Espera 1-2 minutos
6. **¡Tu sitio estará en**:
   ```
   https://TU_USUARIO.github.io/pagina-integral-body-soul
   ```

✅ **¡Tu página está en línea!**

---

## 🔄 PASO 5: Mantener Actualizado

### Cada vez que hagas cambios:

#### **Opción A: Usar script (FÁCIL)**
```powershell
cd "c:\Users\AIAcr\Desktop\Proyectos Visual1\Pagina Web Maryan"
.\sync-github.ps1
```

#### **Opción B: Comandos manuales**
```powershell
cd "c:\Users\AIAcr\Desktop\Proyectos Visual1\Pagina Web Maryan"
git add .
git commit -m "Actualización"
git push origin main
```

✅ **Cambios se suben automáticamente a GitHub Pages**

---

## ✅ CHECKLIST FINAL

- [ ] Logo guardado en `assets/logo.png`
- [ ] Cuenta GitHub creada
- [ ] Repositorio creado en GitHub
- [ ] Código subido a GitHub (push completado)
- [ ] GitHub Pages activado
- [ ] Sitio visible en internet (https://tuusuario.github.io/...)
- [ ] Información de contacto actualizada
- [ ] Probado en móvil

---

## 🎯 PRÓXIMOS PASOS

1. **Personalizar contenido**:
   - Edita `index.html` para cambiar textos
   - Edita `styles.css` para cambiar colores
   - Ejecuta `.\sync-github.ps1` para guardar cambios

2. **Agregar tu dominio** (opcional):
   - Compra dominio en GoDaddy, Namecheap, etc.
   - En GitHub Settings → Pages → Custom domain
   - Ingresa tu dominio
   - Actualiza DNS según instrucciones

3. **Conectar redes sociales**:
   - Edita URLs en `index.html` sección footer
   - Reemplaza `#` con links a Instagram, Facebook, WhatsApp

---

## 📞 INFORMACIÓN DE CONTACTO PARA EDITAR

Abre `index.html` y reemplaza:

| Campo | Línea | Cambiar | Ejemplo |
|-------|-------|---------|---------|
| Teléfono | ~220 | `+57 (1) 000-0000` | `+57 3101234567` |
| Email | ~225 | `info@integralbodysoul.com` | `contacto@esteti.ca` |
| Horario | ~230 | Horas actuales | `Lun-Vie: 10:00-18:00` |
| Instagram | ~360 | `#` | `instagram.com/integral_bs` |
| Facebook | ~361 | `#` | `facebook.com/integralbodysoul` |
| WhatsApp | ~362 | `#` | `wa.me/573101234567` |

---

## 🎨 PERSONALIZACIÓN RÁPIDA

### Cambiar colores:
En `styles.css`, línea 2-6, reemplaza:
```css
--primary-color: #4db8c4;        /* Azul actual → Tu color */
```

**Colores populares para estética:**
- Rosa: `#FF69B4`
- Púrpura: `#9B59B6`
- Oro: `#D4AF37`
- Verde menta: `#98D8C8`

### Hacer cambios en "visible" en GitHub Pages:
```powershell
git add .
git commit -m "Cambié los colores"
git push
# Espera 1-2 minutos para que se actualice
```

---

## 🆘 SOLUCIÓN RÁPIDA DE PROBLEMAS

| Problema | Solución |
|----------|----------|
| "Git no reconocido" | Instala [Git para Windows](https://git-scm.com) |
| "Error de autenticación" | Crea token en GitHub Settings → Developer → Personal tokens |
| "Cambios no suben" | Verifica: `git status` y `git log` |
| "Logo no aparece" | Verifica nombre: debe ser exactamente `logo.png` |
| "Página no se ve online" | Espera 2 minutos, luego recarga (Ctrl+Shift+R) |

---

## 📚 DOCUMENTOS ÚTILES EN TU CARPETA

| Archivo | Cuando leer |
|---------|-----------|
| `README.md` | Para entender el proyecto |
| `GITHUB-SETUP.md` | Si necesitas ayuda con GitHub |
| `TECHNICAL.md` | Para configuración avanzada |
| `QUICKSTART.md` | Este archivo |

---

## 🎉 ¡RESUMEN!

**Lo que acabas de crear:**
- ✅ Sitio web profesional completo
- ✅ Integración con GitHub
- ✅ Publicación automática en internet
- ✅ Actualizaciones automáticas
- ✅ Dominio gratis (tuusuario.github.io)

**Próximo paso:** Coloca el logo y ¡ejecuta el script de sincronización!

```powershell
.\sync-github.ps1
```

**¡Y listo! Tu estética está en línea.** 🎊

---

**¿Preguntas?** Lee los otros archivos .md en la carpeta.
