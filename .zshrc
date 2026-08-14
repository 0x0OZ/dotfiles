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

# PATH
export PATH="$PATH:$HOME/.local/bin/"



alias gemma='ANTHROPIC_BASE_URL="http://10.100.100.8:4000/" ANTHROPIC_AUTH_TOKEN="your-litellm-key" claude --model claude-sonnet-9'
alias qwen='ANTHROPIC_BASE_URL="http://10.100.100.8:4000/" ANTHROPIC_AUTH_TOKEN="your-litellm-key" claude --model claude-sonnet-8'
