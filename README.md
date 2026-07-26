# Dotfiles

## New macOS setup

Start fresh, then run:

```sh
curl -fsSL https://raw.githubusercontent.com/mrecachinas/dotfiles/main/setup.sh | bash
```

The script is idempotent and safe to rerun. It installs Xcode Command Line Tools, Homebrew, and chezmoi, then lets chezmoi apply the dotfiles and run the rest of the setup.

Chezmoi-managed setup installs or updates:

- Oh My Zsh
- Homebrew dependencies from `~/.Brewfile`
- vim-plug and Vim plugins
- nvm

Some account-gated setup still needs an interactive sign-in:

- Sign in to the App Store for `mas` apps.
- Open 1Password and enable the SSH agent in Settings > Developer.
- Run `gh auth login` for GitHub CLI/git HTTPS credentials.
- Open Vim and run `:Copilot setup`.
