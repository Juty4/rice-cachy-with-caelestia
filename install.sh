#!/bin/bash
# ========================================================
# INSTALADOR AUTOMÁTICO DE JUTY4 (Ruta Local de GitHub)
# ========================================================

echo "🎮 Iniciando instalación desatendida... Limpiando el mapa."

# 1. ACTUALIZACIÓN DE REPOS GRÁFICOS Y NÚCLEO
sudo pacman -Syu --noconfirm
sudo pacman -S base-devel git fish paru --noconfirm

# 2. EL CORE GRÁFICO (CAELESTIA)
mkdir -p ~/.local/share
git clone https://github.com/vaxerski/Caelestia ~/.local/share/caelestia

# 3. TU INVENTARIO DE APLICACIONES
paru -S --noconfirm zen-browser-bin spotify-launcher vesktop-bin vscodium-bin kitty ttf-monocraft-nerd prismlauncher linux-wallpaperengine spicetify-cli jre17-openjdk flatpak

# 4. PARCHE DE PERMISOS PARA SPOTIFY
sudo chmod a+wr -R ~/.local/share/spotify-launcher/install/usr/share/spotify 2>/dev/null
curl -fsSL https://raw.githubusercontent.com/spicetify/spicetify-marketplace/main/resources/install.sh | sh

# 5. RESTAURAR TUS PREFERENCIAS DESDE TU CARPETA REPO
echo "📂 Inyectando configuraciones personalizadas..."
mkdir -p ~/.config/caelestia ~/.config/kitty ~/.config/fish/functions ~/.config/neofetch ~/Documents

# Aquí el script lee de la carpeta donde se está ejecutando
cp ./config/caelestia/hypr-user.conf ~/.config/caelestia/ 2>/dev/null
cp ./config/caelestia/user-config.fish ~/.config/caelestia/ 2>/dev/null
cp ./config/kitty/kitty.conf ~/.config/kitty/ 2>/dev/null
cp ./config/fish/config.fish ~/.config/fish/ 2>/dev/null
cp ./config/fish/functions/fish_greeting.fish ~/.config/fish/functions/ 2>/dev/null
cp ./config/neofetch/config.conf ~/.config/neofetch/ 2>/dev/null
cp ./documents/actualizar_todo.sh ~/Documents/ 2>/dev/null

# Asegurar permisos y meter el alias para actualizar con la palabra 'update'
chmod +x ~/Documents/actualizar_todo.sh
echo 'alias update="bash ~/Documents/actualizar_todo.sh"' >> ~/.config/fish/config.fish

# 6. LANZAR COMPILACIÓN FINAL
echo "🎮 Todo listo, inicializando la interfaz..."
fish -c "cd ~/.local/share/caelestia && ./install.fish"
