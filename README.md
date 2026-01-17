# Dotfiles

## New macOS Setup

 1. Start fresh — don't try to copy an existing laptop
 2. Run the setup script:

```sh
	curl -fsSL https://raw.githubusercontent.com/mrecachinas/dotfiles/main/setup.sh | bash
```

Or if you've already cloned the repo:

```sh
./setup.sh
```

The script will:

 - Install Xcode Command Line Tools
 - Install Homebrew
 - Install 1Password and chezmoi (pauses for 1Password SSH setup)
 - Apply dotfiles via chezmoi
 - Install everything from ~/.Brewfile
 - Install vim-plug and plugins
 - Install nvm

 After setup completes:
   - Open Vim and run `:Copilot setup`
   - Restart your terminal to load `nvm`
