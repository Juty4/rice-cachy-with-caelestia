#!/bin/bash
# ==========================================
# RICE INSTALLER SCRIPT - JUTY SYSTEM
# Run this on a fresh Arch Linux system!
# ==========================================

echo "🚀 Iniciando el instalador del Rice Automático..."
echo "Asegúrate de ejecutar este script desde la carpeta scripts/ de My_Rice."
sleep 2

# Directorios de referencia
RICE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DOTFILES_DIR="$RICE_DIR/dotfiles"
PACKAGES_FILE="$RICE_DIR/packages_aur_arch.txt"

# 1. Actualizar sistema base
echo "🔄 1/5 - Actualizando el sistema base..."
sudo pacman -Syu --noconfirm

# 2. Instalar Paru (AUR Helper) si no existe
echo "📦 2/5 - Verificando gestor de paquetes AUR (Paru)..."
if ! command -v paru &> /dev/null; then
    echo "Paru no encontrado. Instalando Paru..."
    sudo pacman -S --needed --noconfirm base-devel git
    git clone https://aur.archlinux.org/paru.git /tmp/paru
    cd /tmp/paru && makepkg -si --noconfirm
    rm -rf /tmp/paru
else
    echo "Paru ya está instalado."
fi

# 3. Instalar todos los paquetes del Rice
echo "⬇️ 3/5 - Instalando todos los paquetes y aplicaciones (Esto tardará un rato)..."
if [ -f "$PACKAGES_FILE" ]; then
    # Lee el archivo de paquetes e instala ignorando los que ya estén
    paru -S --needed --noconfirm - < "$PACKAGES_FILE"
else
    echo "❌ ERROR: No se encontró el archivo $PACKAGES_FILE."
    exit 1
fi

# 4. Restaurar configuraciones (Dotfiles)
echo "📂 4/5 - Restaurando configuraciones visuales (Dotfiles)..."
# Crear directorios si no existen
mkdir -p ~/.config

# Copiar directorios de .config
for folder in hypr caelestia kitty cava spicetify btop fastfetch fish fuzzel systemd; do
    if [ -d "$DOTFILES_DIR/$folder" ]; then
        echo "Copiando configuración de $folder..."
        cp -r "$DOTFILES_DIR/$folder" ~/.config/
    fi
done

# Copiar archivos de la raíz (~)
for file in .bashrc .zshrc .gitconfig; do
    if [ -f "$DOTFILES_DIR/$file" ]; then
        echo "Copiando $file..."
        cp "$DOTFILES_DIR/$file" ~/
    fi
done

# Copiar directorios de .local
if [ -d "$DOTFILES_DIR/local" ]; then
    echo "Copiando configuraciones locales (.local)..."
    mkdir -p ~/.local
    cp -r "$DOTFILES_DIR/local/"* ~/.local/
fi

# Copiar starship
if [ -f "$DOTFILES_DIR/starship.toml" ]; then
    cp "$DOTFILES_DIR/starship.toml" ~/.config/
fi

# 5. Configuraciones Post-Instalación
echo "⚙️ 5/5 - Aplicando configuraciones post-instalación..."

# Cambiar la shell por defecto a Fish (si está instalado)
if command -v fish &> /dev/null; then
    echo "Cambiando shell por defecto a Fish..."
    sudo chsh -s $(which fish) $USER
fi

# Configurar permisos para Spicetify si Spotify está instalado
if [ -d "/opt/spotify" ]; then
    echo "Ajustando permisos para Spicetify..."
    sudo chmod a+wr -R /opt/spotify 2>/dev/null
    sudo chmod a+wr -R /opt/spotify/Apps/* 2>/dev/null
    spicetify backup apply 2>/dev/null || echo "Ejecuta 'spicetify backup apply' manualmente después."
fi

# Habilitar servicios comunes (se omiten errores si no están instalados)
echo "Habilitando servicios del sistema (Docker, Bluetooth, etc)..."
sudo systemctl enable --now docker.service 2>/dev/null
sudo systemctl enable --now bluetooth.service 2>/dev/null

echo "=========================================="
echo "🏆 ¡INSTALACIÓN COMPLETADA!"
echo "Reinicia tu ordenador para que todos los cambios hagan efecto."
echo "=========================================="
