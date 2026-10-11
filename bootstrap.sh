#!/usr/bin/env zsh

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Logging functions
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

check_root() {
    if [[ $EUID -eq 0 ]]; then
        log_error "This script should not be run as root"
        exit 1
    fi
}

check_arch() {
    if ! command -v pacman &> /dev/null; then
        log_error "This script is designed for Arch Linux"
        exit 1
    fi
}

update_system() {
    log_info "Updating system packages..."
    sudo pacman -Syu --noconfirm
    log_success "System updated"
}

install_base_tools() {
    log_info "Installing base tools..."

    sudo pacman -S --needed --noconfirm \
        atuin \
        base-devel \
        bat \
        bluetui \
        btop \
        cargo \
        clang \
        cmake \
        cmatrix \
        coreutils \
        curl \
        eza \
        fastfetch \
        fd \
        feh \
        ffmpeg \
        fzf \
        gettext \
        ghostty \
        git \
        gitui \
        gnupg \
        gnutls \
        gum \
        jq \
        less \
        lua \
        lua51 \
        luarocks \
        nvim \
        obsidian \
        presenterm \
        protobuf \
        pwgen \
        ripgrep \
        silicon \
        sqlite \
        starship \
        stow \
        tmux \
        unzip \
        util-linux \
        wget \
        xh \
        yay \
        yq \
        yt-dlp

    yay -S --needed --noconfirm \
        dropbox-cli \
        telegram-desktop-bin \
        xdg-ninja

    log_success "Base tools installed"
}

# Install programming languages
install_languages() {
    log_info "Installing programming languages..."

    # uv (Python)
    if ! command -v uv &> /dev/null; then
        log_info "Installing uv to manage Python"
        curl -LsSf https://astral.sh/uv/install.sh | sh
        [[ -f "$HOME/.local/share/bin/env" ]] && source "$HOME/.local/share/bin/env"
    fi

    # Rust
    if ! command -v rustup &> /dev/null; then
        log_info "Installing Rust via rustup..."
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
        [[ -f "$HOME/.local/share/cargo/env" ]] && source "$HOME/.local/share/cargo/env"
    fi

    log_success "Programming languages installed"
}

# Install development tools
install_dev_tools() {
    log_info "Installing development tools..."

    # LSP servers and tools
    sudo pacman -S --needed --noconfirm \
        bash-language-server \
        delve \
        gopls \
        lua-language-server \
        prettier \
        stylua \
        typescript-language-server \
        yaml-language-server \
        yamllint

    # Python tools
    if ! command -v uv &> /dev/null; then
        uv tool install pre-commit
        uv tool install pyrefly
        uv tool install ruff
        uv tool install sqlfmt
    fi

    # Helm tools
    yay -S --needed --noconfirm \
        helm-ls-bin

    # Rust tools
    if ! command -v rustup &> /dev/null; then
        rustup component add rust-analyzer
    fi

    log_success "Development tools installed"
}

# Install cloud and DevOps tools
install_cloud_tools() {
    log_info "Installing cloud tools..."

    sudo pacman -S --noconfirm --needed \
        aws-cli \
        helm \
        k9s \
        kubectl \
        kubectx \
        stern \
        tailscale \
        terraform

    yay -S --noconfirm --needed \
        kubecolor

    # Enable and start tailscale service
    sudo systemctl enable --now tailscaled

    # Configure reverse path filtering for Tailscale compatibility
    # Using loose mode (2) to allow Tailscale subnet routing/exit node functionality
    # while still providing spoofing protection
    echo "net.ipv4.conf.default.rp_filter = 2" | sudo tee /etc/sysctl.d/99-tailscale.conf
    echo "net.ipv4.conf.all.rp_filter = 2" | sudo tee -a /etc/sysctl.d/99-tailscale.conf
    sudo sysctl --system

    log_success "Cloud tools installed"
}

# Install AUR helper
install_aur_helper() {
    if ! command -v paru &> /dev/null; then
        log_info "Installing paru AUR helper..."
        sudo pacman -S --needed --noconfirm git base-devel
        local temp_dir=$(mktemp -d)
        git clone https://aur.archlinux.org/paru.git "$temp_dir/paru"
        (cd "$temp_dir/paru" && makepkg -si --noconfirm)
        rm -rf "$temp_dir"
        log_success "paru installed"
    else
        log_info "paru already installed"
    fi
}

# Main installation function
main() {
    log_info "Starting Arch Linux bootstrap..."

    check_root
    check_arch

    update_system
    install_base_tools
    install_languages
    install_dev_tools
    install_cloud_tools
    install_aur_helper

    log_success "Bootstrap completed!"
    log_info "Restart your shell or run 'source ~/.zshrc' to apply changes"
}

# Run main function
main "$@"
