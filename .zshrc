# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="robbyrussell"

# History
HIST_STAMPS="yyyy-mm-dd"
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS SHARE_HISTORY AUTO_CD

# Plugins — merged from old i3 dotfiles + current setup
# Standard plugins: $ZSH/plugins/
# Custom plugins:   $ZSH/custom/plugins/
plugins=(
    git
    fzf
    fzf-tab
    aliases                   # list aliases
    cp                        # cp progress bar
    copyfile
    copypath
    copybuffer                # Ctrl+O copies current command line
    history                   # h and hsi for grep
    tmux
    urltools                  # urlencode, urldecode
    web-search                # google <query>
    autojump                  # j <dir> to jump
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-interactive-cd        # cd with fzf
)

source $ZSH/oh-my-zsh.sh

# ─── User configuration ──────────────────────────────────────────

# Modern CLI replacements
alias ls='eza --group-directories-first'
alias ll='eza -lah --git --group-directories-first'
alias la='eza -a --group-directories-first'
alias cat='bat'
alias grep='rg'
alias ports='ss -tulpn'

# find-the-command: suggests packages when command not found
source /usr/share/doc/find-the-command/ftc.zsh quiet

# Alias neofetch to modern fastfetch
alias neofetch='fastfetch'

# Enhanced find-the-command handler with similarity & fuzzy search
command_not_found_handler() {
    local cmd="$1"
    
    # 1. Check alias / replacement advice for archived tools
    if [[ "$cmd" == "neofetch" ]]; then
        echo -e "\033[1;33mfind-the-command:\033[0m '\033[1;36mneofetch\033[0m' was archived & removed from Arch repos. Running \033[1;35mfastfetch\033[0m:\n"
        fastfetch "$@[2,-1]"
        return 0
    fi

    # 2. Try standard find-the-command handler
    if declare -f command_not_found_handle >/dev/null 2>&1; then
        command_not_found_handle "$@"
        local ret=$?
        if [[ $ret -ne 127 ]]; then
            return $ret
        fi
    fi

    # 3. Fuzzy / similarity search via pkgfile
    if type pkgfile &>/dev/null; then
        local matches=($(pkgfile --binaries -r ".*${cmd}.*" 2>/dev/null | head -10))
        if [[ ${#matches[@]} -eq 0 && ${#cmd} -ge 3 ]]; then
            local sub="${cmd:0:3}"
            matches=($(pkgfile --binaries -r ".*${sub}.*" 2>/dev/null | head -10))
        fi

        if [[ ${#matches[@]} -gt 0 ]]; then
            echo -e "\033[1;33mfind-the-command:\033[0m Command '\033[1;31m$cmd\033[0m' not found. Did you mean one of these?"
            for pkg in "${matches[@]}"; do
                echo -e "  \033[1;32m➜\033[0m \033[1;35m$pkg\033[0m"
            done
            return 0
        fi
    fi

    echo -e "\033[1;31mfind-the-command: command not found: \"$cmd\"\033[0m"
    return 127
}

# PATH
export PATH="$PATH:$HOME/.local/bin/"

alias gemma='ANTHROPIC_BASE_URL="http://10.100.100.8:4000/" ANTHROPIC_AUTH_TOKEN="your-litellm-key" claude --model claude-sonnet-9'
alias qwen='ANTHROPIC_BASE_URL="http://10.100.100.8:4000/" ANTHROPIC_AUTH_TOKEN="your-litellm-key" claude --model claude-sonnet-8'
