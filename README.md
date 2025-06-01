# .dotfiles

This repository stores my personal configuration files for GNU/Linux applications and tools that I use, and it's meant to be used alongside [GNU Stow](https://www.gnu.org/software/stow/) for ease of reproducibility.

## Dependencies

Make sure the following tools are installed on your system and available for your user:

- [Git](https://git-scm.com/)
- [GNU Stow](https://www.gnu.org/software/stow/)

### Arch Linux (btw)

```shell
sudo pacman -Sy --needed git stow
```

### Ubuntu

```shell
sudo apt update && sudo apt install git stow
```

## Setup

First, clone this repository locally on your machine using Git. For ease of use, prefer cloning the repo directly onto your home directory.

```shell
cd $HOME

# Clone via SSH (recommended)
git clone git@github.com:fabberr/.dotfiles.git

# Alternatively, clone via HTTPS when SSH is not set up
git clone https://github.com/fabberr/.dotfiles.git
```

Once cloned, you can navigate into the repo and start using Stow to install configuration [packages](https://www.gnu.org/software/stow/manual/stow.html#Terminology). For a full list of packages available on this repo, see the **[Available Packages](#available-packages)** section below.

```shell
cd $HOME/.dotfiles
```

⚠️ **Always ensure the `stow` package is the first to be stowed on fresh installs** to avoid issues with unwanted files being symlinked to the target directory when the [Global Ignore List](https://www.gnu.org/software/stow/manual/stow.html#Types-And-Syntax-Of-Ignore-Lists) is not present while stowing other packages.

```shell
stow stow
```

## Available Packages

The following packages are available. For more details, check each package's corresponding `README.md` file.

- [atuin](https://github.com/fabberr/.dotfiles/tree/master/atuin)
- [bash-preexec](https://github.com/fabberr/.dotfiles/tree/master/bash-preexec)
- [bash](https://github.com/fabberr/.dotfiles/tree/master/bash)
- [bat](https://github.com/fabberr/.dotfiles/tree/master/bat)
- [delta](https://github.com/fabberr/.dotfiles/tree/master/delta)
- [dust](https://github.com/fabberr/.dotfiles/tree/master/dust)
- [fd](https://github.com/fabberr/.dotfiles/tree/master/fd)
- [gamemode](https://github.com/fabberr/.dotfiles/tree/master/gamemode)
- [ghostty](https://github.com/fabberr/.dotfiles/tree/master/ghostty)
- [git](https://github.com/fabberr/.dotfiles/tree/master/git)
- [nvim](https://github.com/fabberr/.dotfiles/tree/master/nvim)
- [ripgrep](https://github.com/fabberr/.dotfiles/tree/master/ripgrep)
- [starship](https://github.com/fabberr/.dotfiles/tree/master/starship)
- [stow](https://github.com/fabberr/.dotfiles/tree/master/stow)
- [yazi](https://github.com/fabberr/.dotfiles/tree/master/yazi)

## Stow Cheat Sheet

The following commands assume that:
1. The Stow directory is located within your home directory (i.e. The directory where you cloned this repo into is a subdirectory of `$HOME`);
2. The current working directory is the Stow directory (i.e. `$HOME/.dotfiles`).

### Creating a package

These commands will create a new Stow package named `<pkgname>` from an existing configuration present in the `<configroot>` directory.

```shell
# Create a new package
mkdir <pkgname>

# Optional: Add any required subdirectories, typically `.config/<pkgname>` or `.local/share/<pkgname>` (i.e. `.config/ghostty`)
mkdir -p <pkgname>/additional/nested/directories

# Optional: Move any existing configuration directories/files into the enw package
mv <configroot> <pgkname>
```

### Installing a package

To install a package, simply run the `stow` command (default `-S/--stow` action), passing the name of the package. This creates all the necessary symbolic links to install the specified package into the target directory.

```shell
stow <pkgname>
```

### Uninstalling a package

Similarly, to uninstall a package, run the `stow` command with the `-D/--delete` flag. This will remove any symbolic links that Stow has previously created for the specified package from the target directory.

```shell
stow -D <pkgname>
```

## Reference Material

[NEVER lose dotfiles again with GNU Stow](https://youtu.be/NoFiYOqnC4o) by [typecraft](https://www.youtube.com/@typecraft_dev).

[Stow has forever changed the way I manage my dotfiles](https://youtu.be/y6XCebnB9gs) by [Dreams of Autonomy](https://www.youtube.com/@dreamsofautonomy).

[Using GNU Stow to manage your dotfiles](https://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html) by [Brandon Invergo](http://brandon.invergo.net/index.html).

[GNU Stow manual](https://www.gnu.org/software/stow/manual/) by the [GNU Project](https://www.gnu.org).

## TODO
- [ ] Setup shell script
- [ ] Add `bash-preexec` as a Git Submodule. Setup a Local Ignore List for it.
