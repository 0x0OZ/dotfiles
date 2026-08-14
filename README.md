# 🔮 Hyprland Dotfiles & Ricing

Modern, high-performance **Hyprland** (Wayland) dotfiles featuring a dark purple Catppuccin Mocha aesthetic, i3-style workflow, hybrid dGPU power switching, and custom helper scripts.

---

## 🎨 Components & Aesthetic
* **Compositor**: Hyprland 0.56+ (Mauve/Purple gradient borders, smart gaps).
* **Status Bar**: Waybar (Floating pill theme, custom icon rewriters, live clock/date).
* **Terminals**: Kitty (primary GPU-accelerated 14pt JetBrains Mono) & Terminator.
* **Launcher & Dmenu**: Wofi (Catppuccin Mocha purple theme).
* **Notifications**: Mako.
* **Screenshots**: Flameshot GUI (interactive region capture).
* **Lockscreen**: Hyprlock (Blurred background & digital clock).

---

## ⌨️ Shortcuts & Workflow Features

| Action | Shortcut |
| :--- | :--- |
| **Terminal (Kitty)** | **`Super + Return`** |
| **Terminal (Terminator)** | **`Super + Shift + Return`** |
| **Application Launcher** | **`Super + D`** |
| **Interactive Keybindings Menu** | **`Super + /`** or **`F1`** |
| **Language Toggle (EN / AR)** | **`Ctrl + Space`** |
| **Audio Output Switcher (Headphones / Speaker)** | **`Super + P`** |
| **Tabbed Group (i3 style)** | **`Super + W`** *(Cycle: `Alt + Tab`)* |
| **Toggle Floating / Tiling** | **`Super + Space`** |
| **Eject Window from Group & Float** | **`Super + Shift + Space`** or **`Super + Shift + Right-Click`** |
| **Tile & Absorb Window into Group** | **`Super + Shift + Left-Click`** |
| **Preselect Split Direction** | **`Super + H`** *(Right)* / **`Super + Shift + V`** *(Down)* |
| **Screenshot (Flameshot)** | **`Super + Shift + S`** or **`Print`** |
| **Kill Window** | **`Super + Shift + Q`** |
| **Reload Hyprland Config** | **`Super + Shift + R`** or **`Super + Shift + C`** |

---

## 📁 Repository Structure
```
.
├── hypr/
│   ├── hyprland.conf
│   ├── hyprlock.conf
│   ├── hypridle.conf
│   ├── hyprpaper.conf
│   └── scripts/
│       ├── audio-switcher
│       ├── gpu-power-manager
│       ├── group-toggle-back
│       ├── keyhint
│       └── workspace-toggle
├── waybar/
│   ├── config.jsonc
│   └── style.css
├── kitty/
│   └── kitty.conf
├── terminator/
│   └── config
├── wofi/
│   ├── config
│   └── style.css
├── mako/
│   └── config
├── flameshot/
│   └── flameshot.ini
└── .zshrc
```
