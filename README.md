# Global Opacity

A private Omarchy bar widget for adjusting window transparency globally.

The moon icon sits beside the weather widget. Left-click lowers opacity by 5%,
mouse-wheel adjusts it by 5%, and right-click restores 100% opacity.

## Installed files

- `~/.config/omarchy/plugins/global.opacity/` — widget and manifest
- `~/.local/bin/omarchy-global-opacity` — Hyprland integration
- `~/.config/hypr/hyprland.lua` — persistent rule for new windows

To install from this repository:

```bash
mkdir -p ~/.config/omarchy/plugins/global.opacity ~/.local/bin
cp Widget.qml manifest.json ~/.config/omarchy/plugins/global.opacity/
cp omarchy-global-opacity ~/.local/bin/
chmod +x ~/.local/bin/omarchy-global-opacity
cp hyprland.lua.snippet /tmp/global-opacity-hyprland.lua.snippet
omarchy-shell shell rescanPlugins
```
