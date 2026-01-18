---

# 🐧 Boby Arch - Minimalist i3wm Setup

<p align="center">
  <img src="https://img.shields.io/badge/Arch-Linux-blue?style=for-the-badge&logo=arch-linux" />
  <img src="https://img.shields.io/badge/Kernel-Zen-purple?style=for-the-badge&logo=linux" />
  <img src="https://img.shields.io/badge/RAM_Idle-450MB-green?style=for-the-badge" />
</p>

Configuración altamente optimizada para **Arch Linux** usando **i3wm**. Este setup busca el equilibrio entre una estética minimalista, personalización dinámica con `pywal` y rendimiento extremo.

## 🖼️ Screenshots

<p align="center">
  <img width="500" height="500" alt="2026-01-17_23-47" src="https://github.com/user-attachments/assets/b3ac4a38-46c7-46f4-a34b-75399a010090" width="48%" />
  <img width="500" height="500" alt="2026-01-17_23-46_1" src="https://github.com/user-attachments/assets/e415064d-26b9-452a-af37-ab972b8685bd" width="48%" />
</p>

## 🚀 Características y Especificaciones

* **Terminal:** Alacritty (Rápido y acelerado por GPU).
* **Shell:** Zsh con Oh My Zsh, resaltado de sintaxis y autocompletado.
* **Estética:** Colores dinámicos con `pywal` (se sincronizan con el wallpaper).
* **Compositor:** `picom` para transparencias suaves y sombras.
* **Gestión de archivos:** PCManFM (GUI) y Yazi (Terminal) con previsualización de archivos.

| Componente | Detalle |
| --- | --- |
| **OS** | Arch Linux x86_64 |
| **Kernel** | 6.18.5-zen1-1-zen |
| **Lanzador** | Rofi (drun) |
| **Fuentes** | JetBrains Mono Nerd Font |

## ⌨️ Atajos de Teclado (Keybindings)

La tecla principal (`$mod`) está configurada como la tecla **Super/Windows**.

### Gestión de Ventanas y Sistema

| Acción | Combinación |
| --- | --- |
| **Abrir Terminal (Alacritty)** | `$mod + Enter` |
| **Cerrar Ventana Enfocada** | `$mod + q` |
| **Lanzador de Apps (Rofi)** | `$mod + d` |
| **Menú de Apagado (Power Menu)** | `$mod + x` |
| **Reiniciar i3 (inplace)** | `$mod + Shift + r` |
| **Salir de la Sesión** | `$mod + Shift + e` |

### Personalización y Estética

| Acción | Combinación |
| --- | --- |
| **Cambiar Fondo de Pantalla** | `$mod + Shift + w` |
| **Subir Opacidad (Ventana)** | `$mod + RePág` |
| **Bajar Opacidad (Ventana)** | `$mod + AvPág` |

### Navegación y Layout

| Acción | Combinación |
| --- | --- |
| **Cambiar Enfoque** | `$mod + j / k / l / ñ` o `Flechas` |
| **Mover Ventana** | `$mod + Shift + j / k / l / ñ` |
| **Pantalla Completa** | `$mod + f` |
| **Alternar Flotante** | `$mod + Shift + Espacio` |

## 🛠️ Dependencias (Extraídas de `conf`)

Instala los paquetes necesarios para que todo funcione como en las capturas:

### Base, Gráficos y Fuentes

```bash
sudo pacman -S fastfetch ly git alacritty arandr polybar rofi feh python-pywal picom lxappearance ttf-jetbrains-mono-nerd ttf-font-awesome

```

### Terminal y Productividad

```bash
sudo pacman -S zsh lsd starship zoxide eza fzf jq ripgrep fd neovim yazi ffmpegthumbnailer poppler-glib

```

### Multimedia y Estética de Terminal

```bash
sudo pacman -S pcmanfm file-roller gvfs cmus cava cmatrix ueberzugpp imagemagick

```

### AUR (requiere `yay`)

```bash
yay -S i3lock-color xautolock

```

## ⚙️ Instalación rápida

1. **Clona el repositorio:**
```bash
git clone https://github.com/Elpepesaurio44/boby-i3wm-arch.git
cd boby-i3wm-arch && chmod +x install-dotsfiles.sh && ./install-dotsfiles.sh

```


2. **Copia la configuración:**
Mueve los archivos del repo a `~/.config/i3/` y otras carpetas correspondientes.
3. **Refresca el sistema:**
Presiona `$mod + Shift + r` para ver los cambios instantáneamente.
