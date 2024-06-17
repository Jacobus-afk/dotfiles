# DotFiles and other general workflow improvements

## Installing dotfiles on new workstation

Clone the repo:

```shell
git clone https://github.com/Jacobus-afk/dotfiles.git
```

### Requirements

Stow

```shell
sudo apt install stow
```

### Applying new config

For example nvim

```shell
stow -S nvim
```

## Handling Python env files

Automatically applying python env files is a bit of a headache.
There are some nvim plugins that attempt to attach a
venv(`swenv.nvim` is one) but they're not fully realised.
The cleanest solution I could find is to use **direnv**

### Installation

- Ubuntu

  ```shell
  sudo apt  install direnv
  ```

- Add the following to the end of .zshrc

  ```shell
  eval "$(direnv hook zsh)"
  ```

### Configuring a python project

To allow **direnv** to automatically enable the virtual environtment,
add a `.envrc` file to your project that contains the following:

```shell
source <VENV_NAME>/bin/activate
unset PS1
```

## Better git diffs with delta

### Delta Installation

Follow the [delta installation
instructions](https://dandavison.github.io/delta/installation.html). For
Ubuntu, use the latest .deb package on the
[releases](https://github.com/dandavison/delta/releases) page.

```shell
wget https://github.com/dandavison/delta/releases/download/0.17.0/git-delta-musl_0.17.0_amd64.deb
sudo dpkg -i git-delta-musl_0.17.0_amd64.deb
```

### Configuration

Edit `~/.gitconfig` and add the following

```shell
[core]
    pager = delta

[interactive]
    diffFilter = delta --color-only

[delta]
    navigate = true    # use n and N to move between diff sections
    line-numbers = true


    # delta detects terminal colors automatically; set one of these to disable auto-detection
    # dark = true
    # light = true

[merge]
    conflictstyle = diff3

[diff]
    colorMoved = default
```

## Better syntax highlighting with semshi

[Semshi](https://github.com/numirias/semshi) provides semantic highlighting for
python in neovim. It results in things like functions not having the same
default highlighting as variables. One caveat, though is that it **requires
pynvim in the venv**

## Better directory traversal with zoxide

## Search with fzf
