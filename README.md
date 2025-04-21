# .dotfiles

This repository stores my personal configuration files for a number of applications/tools and is meant to be used alongside [GNU Stow](https://www.gnu.org/software/stow/) for ease of reproducibility.

# Dependencies

Make sure the following tools are installed on your system:

- [Git](https://git-scm.com/)
- [GNU Stow](https://www.gnu.org/software/stow/)

## Setup on Arch Linux (btw)

```shell
sudo pacman -Sy --needed git stow
```

## Setup on Ubuntu

```shell
sudo apt update && sudo apt install git stow
```

# Installing Configuration Packages

First, clone this repository locally on your machine using Git. The repo is meant to be cloned within your home directory for ease of use.

```shell
cd $HOME

# Clone via SSH (recommended)
git clone git@github.com:fabberr/.dotfiles.git

# Alternatively, clone via HTTPS when SSH is not set up
git clone https://github.com/fabberr/.dotfiles.git
```

Once cloned, you can navigate to the repo and start using Stow to install configuration [packages](https://www.gnu.org/software/stow/manual/stow.html#Terminology). For a full list of available packages names, see **[# Packages](#packages)** below.

⚠️ **Always ensure the `stow` package is the first to be stowed on a fresh installation** to avoid issues with unwanted files being symlinked to the target directory when the [Global Ignore List](https://www.gnu.org/software/stow/manual/stow.html#Types-And-Syntax-Of-Ignore-Lists) is not present while stowing other packages.

```shell
cd .dotfiles/

stow <pkgname>
```

To uninstall a package run the following command:

```shell
stow -D <pkgname>
```

# Packages

The following packages are available. For details on each package, check their corresponding `README.md` file.

- [atuin](https://github.com/fabberr/.dotfiles/tree/master/atuin)
- [bash-preexec](https://github.com/fabberr/.dotfiles/tree/master/bash-preexec)
- [bash](https://github.com/fabberr/.dotfiles/tree/master/bash)
- [bat](https://github.com/fabberr/.dotfiles/tree/master/bat)
- [delta](https://github.com/fabberr/.dotfiles/tree/master/delta)
- [dust](https://github.com/fabberr/.dotfiles/tree/master/dust)
- [fd](https://github.com/fabberr/.dotfiles/tree/master/fd)
- [ghostty](https://github.com/fabberr/.dotfiles/tree/master/ghostty)
- [git](https://github.com/fabberr/.dotfiles/tree/master/git)
- [nvim](https://github.com/fabberr/.dotfiles/tree/master/nvim)
- [ripgrep](https://github.com/fabberr/.dotfiles/tree/master/ripgrep)
- [starship](https://github.com/fabberr/.dotfiles/tree/master/starship)
- [stow](https://github.com/fabberr/.dotfiles/tree/master/stow)
- [yazi](https://github.com/fabberr/.dotfiles/tree/master/yazi)

# Cheat Sheet

Adding a new package:

```shell
mkdir <pkgname>
mkdir -p <pkgname>/additional/nested/directories

mv <configroot> <pgkname>
```

# References

[Stow has forever changed the way I manage my dotfiles](https://youtu.be/y6XCebnB9gs) by Dreams of Autonomy.

[NEVER lose dotfiles again with GNU Stow](https://youtu.be/NoFiYOqnC4o) by typecraft.

[GNU Stow manual](https://www.gnu.org/software/stow/manual/) by the Free Software Foundation.

# TODO
- [ ] Setup shell script
