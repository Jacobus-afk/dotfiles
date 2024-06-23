# Handling Python env files

Automatically applying python env files is a bit of a headache.
There are some nvim plugins that attempt to attach a
venv(`swenv.nvim` is one) but they're not fully realised.
The cleanest solution I could find is to use **direnv**

## Installation

- Ubuntu

  ```zsh
  sudo apt  install direnv
  ```

- Add the following to the end of .zshrc

  ```zsh
  eval "$(direnv hook zsh)"
  ```

## Configuring a python project

To allow **direnv** to automatically enable the virtual environtment,
add a `.envrc` file to your project that contains the following:

```.envrc
export VIRTUAL_ENV=<YOUR_PROJECT_ENV_DIR>
layout python3
```
