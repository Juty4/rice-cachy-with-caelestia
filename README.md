# 🎮 juty4's Ultimate Caelestia OS Rice (Zero to Hero)

Welcome to the true endgame of Linux ricing. This repository contains my personal **Save Data** and an automated speedrun script to deploy a fully functional, highly optimized Arch Linux (CachyOS) setup using the **Caelestia** Hyprland environment. 

> **👑 ALL CREDITS TO THE BOSS:** > Before we even start, massive respect and full credits go to **[vaxerski](https://github.com/vaxerski)** (and the Hyprland development team). They are the absolute legends who built Hyprland and the original [Caelestia dotfiles](https://github.com/vaxerski/Caelestia). This repository does NOT claim ownership of the core visual environment; it is simply a highly automated deployment wrapper, mod injector, and personal keybind configuration built on top of their masterpiece.

---

## 🎒 The Loot (What's inside this build?)

This automated script transforms a base CachyOS TTY (command-line only) into a fully operational Master Race workstation in minutes. 

* **Core Environment:** Hyprland via Caelestia (Dynamic colors, animations, Wayland perfection).
* **Terminal:** Kitty patched with `ttf-monocraft-nerd` (Minecraft font) and a custom Neofetch startup.
* **Modded Apps:** * **Spotify:** Ad-free and themed via Spicetify.
  * **Discord:** Vesktop with screen-share audio support and the official Caelestia CSS theme injected.
  * **VSCodium:** Telemetry-free editor synced with system dynamic colors.
* **Gaming:** Prism Launcher optimized for Minecraft (Java 17 fix included), Steam, and Linux Wallpaper Engine for animated backgrounds.
* **System Fixes Applied:** D-Bus / GNOME Keyring configured out of the box (Say goodbye to GitHub Desktop login crashes).

---

## 🚀 The Speedrun Installation (1-Click Setup)

If you are starting from a completely blank, freshly installed CachyOS TTY (black screen), just type this ultimate combo. 

*Note: Make sure to replace `[YOUR_GITHUB_USERNAME]` with your actual username if you fork this.*

```bash
git clone https://github.com/[YOUR_GITHUB_USERNAME]/rice-cachy-with-caelestia.git ~/Documents/github/rice-cachy-with-caelestia && cd ~/Documents/github/rice-cachy-with-caelestia && chmod +x install.sh && ./install.sh
```

Go grab a coffee. The script will update the Arch core, download Caelestia, install all AUR packages, break the Spotify permissions to apply Spicetify, set up your GNOME Keyring, inject your custom `.conf` files, and launch the GUI automatically.

---

## 🔄 The Season Patch (1-Click Updater)

I hate typing multiple update commands. This build includes an automated "all-in-one" updater macro. 

Whenever you want to update your system, simply open the terminal and type:

```bash
update
```

**What does this do?**
1. Updates Pacman, Arch core, CachyOS repos, and AUR packages (via `paru`).
2. Updates all installed Flatpaks.
3. Automatically fixes Spotify permissions (which break after every official update) and reapplies your Spicetify theme so you never lose the Caelestia aesthetic.
4. Cleans up orphaned dependencies to free up disk space.

---

## 🎮 Master Keybinds Cheat Sheet

Custom binds injected via `hypr-user.conf`:

| Keybind | System Action | Status |
| :--- | :--- | :--- |
| `SUPER + SHIFT + Return` | **Gamer Mode: Launches Spotify, Discord, and Steam simultaneously** | **Custom Macro** |
| `SUPER + Return` | Opens Kitty Terminal (Monocraft Font + Custom Neofetch) | Custom |
| `SUPER + B` | Opens Zen Browser | Custom |
| `SUPER + Shift + [1-0]` | Moves the focused window to the selected workspace | Custom |
| `SUPER` | Opens the Application Launcher | Default Caelestia |
| `SUPER + [1-0]` | Switches between virtual workspaces | Default Caelestia |
| `SUPER + C` | Opens VSCodium (Themed) | Default Caelestia |
| `SUPER + S` | Toggles the Special Workspace (Quick minimize/hide) | Default Caelestia |
| `Ctrl + Alt + Delete` | Power Menu (Shutdown, Reboot, Logout) | Default Caelestia |
| `Ctrl + SUPER + Alt + R` | GUI Respawn (Reloads Waybar/Quickshell and colors on the fly) | Default Caelestia |

---

## 🚨 Troubleshooting (Boss Fight Mechanics)

* **GitHub Desktop says "The name is not activatable":** The `gnome-keyring` wasn't unlocked. Open "Passwords and Keys" (Seahorse), ensure you have a "Default" keyring, and that its password matches your Linux user password.
* **Top Bar disappears after a Hyprland update:** Quickshell became a zombie process. Open a terminal and run `pkill -f quickshell && pkill -f caelestia` then launch `caelestia shell`.
* **Prism Launcher (Minecraft) throws Checksum Error:** Forge is trying to compile with Java 21+. Go to the instance settings -> Java -> Auto-detect -> Select **Java 17**. Purge the corrupted cache with: `rm -rf ~/.local/share/PrismLauncher/libraries/net/minecraft/client/1.20.1-20230612.114412/`
* **Kitty Terminal loses colors:** If you manually edit `kitty.conf`, ensure the `include colors.conf` line is NEVER deleted.
