#!/bin/bash
set -e

echo "🍎 Mac Setup Script"
echo "==================="

# 1. Xcode Command Line Tools
if ! xcode-select -p &>/dev/null; then
    echo "📦 Installing Xcode Command Line Tools..."
    xcode-select --install
    echo "⏳ Press any key after Xcode tools installation completes..."
    read -n 1 -s
else
    echo "✅ Xcode Command Line Tools already installed"
fi

# 2. Homebrew
if ! command -v brew &>/dev/null; then
    echo "🍺 Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo "✅ Homebrew already installed"
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# 3. Bootstrap: 1Password + chezmoi
echo "📦 Installing 1Password and chezmoi..."
brew install --cask 1password || true
brew install chezmoi || true

# 4. 1Password setup (for SSH keys)
echo ""
echo "🔐 Set up 1Password now (enable SSH agent in Settings > Developer)"
echo "   Press any key after 1Password is configured..."
read -n 1 -s

# 5. Chezmoi + dotfiles
echo "📦 Applying dotfiles with chezmoi..."
if [[ ! -d "$HOME/.local/share/chezmoi" ]]; then
    chezmoi init --apply git@github.com:mrecachinas/dotfiles.git
else
    chezmoi update
fi

# 6. Full Brewfile
if [[ -f ~/.Brewfile ]]; then
    echo "📦 Installing from Brewfile..."
    brew bundle --file=~/.Brewfile
else
    echo "⚠️  No ~/.Brewfile found, skipping brew bundle"
fi

# 7. vim-plug
if [[ ! -f ~/.vim/autoload/plug.vim ]]; then
    echo "📦 Installing vim-plug..."
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    vim +PlugInstall +qall
else
    echo "✅ vim-plug already installed"
fi

# 8. nvm (fetch latest version from GitHub)
if [[ ! -d "$HOME/.nvm" ]]; then
    echo "📦 Installing nvm (latest)..."
    NVM_LATEST=$(curl -s https://api.github.com/repos/nvm-sh/nvm/releases/latest | grep '"tag_name"' | cut -d'"' -f4)
    echo "   Found version: $NVM_LATEST"
    curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/${NVM_LATEST}/install.sh" | bash
else
    echo "✅ nvm already installed"
fi

echo ""
echo "🎉 Setup complete!"
echo ""
echo "Manual steps remaining:"
echo "  - Open Vim and run :Copilot setup"
echo "  - Restart your terminal to load nvm"
