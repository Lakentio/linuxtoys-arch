# LinuxToys-Arch Fork Information

## Fork Purpose
This is a specialized fork of LinuxToys optimized exclusively for Arch Linux and its derivatives.

## Key Changes Made

### 1. Removed Multi-Distro Support
- Removed all conditions for Debian/Ubuntu/Fedora/SUSE
- Simplified codebase to focus only on Arch Linux
- Reduced complexity and improved performance

### 2. Fixed Arch-Specific Issues
- **Sudo TTY Issue**: Fixed the `sudo: a terminal is necessary to read the password` error
- **Password Management**: Implemented proper password handling with `echo "$PASSWD" | sudo -S`
- **Package Management**: Simplified to use only `pacman`

### 3. Technical Improvements
- Updated `sudo_rq()` function to export `PASSWD` globally
- Modified `_install_()` function to use only `pacman`
- Added automatic password cleanup with `unset PASSWD`
- Updated 41+ scripts to remove multi-distro conditions

## Files Modified
- `p3/libs/linuxtoys.lib` - Core library functions
- `p3/scripts/` - All scripts updated for Arch only
- `README.md` - Updated for fork documentation
- `README_ARCH.md` - Detailed Arch-specific documentation

## Branch Structure
- `main` - Main development branch for Arch Linux

## Future Plans
1. Create AUR package for easy installation
2. Add Arch-specific features and optimizations
3. Maintain compatibility with upstream when relevant

## How to Contribute
1. Fork this repository
2. Create a feature branch
3. Make changes focused on Arch Linux
4. Test on multiple Arch-based distributions
5. Submit a pull request

## Original Project
- **Repository**: https://github.com/psygreg/linuxtoys
- **Website**: https://linuxtoys.luminhost.xyz
- **License**: Same as original (see LICENSE file)
