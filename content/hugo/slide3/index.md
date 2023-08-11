---
title: Install Hugo
weight: 3
---

![Install Hugo][01]

Hugo is cross-platform and can be installed on Windows, Linux, macOS, and other operating systems.
Here's how you can install Hugo on these various platforms:

## macOS

Install Hugo using Homebrew. Homebrew is a package manager for macOS. If you don't have Homebrew
installed, you can get it from [brew.sh](https://brew.sh/). Once Homebrew is installed, run the
following command to install Hugo extended:

```powershell
brew install hugo
```

## Windows

Install Hugo using Winget. Winget is a package manager for Windows. If you don't have Winget
installed, see
[Install Winget](https://learn.microsoft.com/en-us/windows/package-manager/winget/#install-winget).

```powershell
winget install Hugo.Hugo.Extended
```

## Linux

On Linux, Hugo can be installed through package managers or via a snap package.

```bash
sudo snap install hugo
```

## Verify installation

After installation, you can verify that Hugo was installed correctly:

```powershell
hugo version
```

This should show the installed version of Hugo.

Remember, Hugo has two variants: one with and one without extended features (like SASS/SCSS
support). If you need the extended features, get the ’extended’ version from the releases page or
install it according to the platform instructions.

<!-- link references -->
[01]: slide3.png
