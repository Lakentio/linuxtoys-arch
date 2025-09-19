# LinuxToys-Arch
A collection of tools for **Arch Linux** in a user-friendly way. This is a specialized fork of [LinuxToys](https://github.com/psygreg/linuxtoys) optimized exclusively for Arch Linux and its derivatives.

![LinuxToys](src/screenshot.png)

## 🎯 Arch Linux Only
This fork removes support for other distributions to focus exclusively on Arch Linux, providing:
- **Simplified installation** using only `pacman`
- **Fixed sudo issues** specific to Arch Linux
- **Optimized performance** without multi-distro overhead
- **Arch-specific features** and package management

## Compatibility
**EXCLUSIVELY** for Arch Linux and derivatives:
- **Arch Linux**
- **EndeavourOS**
- **Manjaro**
- **CachyOS**
- **Garuda Linux**
- **ArcoLinux**
- Other Arch-based distributions

**NOT SUPPORTED**: Debian, Ubuntu, Fedora, RHEL, openSUSE, SUSE

## Usage

### Quick Installation
```bash
# Clone the repository
git clone https://github.com/SEU_USUARIO/linuxtoys-arch.git
cd linuxtoys-arch

# Run directly
./p3/run.py
```

### Automatic Installation (Coming Soon)
```bash
# This will be available once we create releases
curl -fsSL https://raw.githubusercontent.com/SEU_USUARIO/linuxtoys-arch/main/install.sh | bash
```

### Manual Installation
1. Clone this repository
2. Install dependencies: `sudo pacman -S python python-gobject gtk3 zenity`
3. Run: `./p3/run.py`

## Dependencies
For Arch Linux, install the required dependencies:
```bash
sudo pacman -S python python-gobject gtk3 zenity git curl wget
```

## CLI Mode
LinuxToys-Arch supports CLI mode for automation:
```bash
# Edit manifest.txt with your desired scripts
nano p3/manifest.txt

# Run in CLI mode
LT_MANIFEST=1 ./p3/run.py
```

## What's Different from Original LinuxToys

### ✅ Improvements
- **Fixed sudo issues** specific to Arch Linux
- **Simplified codebase** without multi-distro complexity
- **Faster execution** without distribution detection overhead
- **Arch-optimized** package management
- **Cleaner code** focused on pacman only

### 🔧 Technical Changes
- Removed all Debian/Ubuntu/Fedora/SUSE conditions
- Simplified `_install_()` function to use only `pacman`
- Fixed `sudo_rq()` function to work with Arch's sudo behavior
- Updated all scripts to use `echo "$PASSWD" | sudo -S`
- Added automatic password cleanup

## AUR Package (Coming Soon)
We plan to create an AUR package for easy installation:
```bash
# Future installation method
yay -S linuxtoys-arch
# or
paru -S linuxtoys-arch
```

## Contributing
This fork focuses exclusively on Arch Linux. When contributing:
1. Ensure compatibility with Arch Linux and derivatives only
2. Use `pacman` for package management
3. Follow Arch Linux best practices
4. Test on multiple Arch-based distributions

## Credits
- **Original LinuxToys**: [psygreg/linuxtoys](https://github.com/psygreg/linuxtoys)
- **Arch Linux Community** for inspiration and support
- **Contributors** who helped make this fork possible

## License
Same as original LinuxToys - see [LICENSE](LICENSE) file for details.