# Dotfiles

## New macOS setup

Start fresh, then run:

```sh
curl -fsSL https://raw.githubusercontent.com/mrecachinas/dotfiles/main/setup.sh | bash
```

The script is idempotent and safe to rerun. It installs Xcode Command Line Tools, Homebrew, and chezmoi, then lets chezmoi apply the dotfiles and run the rest of the setup.

Chezmoi-managed setup installs or updates:

- Homebrew dependencies from `~/.Brewfile`
- vim-plug and Vim plugins

Some account-gated setup still needs an interactive sign-in:

- Sign in to the App Store for `mas` apps.
- Open 1Password and enable the SSH agent in Settings > Developer.
- Rerun setup (or `chezmoi apply`) after installing 1Password; Git commit signing is only configured when `op-ssh-sign` is present.
- Run `gh auth login` for GitHub CLI/git HTTPS credentials.
- Open Vim and run `:Copilot setup`.

## GitHub Codespaces

Select this repository as your dotfiles repository at [github.com/settings/codespaces](https://github.com/settings/codespaces); Codespaces runs the generated `install.sh` automatically. It skips Homebrew, `mas`, and macOS-only files, and leaves Git identity, signing, and credential configuration to Codespaces.

Enable GPG verification in Codespaces settings for signed commits. Put project toolchains in each repository's devcontainer. After pulling these changes on your Mac, run `chezmoi init` once to generate the new config.
