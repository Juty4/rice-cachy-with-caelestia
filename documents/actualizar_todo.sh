#!/bin/bash
# ==========================================
# EL PARCHE DEFINITIVO - JUTY4 SYSTEM UPDATER
# ==========================================

echo "🚀 Iniciando el parche de temporada... Agárrate que vienen curvas."
echo "------------------------------------------"

# 1. ACTUALIZAR EL CORE Y EL AUR (EL LOOT PRINCIPAL)
echo "📦 1/4 - Actualizando Arch, CachyOS y el AUR (Paru)..."
# paru -Syu actualiza tanto el pacman oficial como los paquetes de la comunidad
paru -Syu --noconfirm

# 2. ACTUALIZAR FLATPAKS (Por si has farmeado algo desde la tienda gráfica)
echo "📦 2/4 - Buscando actualizaciones en Flatpak..."
flatpak update -y

# 3. REPARAR Y ACTUALIZAR SPICETIFY (El anti-baneo de Spotify)
echo "🎵 3/4 - Hackeando Spotify de nuevo y buffando Spicetify..."
# Primero, volvemos a reventar el candado por si la actualización de Spotify lo cerró
sudo chmod a+wr -R ~/.local/share/spotify-launcher/install/usr/share/spotify 2>/dev/null
# Actualizamos el motor de Spicetify
spicetify upgrade
# Volvemos a inyectar tu tema y el marketplace a la fuerza
spicetify apply

# 4. LIMPIEZA DE INVENTARIO (Borrar la basura que sobra)
echo "🧹 4/4 - Vaciando la papelera y borrando dependencias huérfanas..."
# Esto borra paquetes residuales que ya no usas para que no te chupen disco duro
paru -c --noconfirm

echo "------------------------------------------"
echo "🏆 ¡Actualización completada! Tu PC está al máximo nivel."
echo "=========================================="
