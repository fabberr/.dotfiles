# .dotfiles

Personal configuration files for applications and tools, managed with [GNU Stow](https://www.gnu.org/software/stow/) + [Git](https://git-scm.com) versioning.

## Dependencies

Make sure the following tools are installed and available:

- [Git](https://git-scm.com/)
- [GNU Stow](https://www.gnu.org/software/stow/)

### Arch Linux <sup>(btw)</sup>

```shell
sudo pacman -S --needed git stow
```

### Ubuntu

```shell
sudo apt install git stow
```

### Other distributions / operating systems

Check your system's package repositories for installation instructions.

## Setup

Clone this repository into your home directory:

```shell
cd ~

# Clone via SSH (recommended)
git clone git@github.com:fabberr/.dotfiles.git

# Alternatively, clone via HTTPS when SSH is not set up
git clone https://github.com/fabberr/.dotfiles.git
```

Then enter the repository, which contain several Stow [packages](https://www.gnu.org/software/stow/manual/stow.html#Terminology).

```shell
cd "~/.dotfiles"
```

⚠️ **Important:** The [`stow`](https://github.com/fabberr/.dotfiles/tree/master/stow) package **should always be installed first** on a fresh system. It provides the [Global Ignore List](https://www.gnu.org/software/stow/manual/stow.html#Types-And-Syntax-Of-Ignore-Lists), which **prevents unwanted files from being symlinked when installing other packages**.

The [`git`](https://github.com/fabberr/.dotfiles/tree/master/git) package should also be installed early in the setup to enable the versioning process.

```shell
stow stow
stow git
```

## Stow Cheat Sheet

The following commands assume that:

1. This repository was cloned directly under your home directory.
2. Your current working directory is the repository root (i.e. `~/.dotfiles`).

### Creating a package


```shell
mkdir <pkgname>

# Optional: create the required directory structure.
mkdir -p <pkgname>/additional/nested/directories

# Optional: move existing configuration into the package.
mv <configroot> <pkgname>
```

### Installing a package

```shell
stow <pkgname>
```

This uses Stow's default `-S/--stow` action.

### Uninstalling a package

```shell
stow -D <pkgname>
```

## Reference Material

[NEVER lose dotfiles again with GNU Stow](https://youtu.be/NoFiYOqnC4o) by [typecraft](https://www.youtube.com/@typecraft_dev).

[Stow has forever changed the way I manage my dotfiles](https://youtu.be/y6XCebnB9gs) by [Dreams of Autonomy](https://www.youtube.com/@dreamsofautonomy).

[Using GNU Stow to manage your dotfiles](https://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html) by [Brandon Invergo](http://brandon.invergo.net/index.html).

[GNU Stow manual](https://www.gnu.org/software/stow/manual/) by the [GNU Project](https://www.gnu.org).
