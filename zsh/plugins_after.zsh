# External plugins (initialized after)

plugins=(archlinux git systemd yapipenv zsh_reload fast-syntax-highlighting history-substring-search)

function is_plugin() {
  local base_dir=$1
  local name=$2
  test -f $base_dir/plugins/$name/$name.plugin.zsh || test -f $base_dir/plugins/$name/_$name
}

for plugin ($plugins); do
  if is_plugin $ZSH_CUSTOM $plugin; then
    fpath=($ZSH_CUSTOM/plugins/$plugin $fpath)
  elif is_plugin $ZSH $plugin; then
    fpath=($ZSH/plugins/$plugin $fpath)
  else
    echo "[oh-my-zsh] plugin '$plugin' not found"
  fi
done


for plugin ($plugins); do
    if [[ -f $ZSH_CUSTOM/plugins/$plugin/$plugin.plugin.zsh ]]; then
        source $ZSH_CUSTOM/plugins/$plugin/$plugin.plugin.zsh
    elif [[ -f $ZSH/plugins/$plugin/$plugin.plugin.zsh ]]; then
        source $ZSH/plugins/$plugin/$plugin.plugin.zsh
    fi
done

# dircolors

if [[ "$(tput colors)" == "256" ]]; then
    eval $(dircolors =(cat ~/.shell/plugins/dircolors-solarized/dircolors.256dark ~/.shell/dircolors.extra))
fi
