---
title: Install Hugo
weight: 3
---

![Install Hugo][01]

Hugo is a fast and flexible static site generator. You can use it to build websites without relying
on databases or complex setups. Here's how you can install Hugo on various platforms:

## macOS

If you don't have Homebrew installed, you can get it from [brew.sh](https://brew.sh/). Once Homebrew
is ready:

```bash
brew install hugo
```

## Windows

```powershell
winget install Hugo.Hugo.Extended
```

## Linux

On Linux, Hugo can be installed through package managers or by manually downloading the binary.

```bash
sudo snap install hugo
```

## From Source

If you have Go set up and want to install Hugo from source:

```bash
go get -v github.com/gohugoio/hugo
```

After installation, you can verify that Hugo was installed correctly:

```powershell
hugo version
```

This should show the installed version of Hugo.

Remember, there are two variants of Hugo: one with and one without extended features (like SASS/SCSS
support). If you need the extended features, make sure to get the 'extended' version from the
releases page or install accordingly based on the platform instructions.

<!-- link references -->
[01]: slide3.png
