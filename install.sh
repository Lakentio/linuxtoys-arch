#!/bin/sh
# LinuxToys-Arch Quick Installer

echo "================== LinuxToys-Arch Installer ===================="
echo "Installing LinuxToys optimized for Arch Linux and derivatives"
echo

# Check if running on Arch Linux
if ! command -v pacman >/dev/null 2>&1; then
    echo "❌ ERROR: This installer is for Arch Linux only"
    echo "This fork is optimized exclusively for Arch Linux and derivatives:"
    echo "- Arch Linux"
    echo "- EndeavourOS" 
    echo "- Manjaro"
    echo "- CachyOS"
    echo "- Garuda Linux"
    echo "- ArcoLinux"
    echo
    echo "For other distributions, please use the original LinuxToys:"
    echo "https://github.com/psygreg/linuxtoys"
    exit 1
fi

echo "✅ Detected Arch Linux system"
echo

# Check dependencies
echo "Checking dependencies..."
missing_deps=""

if ! command -v python >/dev/null 2>&1; then
    missing_deps="$missing_deps python"
fi

if ! command -v zenity >/dev/null 2>&1; then
    missing_deps="$missing_deps zenity"
fi

if ! command -v git >/dev/null 2>&1; then
    missing_deps="$missing_deps git"
fi

if ! command -v curl >/dev/null 2>&1; then
    missing_deps="$missing_deps curl"
fi

if [ -n "$missing_deps" ]; then
    echo "Installing missing dependencies: $missing_deps"
    echo "Please enter your password when prompted:"
    sudo pacman -S --noconfirm python python-gobject gtk3 zenity git curl wget
fi

echo "✅ Dependencies satisfied"
echo

# Get latest release
echo "Downloading latest LinuxToys-Arch..."
tag=$(curl -fsSL "https://api.github.com/repos/SEU_USUARIO/linuxtoys-arch/releases/latest" 2>/dev/null | grep -o '"tag_name": *"[^"]*"' | sed 's/.*"tag_name": *"\([^"]*\)".*/\1/')

if [ -z "$tag" ]; then
    echo "⚠️  No releases found, using main branch"
    tag="main"
fi

echo "Installing version: $tag"

# Download and extract
cd "$HOME" || exit 1
curl -fsSL "https://github.com/SEU_USUARIO/linuxtoys-arch/archive/refs/heads/main.tar.gz" -o linuxtoys-arch.tar.gz

if [ $? -ne 0 ]; then
    echo "❌ ERROR: Failed to download LinuxToys-Arch"
    exit 1
fi

# Extract
tar -xzf linuxtoys-arch.tar.gz
rm linuxtoys-arch.tar.gz

# Move to final location
if [ -d "linuxtoys-arch" ]; then
    rm -rf "$HOME/.local/share/linuxtoys-arch" 2>/dev/null
    mv linuxtoys-arch "$HOME/.local/share/linuxtoys-arch"
else
    echo "❌ ERROR: Extraction failed"
    exit 1
fi

# Create desktop entry
mkdir -p "$HOME/.local/share/applications"
cat > "$HOME/.local/share/applications/linuxtoys-arch.desktop" << EOF
[Desktop Entry]
Name=LinuxToys-Arch
Comment=Tools for Arch Linux
Exec=$HOME/.local/share/linuxtoys-arch/p3/run.py
Icon=$HOME/.local/share/linuxtoys-arch/src/linuxtoys.svg
Terminal=false
Type=Application
Categories=System;
EOF

# Create symlink for easy access
mkdir -p "$HOME/.local/bin"
ln -sf "$HOME/.local/share/linuxtoys-arch/p3/run.py" "$HOME/.local/bin/linuxtoys-arch"

echo
echo "🎉 LinuxToys-Arch installed successfully!"
echo
echo "You can now run LinuxToys-Arch in several ways:"
echo "1. From Applications menu: LinuxToys-Arch"
echo "2. From terminal: linuxtoys-arch"
echo "3. Direct execution: $HOME/.local/share/linuxtoys-arch/p3/run.py"
echo
echo "To update LinuxToys-Arch, simply run this installer again."
echo
echo "For more information, visit: https://github.com/SEU_USUARIO/linuxtoys-arch"