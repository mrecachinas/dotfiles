# Dotfiles

## New macOS setup

Start fresh, then run:

```sh
curl -fsSL https://raw.githubusercontent.com/mrecachinas/dotfiles/main/setup.sh | bash
```

The script is idempotent and safe to rerun. It installs Xcode Command Line Tools, Homebrew, and chezmoi, then lets chezmoi apply the dotfiles and run the rest of the setup.

Chezmoi-managed setup installs or updates:

- Version-pinned developer tools from `~/.config/mise/config.toml`, installed before the Homebrew bundle
- Remaining Homebrew dependencies from `~/.Brewfile`: native libraries, build tools, services, apps, and tools without a verified native mise installation
- vim-plug and Vim plugins

On macOS, mise owns the CLI tools declared in its config; the Brewfile no longer
declares those tools. Shell initialization puts mise tools first, and Git's
GitHub credential helper uses `gh` from `PATH`. Existing Node and Ruby pins are
unchanged. The initial CLI pins match the installed Homebrew versions rather
than upgrading tools during migration. Update the pins in the chezmoi source
config and run `chezmoi apply` to persist tool upgrades across machines.

This is a staged migration, not a Homebrew uninstall. It does not remove installed
formulae, stop services, or modify database data. Keep Homebrew for the remaining
Brewfile, including PostgreSQL 14 and launchdns service management, Mac App Store
apps, VS Code extensions, and Go/Cargo/uv packages. Do not run
`brew bundle cleanup --force` as part of this migration.
Docker remains unlinked, and the existing VS Code Insiders and 1Password app
choices are preserved.
The tested aqua packages for `btop` and `tokei` were unsupported; `dasel`, `dust`,
and `hyperfine` downloaded Intel-only binaries that could not run on this Mac.
Those tools remain in Homebrew rather than requiring Rosetta or changing versions.

Some account-gated setup still needs an interactive sign-in:

- Sign in to the App Store for `mas` apps.
- Open 1Password and enable the SSH agent in Settings > Developer.
- Rerun setup (or `chezmoi apply`) after installing 1Password; Git commit signing is only configured when `op-ssh-sign` is present.
- Run `gh auth login` for GitHub CLI/git HTTPS credentials.
- Open Vim and run `:Copilot setup`.

Setup attempts Mac App Store apps by default; it does not use the unsupported
`mas account` command to guess sign-in status. If a bundle installation fails,
setup reports the failure and does not record it as complete.

To explicitly skip Mac App Store apps while signed out:

```sh
DOTFILES_SKIP_MAS=1 chezmoi apply
```

For a new Mac, pass the variable to the setup shell:

```sh
curl -fsSL https://raw.githubusercontent.com/mrecachinas/dotfiles/main/setup.sh | DOTFILES_SKIP_MAS=1 bash
```

After signing in, run `chezmoi apply` without `DOTFILES_SKIP_MAS` to include the
Mac App Store apps.

## GitHub Codespaces

Select this repository as your dotfiles repository at [github.com/settings/codespaces](https://github.com/settings/codespaces); Codespaces runs the generated `install.sh` automatically. It skips Homebrew, `mas`, and macOS-only files, and leaves Git identity, signing, and credential configuration to Codespaces.

Enable GPG verification in Codespaces settings for signed commits. Put project toolchains in each repository's devcontainer. After pulling these changes on your Mac, run `chezmoi init` once to generate the new config.
