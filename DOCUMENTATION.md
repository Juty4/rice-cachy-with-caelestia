# 🌌 Juty's Arch Linux Rice

<div align="center">
  <h3>A custom, automated dotfiles setup based on Caelestia</h3>
  <p>🇪🇸 Español | 🇬🇧 English</p>
</div>

---

## 🇪🇸 Español

Este repositorio contiene mi configuración personal ("rice") para Arch Linux / CachyOS, lista para ser desplegada en un sistema completamente limpio con un solo comando. 

###  Instalación Automática

Para instalar todas las dependencias, herramientas y configuraciones visuales en un sistema nuevo, simplemente ejecuta el instalador automático:

```bash
cd scripts
chmod +x install_rice.sh
./install_rice.sh
```

**¿Qué hace el script?**
1. Actualiza el sistema base.
2. Instala `paru` (AUR Helper) si no lo tienes.
3. Descarga e instala todos los paquetes listados en `packages_aur_arch.txt`.
4. Restaura todas las configuraciones visuales (`dotfiles/`) en tu carpeta `~/.config/`.
5. Configura `fish` como tu shell principal, ajusta permisos y habilita servicios en segundo plano (Docker, Bluetooth, etc).

###  Herramientas Incluidas
- **Window Manager:** Hyprland
- **Terminal:** Kitty + Fish + Starship
- **Lanzador de Apps:** Fuzzel / Quickshell
- **Modificaciones de audio y UI:** Spicetify, Btop, Cava, Fastfetch

###  Créditos
Todo el "esqueleto" visual y el diseño base de este escritorio es gracias al proyecto **Caelestia**.
- **Creador oficial de Caelestia:** Todos los créditos del diseño base y arquitectura van para el autor original de Caelestia. Este repositorio es un fork/respaldo que incluye mis modificaciones personales (atajos de ratón corregidos, scripts de instalación automática y ajustes de entorno) construidas sobre su fantástico trabajo.

---

## 🇬🇧 English

This repository contains my personal dotfiles ("rice") for Arch Linux / CachyOS, ready to be deployed on a completely clean system with a single command.

###  Automatic Installation

To install all dependencies, tools, and visual configurations on a fresh system, simply run the automatic installer:

```bash
cd scripts
chmod +x install_rice.sh
./install_rice.sh
```

**What does the script do?**
1. Updates the base system.
2. Installs `paru` (AUR Helper) if missing.
3. Downloads and installs all packages listed in `packages_aur_arch.txt`.
4. Restores all visual configurations (`dotfiles/`) to your `~/.config/` directory.
5. Sets `fish` as the default shell, fixes permissions, and enables background services (Docker, Bluetooth, etc).

###  Included Tools
- **Window Manager:** Hyprland
- **Terminal:** Kitty + Fish + Starship
- **App Launcher:** Fuzzel / Quickshell
- **Audio & UI Mods:** Spicetify, Btop, Cava, Fastfetch

###  Credits
The entire visual framework and base design of this desktop is powered by the **Caelestia** project.
- **Official Caelestia Creator:** Full credits for the base design and architecture go to the original author of Caelestia. This repository is a fork/backup containing my personal tweaks (fixed mouse bindings, custom installer scripts, and environment adjustments) built on top of their amazing work.
