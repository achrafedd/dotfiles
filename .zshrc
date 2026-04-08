# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


autoload -Uz vcs_info
precmd_functions+=(vcs_info)

zstyle ':vcs_info:git:*' formats '%b'
zstyle ':vcs_info:git:*' actionformats '%b|%a'

setopt PROMPT_SUBST

_prompt_git() {
  [[ -z $vcs_info_msg_0_ ]] && return

  local branch="$vcs_info_msg_0_"
  local info=""

  # staged files
  local staged=$(git diff --cached --name-only 2>/dev/null | wc -l | tr -d ' ')
  # unstaged modified
  local modified=$(git diff --name-only 2>/dev/null | wc -l | tr -d ' ')
  # untracked
  local untracked=$(git ls-files --others --exclude-standard 2>/dev/null | wc -l | tr -d ' ')

  # ahead / behind remote
  local ahead=0 behind=0
  local remote=$(git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null)
  if [[ -n $remote ]]; then
    ahead=$(git rev-list @{u}..HEAD 2>/dev/null | wc -l | tr -d ' ')
    behind=$(git rev-list HEAD..@{u} 2>/dev/null | wc -l | tr -d ' ')
  fi

  # stashes
  local stashed=$(git stash list 2>/dev/null | wc -l | tr -d ' ')

  # build info string
  [[ $staged    -gt 0 ]] && info+=" %F{#c3e88d} ${staged}%f"
  [[ $modified  -gt 0 ]] && info+=" %F{#ffcb6b} ${modified}%f"
  [[ $untracked -gt 0 ]] && info+=" %F{#ff5370} ${untracked}%f"
  [[ $ahead     -gt 0 ]] && info+=" %F{#82aaff}⇡ ${ahead}%f"
  [[ $behind    -gt 0 ]] && info+=" %F{#f78c6c}⇣ ${behind}%f"
  [[ $stashed   -gt 0 ]] && info+=" %F{#c792ea} ${stashed}%f"

  echo "%F{#c792ea} %F{#89ddff}%F{#fb542b} %f${branch}%f${info}"
}

_prompt_exit() {
  echo "%(?.%F{#c3e88d} ✓.%F{#ff5370} ✗ %?)%f"
}

_prompt_dir() {
  echo "%F{#fff} %~%f"
}

PROMPT='
%F{#fff}◖%K{#ffffff}%F{#2972b6}   %f%K{#183d6e}$(_prompt_dir) %K{#2f2517}$(_prompt_git) %k%F{#2f2517}◗%f
$(_prompt_exit) %F{#ffcb6b}~>%f '

# in lieu of restarting the shell
\. "$HOME/.nvm/nvm.sh"

# Nvim alias
alias vi="nvim"

# Git aliases
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gP="git pull"

# Commends aliases
alias ls="lsd"
alias ll="ls -la"

# Man Pager
export MANPAGER='nvim +Man!'
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
