export ZDOTDIR=${ZDOTDIR:-~/.config/zsh}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-~/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:-~/.local/share}
export XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR:-~/.xdg}

skip_global_compinit=1

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s ${ZDOTDIR:-~}/.zprofile ]]; then
  source ${ZDOTDIR:-~}/.zprofile
fi
