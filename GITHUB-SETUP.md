# 🚀 GUÍA RÁPIDA: Sincronización con GitHub

## Paso 1: Guardar tu logo

1. Copia la imagen del logo (la que ya tienes)
2. Pégala en la carpeta: `assets/logo.png`
   - Ruta completa: `c:\Users\AIAcr\Desktop\Proyectos Visual1\Pagina Web Maryan\assets\logo.png`

---

## Paso 2: Crear Repositorio en GitHub

### 2.1 Si no tienes cuenta GitHub:
1. Ve a [github.com](https://github.com)
2. Haz clic en "Sign up"
3. Completa el registro con email y contraseña
4. Verifica tu email

### 2.2 Crear un nuevo repositorio:
1. En GitHub, haz clic en el ➕ (arriba a la derecha)
2. Selecciona "New repository"
3. Completa:
   - **Repository name**: `pagina-integral-body-soul`
   - **Description**: `Sitio web de la estética Integral Body & Soul`
   - **Visibility**: Elige "Public" (para que se vea públicamente)
4. Haz clic en "Create repository"

### 2.3 GitHub te mostrará comandos. Copia la URL del repositorio:
```
https://github.com/TU_USUARIO/pagina-integral-body-soul.git
```

---

## Paso 3: Inicializar Git Localmente

Abre PowerShell y ejecuta estos comandos:

```powershell
# 1. Navega a la carpeta del proyecto
cd "c:\Users\AIAcr\Desktop\Proyectos Visual1\Pagina Web Maryan"

# 2. Inicializar Git
git init

# 3. Configurar tu nombre de usuario (usa el de GitHub)
git config user.name "Tu Nombre"
git config user.email "tu-email@gmail.com"

# 4. Configurar globalmente (opcional, para todos los proyectos)
git config --global user.name "Tu Nombre"
git config --global user.email "tu-email@gmail.com"

# 5. Agregar todos los archivos
git add .

# 6. Hacer el primer commit
git commit -m "Inicial: Sitio web Integral Body & Soul"

# 7. Renombrar rama a main (si es necesario)
git branch -M main

# 8. Agregar repositorio remoto (REEMPLAZA LA URL)
git remote add origin https://github.com/TU_USUARIO/pagina-integral-body-soul.git

# 9. Hacer push (subir) al GitHub
git push -u origin main
```

> **Nota**: La primera vez te pedirá autenticación. Sigue las instrucciones para crear un token.

---

## Paso 4: Sincronización Automática

Ahora que tu proyecto está en GitHub, aquí hay 3 maneras de mantenerlo actualizado:

### OPCIÓN 1: Script de PowerShell (RECOMENDADO)

1. **Abre PowerShell** y ejecuta:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
```

2. **Cada vez que hayas hecho cambios, ejecuta**:
```powershell
cd "c:\Users\AIAcr\Desktop\Proyectos Visual1\Pagina Web Maryan"
.\sync-github.ps1
```

O con un mensaje personalizado:
```powershell
.\sync-github.ps1 "Agregué nueva sección de promociones"
```

### OPCIÓN 2: Script por Lotes (.bat)

1. **Haz doble clic** en `sync-github.bat`
2. Se ejecutará automáticamente y sincronizará los cambios

### OPCIÓN 3: Comando Manual

Cada vez que hayas hecho cambios:
```powershell
cd "c:\Users\AIAcr\Desktop\Proyectos Visual1\Pagina Web Maryan"
git add .
git commit -m "Descripción de cambios"
git push origin main
```

---

## Paso 5: Desplegar en GitHub Pages (GRATIS)

1. Ve a tu repositorio en GitHub
2. Haz clic en **Settings** (⚙️)
3. En el menú izquierdo, busca **Pages**
4. En "Build and deployment":
   - **Source**: Selecciona "Deploy from a branch"
   - **Branch**: Elige "main" y "/" (root)
5. Haz clic en **Save**
6. Espera 1-2 minutos
7. **¡Tu sitio estará en**: `https://TU_USUARIO.github.io/pagina-integral-body-soul`

---

## Comandos Útiles

```powershell
# Ver estado de cambios
git status

# Ver historial de cambios
git log

# Ver cambios no guardados
git diff

# Deshacer cambios no guardados
git checkout -- .

# Ver ramas
git branch -a

# Ver conexión remota
git remote -v

# Cambiar URL del repositorio
git remote set-url origin https://github.com/TU_USUARIO/nuevo-repositorio.git
```

---

## ⚠️ Solución de Problemas

### "Error: conéctate con GitHub"
- **Solución**: Crea un Personal Access Token en GitHub:
  1. GitHub → Settings (arriba a la derecha)
  2. Developer settings → Personal access tokens
  3. Genera uno nuevo
  4. Usa el token como contraseña (solo funciona en HTTPS)

### "fatal: 'origin' does not appear to be a 'git' repository"
- **Solución**:
```powershell
git remote add origin https://github.com/TU_USUARIO/pagina-integral-body-soul.git
git push -u origin main
```

### "Your branch is behind the remote"
- **Solución**:
```powershell
git pull origin main
```

### No me deja hacer push
- Verifica tener permisos en el repositorio
- Ocasionalmente GitHub rechaza push sin motivo aparente:
```powershell
git push -f origin main
```
(Usa `-f` solo si eres el único trabajando en el proyecto)

---

## 📋 Flujo Diario Típico

1. **Edita los archivos** (`index.html`, `styles.css`, etc.)
2. **Ejecuta el script** de sincronización:
   ```powershell
   .\sync-github.ps1
   ```
3. **Los cambios se suben automáticamente a GitHub** 📤
4. **Verifica en GitHub que todo se actualizó**
5. **GitHub Pages desplegará automáticamente los cambios**

---

## 🎯 Hoja de Trucos

| Tarea | Comando |
|-------|---------|
| Ver cambios | `git status` |
| Sincronizar todo | `.\sync-github.ps1` |
| Ver commit log | `git log --oneline` |
| Deshacer cambio | `git revert HEAD` |
| Ver rama actual | `git branch` |
| Cambiar rama | `git checkout nombre-rama` |

---

## ✨ Próximos Pasos

- [ ] Crear cuenta en GitHub
- [ ] Crear repositorio
- [ ] Hacer commit initial
- [ ] Hacer push a GitHub
- [ ] Configurar GitHub Pages
- [ ] Guardar logo en assets/
- [ ] Actualizar información de contacto
- [ ] Cambiar URL en sync-github.*
- [ ] Hacer primera sincronización
- [ ] Revisar página en línea

---

## 📱 Preguntas Frecuentes

**¿Necesito pagar por GitHub?**
- No, GitHub es gratis para repositorios públicos

**¿Cómo agrego un dominio propio?**
- En GitHub → Settings → Pages
- Busca "Custom domain"
- Ingresa tu dominio
- Sigue las instrucciones de DNS

**¿Puedo hacer el repositorio privado?**
- Sí, en Settings → General → Danger Zone
- O cambia "Public" a "Private" en Settings

**¿Quién puede ver mi código?**
- Si es "Public": Todos
- Si es "Private": Solo tú y quien invites

---

## 🆘 Soporte

Si tienes problemas:
1. Lee [Documentación oficial de Git](https://git-scm.com/doc)
2. Busca el error en [Stack Overflow](https://stackoverflow.com)
3. Consulta la [Ayuda de GitHub](https://docs.github.com)

---

**¡Listo! Tu proyecto está en GitHub y se actualizará automáticamente.** 🎉
