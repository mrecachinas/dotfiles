#!/usr/bin/env bash
set -euo pipefail

DOTFILES_REPO="${DOTFILES_REPO:-https://github.com/mrecachinas/dotfiles.git}"
CHEZMOI_SOURCE_DIR="${CHEZMOI_SOURCE_DIR:-$HOME/.local/share/chezmoi}"

log() {
    printf '\n==> %s\n' "$*"
}

warn() {
    printf '\n!! %s\n' "$*" >&2
}

with_tty() {
    if [[ -r /dev/tty ]]; then
        "$@" </dev/tty
    else
        "$@"
    fi
}

press_return() {
    local message="$1"

    if [[ -r /dev/tty ]]; then
        printf '%s' "$message" >/dev/tty
        read -r _ </dev/tty || true
    else
        warn "$message"
    fi
}

load_homebrew_shellenv() {
    if [[ -x /opt/homebrew/bin/brew ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [[ -x /usr/local/bin/brew ]]; then
        eval "$(/usr/local/bin/brew shellenv)"
    elif command -v brew >/dev/null 2>&1; then
        eval "$(brew shellenv)"
    fi
}

ensure_xcode_command_line_tools() {
    if xcode-select -p >/dev/null 2>&1; then
        log "Xcode Command Line Tools already installed"
        return
    fi

    log "Installing Xcode Command Line Tools"
    xcode-select --install || true

    until xcode-select -p >/dev/null 2>&1; do
        press_return "Finish the Xcode Command Line Tools installer, then press Return to continue..."
    done
}

ensure_homebrew() {
    load_homebrew_shellenv
    if command -v brew >/dev/null 2>&1; then
        log "Homebrew already installed"
        return
    fi

    log "Installing Homebrew"
    if [[ -r /dev/tty ]]; then
        with_tty /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    load_homebrew_shellenv
}

ensure_chezmoi() {
    if command -v chezmoi >/dev/null 2>&1; then
        log "chezmoi already installed"
        return
    fi

    log "Installing chezmoi"
    brew install chezmoi
}

apply_dotfiles() {
    log "Applying dotfiles"
    if [[ -d "$CHEZMOI_SOURCE_DIR/.git" ]]; then
        with_tty chezmoi update
    else
        with_tty chezmoi init --apply "$DOTFILES_REPO"
    fi
}

print_next_steps() {
    cat <<'EOF'

Setup is complete.

If any account-gated steps were skipped, finish these and rerun the same command:
  - Sign in to the App Store for Mac App Store apps from the Brewfile.
  - Open 1Password and enable the SSH agent in Settings > Developer.
  - Run `gh auth login` for GitHub CLI/git HTTPS credentials.
  - Open Vim and run `:Copilot setup`.

Rerun anytime:
  curl -fsSL https://raw.githubusercontent.com/mrecachinas/dotfiles/main/setup.sh | bash
EOF
}

main() {
    if [[ "$(uname -s)" != "Darwin" ]]; then
        warn "This setup script is only intended for macOS."
        exit 1
    fi

    log "Starting macOS setup"
    ensure_xcode_command_line_tools
    ensure_homebrew
    ensure_chezmoi
    apply_dotfiles
    print_next_steps
}

main "$@"
