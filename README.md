# Global Opacity for Omarchy

A compact Omarchy bar widget for adjusting the opacity of normal windows.
It is self-contained and does not modify Omarchy's packaged files or the
user's Hyprland configuration.

## Install

```bash
omarchy plugin add git@github.com:g-un--/global-opacity.git --enable
omarchy bar move global.opacity --after omarchy.weather
```

Because this repository is private, the machine must have an SSH key with
access to the repository before installation.

## Use

- Left-click lowers opacity by 5%.
- Scroll adjusts opacity by 5%.
- Right-click restores 100% opacity.
- The selected value is restored when `omarchy-shell` starts.

The minimum opacity is 35%. Fullscreen and hidden windows are not changed.

## Update

```bash
omarchy plugin update global.opacity
```

## Requirements

- Omarchy 4 with the Quickshell-based bar
- Hyprland's Lua configuration parser
- `jq` (included with Omarchy)
