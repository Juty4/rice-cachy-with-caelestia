# 🎮 Caelestia OS - juty4 Ultimate Rice Guide (v4 - Zero to Hero)

¡A ver, chaval! Has alcanzado el nivel máximo de pereza productiva, el verdadero *endgame* de cualquier usuario de Linux: la automatización total. 

Esta documentación describe la **Build v4**, diseñada para que cualquier persona (o tú mismo en el futuro) pueda coger un ordenador completamente formateado con la pantalla negra de CachyOS, tirar un solo comando, irse a hacer un café, y volver con el sistema 100% tuneado, con aplicaciones hackeadas, atajos de teclado y el motor gráfico funcionando.

---

## 🚀 1. La Instalación Suprema (De TTY a Master Race en un clic)

El objetivo es no tener que pensar. Todo el proceso se ha comprimido en un único script instalador.

**El único comando que tienes que teclear en tu pantalla negra (TTY):**

```bash
git clone https://github.com/juty4/CaelestiaBackup.git ~/CaelestiaBackup && cd ~/CaelestiaBackup && chmod +x install.sh && ./install.sh
```

*(Nota: Asegúrate de reemplazar `https://github.com/juty4/CaelestiaBackup.git` por la URL real de tu repositorio si le cambias el nombre).*

### ¿Qué brujería hace el `install.sh` por detrás?
Para que tu repositorio funcione con ese comando, tienes que crear un archivo llamado `install.sh` en la carpeta raíz de tu GitHub con este código maestro. Este script es el que se encarga de engullir todo el sistema, actualizarlo, meter tus apps, restaurar tus configuraciones y lanzar el motor gráfico de Caelestia de forma desatendida:

```bash
#!/bin/bash
# ========================================================
# INSTALADOR SUPREMO DE JUTY4 (ZERO TO HERO)
# ========================================================

echo "🚀 Iniciando Instalación Suprema... Agárrate."

# 1. ACTUALIZACIÓN Y DEPENDENCIAS BASE
echo "⚙️  Fase 1: Preparando el terreno (Pacman)..."
sudo pacman -Syu --noconfirm
sudo pacman -S base-devel git fish paru --noconfirm

# 2. EL MOTOR GRÁFICO (CAELESTIA)
echo "🌌 Fase 2: Descargando Caelestia Core..."
mkdir -p ~/.local/share
git clone https://github.com/vaxerski/Caelestia ~/.local/share/caelestia

# 3. EL LOOT (TUS APLICACIONES Y MODS)
echo "📦 Fase 3: Farmeando inventario (Apps y Fuentes)..."
paru -S --noconfirm zen-browser-bin spotify-launcher vesktop-bin vscodium-bin kitty ttf-monocraft-nerd prismlauncher linux-wallpaperengine spicetify-cli jre17-openjdk flatpak

# 4. HACKEO DE APLICACIONES (SPICETIFY)
echo "🔧 Fase 4: Rompiendo candados de Spotify..."
sudo chmod a+wr -R ~/.local/share/spotify-launcher/install/usr/share/spotify 2>/dev/null
curl -fsSL https://raw.githubusercontent.com/spicetify/spicetify-marketplace/main/resources/install.sh | sh

# 5. INYECCIÓN DEL SAVE DATA (RESTAURAR CONFIGS)
echo "📂 Fase 5: Inyectando tus archivos de guardado locales..."
# Crea las carpetas destino
mkdir -p ~/.config/caelestia ~/.config/kitty ~/.config/fish/functions ~/.config/neofetch ~/Documents

# Mueve los archivos desde tu repositorio clonado a las entrañas del sistema
cp ./config/caelestia/hypr-user.conf ~/.config/caelestia/ 2>/dev/null
cp ./config/caelestia/user-config.fish ~/.config/caelestia/ 2>/dev/null
cp ./config/kitty/kitty.conf ~/.config/kitty/ 2>/dev/null
cp ./config/fish/functions/fish_greeting.fish ~/.config/fish/functions/ 2>/dev/null
cp ./config/neofetch/config.conf ~/.config/neofetch/ 2>/dev/null

# Configurar el actualizador y el alias
cp ./documents/actualizar_todo.sh ~/Documents/ 2>/dev/null
chmod +x ~/Documents/actualizar_todo.sh
echo 'alias update="bash ~/Documents/actualizar_todo.sh"' >> ~/.config/fish/config.fish

# 6. LANZAR EL MOTOR FINAL
echo "🎮 Fase 6: Cediendo el control al creador..."
echo "El sistema está listo. Ahora se va a ejecutar la compilación de Caelestia."
fish -c "cd ~/.local/share/caelestia && ./install.fish"
```

---

## 🔄 2. El Parche de Temporada (Botón de Actualización)

Una vez que el sistema está instalado, ya no tienes que tocar comandos sueltos en tu vida. Hemos configurado un atajo de teclado en la consola.

Abre la terminal y escribe:
```bash
update
```

Esa simple palabra ejecutará el archivo `~/Documents/actualizar_todo.sh` (que inyectamos en la instalación) y hará lo siguiente:
1. Actualiza Pacman, Arch, CachyOS y el AUR (vía Paru).
2. Actualiza los Flatpaks.
3. Desbloquea de nuevo los permisos de Spotify (porque se cierran al actualizar) y le aplica el parche de Spicetify para que no pierdas la skin de Caelestia.
4. Limpia la basura (dependencias huérfanas) para ahorrar espacio.

---

## 🎮 3. Tabla Maestra de Controles (Keybinds)

El `install.sh` inyecta automáticamente tus macros. Este es tu arsenal:

| Combinación de Teclas | Acción del Sistema | Origen / Estado |
| :--- | :--- | :--- |
| `SUPER + SHIFT + Return` | **Modo Gamer: Abre Spotify, Discord Normal y Steam en paralelo** | **Macro Custom (v3)** |
| `SUPER + Return` | Abre la terminal Kitty (Minecraft Font + Neofetch propio) | Custom (v1) |
| `SUPER + B` | Abre el navegador Zen Browser | Custom (v1) |
| `SUPER + Shift + [1-0]` | Mueve la ventana enfocada al escritorio seleccionado | Custom (v1) |
| `SUPER` | Abre el menú principal de aplicaciones (Lanzador) | Base de Caelestia |
| `SUPER + [1-0]` | Cambia instantáneamente de escritorio virtual | Base de Caelestia |
| `SUPER + C` | Abre el editor de código VSCodium tuneado | Base de Caelestia |
| `SUPER + S` | Oculta/Muestra ventanas en el Workspace Especial | Base de Caelestia |
| `Ctrl + Alt + Suprimir` | Menú de energía (Apagar, Reiniciar, Cerrar Sesión) | Base de Caelestia |
| `Ctrl + SUPER + Alt + R` | Respawn de interfaz (Recarga barra y colores al vuelo) | Base de Caelestia |

---

## 🚨 4. Guía Rápida de Errores Comunes (Por si el meta se rompe)

* **La barra superior desaparece tras actualizar Hyprland:** Es un proceso zombie de Quickshell. Tírale un `pkill -f quickshell && pkill -f caelestia` y vuélvela a invocar con `caelestia shell`.
* **Minecraft da error de Checksum ("Processor failed"):** Estás usando un Java demasiado moderno. Instala `jre17-openjdk`, selecciónalo en los ajustes de la instancia de Prism Launcher y borra la caché corrupta con `rm -rf ~/.local/share/PrismLauncher/libraries/net/minecraft/client/1.20.1-20230612.114412/`.
* **Kitty pierde los colores dinámicos:** Al editar la tipografía Monocraft en `~/.config/kitty/kitty.conf`, asegúrate de no haber borrado nunca la línea `include colors.conf`.
