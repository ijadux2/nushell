# Nushell Configuration

A custom Nushell setup with Catppuccin Mocha theme and productivity-focused configurations.

## Features

- **Catppuccin Mocha Theme**: Beautiful dark theme with comprehensive color configuration
- **Custom Aliases**: Productivity-focused aliases for common operations
- **Integrated Tools**: Starship prompt, zoxide navigation, and more
- **Enhanced Prompt**: Custom left/right prompts with time and exit codes

## Installation

Run the setup script:

```bash
./setup.sh
```

This will:
- Install Nushell via the Gemfury repository
- Set up the configuration files in `~/.config/nushell/`
- Configure all necessary components

## Configuration Files

- `catppuccin_mocha.nu` - Catppuccin Mocha color theme and syntax highlighting
- `config.nu` - Main configuration with aliases and settings
- `env.nu` - Environment configuration and prompt definitions
- `setup.sh` - Installation script

## Key Aliases

| Alias | Command |
|-------|---------|
| `v` | nvim |
| `th` | thunar \* |
| `y` | yazi |
| `lt` | eza --icons --tree |
| `code` | opencode |
| `ai` | ollama run jadu:coder |
| `i` | sudo dnf install |
| `r` | sudo dnf remove |

## Requirements

- Nushell (installed via setup script)
- Starship (auto-configured)
- Zoxide (auto-configured)
- Various tools: nvim, thunar, yazi, eza, ollama, etc.