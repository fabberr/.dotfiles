# .dotfiles

This repository stores my personal configuration files for a number of applications and is meant to be used alongside [GNU Stow](https://www.gnu.org/software/stow/) for ease of reproducibility.

# Dependencies

- [Git](https://git-scm.com/)
- [GNU Stow](https://www.gnu.org/software/stow/)

## Setup on Arch Linux (btw)

```shell
sudo pacman -Sy --needed git stow
```

## Setup on Ubuntu

```shell
sudo apt update
sudo apt install git stow
```

# Installing Configuration Packages

This repo is meant to be placed within your home directory for ease of use.

```shell
cd $HOME

# Clone via SSH (recommended)
git clone git@github.com:fabberr/.dotfiles.git

# Clone via HTTPS
git clone https://github.com/fabberr/.dotfiles.git
```

Once cloned, navigate to the repo and use the `stow` command for setting up the appropriate symlinks for the given [package](https://www.gnu.org/software/stow/manual/stow.html#Terminology). For a list of available packages, see **[# Packages](#packages)** below.

```shell
cd .dotfiles/

stow <pkgname>
```

## Packages

## Cheat Sheet

Adding a new package:

```shell
mkdir <pkgname>
mkdir -p <pkgname>/additional/nested/directories

mv <configroot> <pgkname>

stow <pkgname>
```

## TODO
- [ ] Setup shell script
