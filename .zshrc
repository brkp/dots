export  ZSH="$HOME/.oh-my-zsh"

export PYTHONDONTWRITEBYTECODE=1
export SDL_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR=0
export PYGAME_HIDE_SUPPORT_PROMPT=1
export DEBUGINFOD_URLS="https://debuginfod.archlinux.org"

ZSH_THEME="daveverwer"

plugins=(
    git
)

alias n="./n.py"
alias nv="nvim"
alias nd="neovide"
alias lg="lazygit"
alias premake="premake5"
alias ipython="ipython --no-banner"
alias hexdump="hexdump -e '\"%08_ax  \" 8/1 \"%02x \" \"  \" 8/1 \"%02x \" \"\n\"'"

precmd() {
    rehash;
    # printf "\e[4 q";
}

osu() {
    pkill warpd;
    pkill dunst;

    # WINEPREFIX=~/.osu-wine WINEARCH=win32 wine $HOME/.osu/osu\!.exe;
    cd /home/brk/.steam/steam/steamapps/common/McOsu/
    ./McEngine
    cd ~

    warpd;
    dunst & disown;
}

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

source $ZSH/oh-my-zsh.sh
source $HOME/.profile

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# opam configuration
[[ ! -r /home/brk/.opam/opam-init/init.zsh ]] || source /home/brk/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

source /home/brk/.config/broot/launcher/bash/br
