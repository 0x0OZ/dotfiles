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

# Enhanced find-the-command handler with generic similarity & typo recovery
command_not_found_handler() {
    local cmd="$1"

    if type pkgfile &>/dev/null; then
        # 1. Exact binary lookup in package repos
        local pkgs=($(pkgfile --binaries -- "$cmd" 2>/dev/null))
        if [[ ${#pkgs[@]} -gt 0 ]]; then
            echo -e "\033[1;33mfind-the-command:\033[0m Command '\033[1;36m$cmd\033[0m' can be found in package(s):"
            for p in "${pkgs[@]}"; do
                echo -e "  \033[1;32m➜\033[0m \033[1;35m$p\033[0m"
            done
            return 0
        fi

        # 2. Similarity & Typo Recovery search
        local matches=()
        local search_term="$cmd"
        while [[ ${#search_term} -ge 3 && ${#matches[@]} -eq 0 ]]; do
            matches=($(pkgfile --binaries -r ".*${search_term}.*" 2>/dev/null | head -10))
            if [[ ${#matches[@]} -eq 0 ]]; then
                search_term="${search_term:0:-1}"
            fi
        done

        # Sub-word token fallback for compound command names
        if [[ ${#matches[@]} -le 1 && ${#cmd} -ge 5 ]]; then
            local token="${cmd: -5}"
            local extra_matches=($(pkgfile --binaries -r ".*${token}.*" 2>/dev/null | head -5))
            matches=(${matches[@]} ${extra_matches[@]})
        fi

        if [[ ${#matches[@]} -gt 0 ]]; then
            echo -e "\033[1;33mfind-the-command:\033[0m Command '\033[1;31m$cmd\033[0m' not found. Similar package suggestions:"
            for p in "${matches[@]}"; do
                echo -e "  \033[1;32m➜\033[0m \033[1;35m$p\033[0m"
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
