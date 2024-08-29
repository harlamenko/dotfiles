# Setup fzf
# ---------
if [[ ! "$PATH" == */home/hav/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/hav/.fzf/bin"
fi

eval "$(fzf --bash)"
