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
cd ~/.dotfiles
```

⚠️ **Important:** The [`stow`](https://github.com/fabberr/.dotfiles/tree/master/stow) package **should always be installed first** on a fresh system. It provides the [Global Ignore List](https://www.gnu.org/software/stow/manual/stow.html#Types-And-Syntax-Of-Ignore-Lists), which **prevents unwanted files from being symlinked when installing other packages**.

The [`git`](https://github.com/fabberr/.dotfiles/tree/master/git) package should also be installed early in the setup to enable the versioning workflow.

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
mkdir '<pkgname>'

# Optional: create the required directory structure.
mkdir -p '<pkgname>/additional/nested/directories'

# Optional: move existing configuration into the package.
mv '<configroot>' '<pkgname>'
```

### Installing a package

```shell
stow '<pkgname>'
```

This uses Stow's default `-S/--stow` action.

### Uninstalling a package

```shell
stow -D '<pkgname>'
```

## Shell Configurations

Shell configurations should be organized around two ownership boundaries:

- **General shell configuration**: owned by the shell configuration package.
- **Application-specific shell configuration**: owned by their respective application packages.

Application packages should not modify the shell's configuration files or configuration directory structure directly. Instead, they should provide their specific configuration as a **module** (typically a **shell script source file**), which is then **composed** onto the shell's own configuration structure.

### Structure

A shell configuration package should provide, **at least**, the following structure:

```text
<shell package>/ # Stow package root
└── .config/
    └── <shell>/
        ├── modules/          # Application-specific shell configurations store.
        └── .modules_manifest # Known modules for this shell with explicit load order.
```

In addition to the above, a shell package should also provide its own configuration, ranging:

- Startup or initialization logic.
- Environment variable setup.
- Aliases and functions declarations.

For example, the [`bash` package](https://github.com/fabberr/.dotfiles/tree/master/bash) provides:

```text
bash/
├── .config/
│   └── bash/
│       ├── modules/
│       ├── .modules_manifest
│       ├── aliases.bash     # Alias declarations.
│       ├── environment.bash # Environment variable setup, including `PATH`.
│       └── functions.bash   # Function declarations.
├── .bash_logout  # Runs when a Bash login shell terminates.
├── .bash_profile # Runs when a Bash login shell starts.
└── .bashrc       # Typically sourced by `.bash_profile`.
```

In this example, `.bashrc` bootstraps the shell configuration by sourcing the required files under `.config/bash/` and then the modules present under `.config/bash/modules/`.

### Application-specific shell configuration modules

Application-specific shell configuration should be owned by the application package that provides them. Their structure should follow the same shell configuration specification:

```text
<application package>/ # Stow package root
└── .config/
    └── <shell>/
        └── modules/
            └── <module>.<extension>
```

Following the same example, the [`starship` package](https://github.com/fabberr/.dotfiles/tree/master/starship) provides a [Bash configuration module](https://github.com/fabberr/.dotfiles/tree/master/starship/.config/bash/modules/starship.bash), installed by Stow as:

```text
~/.config/bash/modules/starship.bash
```

Each module should verify that their required dependencies are available before applying any configuration. This allows a module to be defined in `.modules_manifest` without causing errors when its corresponding dependencies are not met.

The Starship Bash module, for instance, begins by checking whether the `starship` command is available and immediately stops if not found:

```bash
################################# Preconditions ################################

command -v starship > /dev/null 2>&1 || return
```

### Module loading and manifest

The shell configuration package should be responsible for bootstrapping modules provided by other packages.

Modules shouldn't be be discovered automatically. Instead, `.modules_manifest` explicitly defines the modules available for that shell. The manifest's format is intentionally simple and stripped down as much as possible to enable **easy parsing with the shell's own built-in tools**. It uses a plain, **ordered** list of modules containing:

- One entry per line.
- No comments support.
- No structured data.
- No custom syntax.

For example:

```text
module_a
module_b
module_c
```

The load order of a module is determined by its line in the manifest. Lines read before should have **higher precedence**.

The shell configuration package must use the module names read from the manifest to construct the corresponding module file paths under its modules directory, following the specification:

```text
<module> -> .config/<shell>/modules/<module>.<extension>
```

The shell configuration package should **only load modules defined in its manifest**. For each entry, it should **attempt** to load the corresponding module file, while missing files should be **skipped**.

The module file extension should be **specific** to the shell being configured. This allows the same module name to represent different shell-specific implementations without mixing configuration files for other shells. For example, Bash modules use the **`.bash` extension** instead of the typical `.sh`:

```text
~/.config/bash/modules/<module>.bash
```

Other shells can use **their own file extensions** and corresponding module files, all provided by the **same application package**:

```text
<package>/.config/powershell/modules/<module>.ps1
<package>/.config/zsh/modules/<module>.zsh
<package>/.config/fish/modules/<module>.fish
```

## Reference Material

[NEVER lose dotfiles again with GNU Stow](https://youtu.be/NoFiYOqnC4o) by [typecraft](https://www.youtube.com/@typecraft_dev).

[Stow has forever changed the way I manage my dotfiles](https://youtu.be/y6XCebnB9gs) by [Dreams of Autonomy](https://www.youtube.com/@dreamsofautonomy).

[Using GNU Stow to manage your dotfiles](https://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html) by [Brandon Invergo](http://brandon.invergo.net/index.html).

[GNU Stow manual](https://www.gnu.org/software/stow/manual/) by the [GNU Project](https://www.gnu.org).
