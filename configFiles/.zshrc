# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="${PATH}:${HOME}/.local/bin/"
export TERMINAL="alacritty"

#===========================SOURCE ENVIRONMENT SPECIFIC========================#
source $HOME/.config/local-env/.paths.zsh
source $HOME/.config/local-env/.aliases.zsh
source $HOME/.config/local-env/.ssh.zsh


# =========================================ANTIGEN=============================#
source $HOME/antigen.zsh
# Load the oh-my-zsh's library.
antigen use oh-my-zsh
# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle git
antigen bundle command-not-found
antigen bundle ael-code/zsh-colored-man-pages
antigen bundle httpie
antigen bundle docker
antigen bundle git-extras
antigen bundle zsh-users/zsh-completions
# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
# Load antigen the theme.
antigen bundle sindresorhus/pure
# Tell Antigen that you're done.
antigen apply

# ==================================ZSH ARGS===================================#
# Export sync script thingy
export already_setup=true
# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"
# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"
# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install

# ====================================PowelLevel10k============================#
export TERM=xterm-256color

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ======================================BASH SHELL=============================#
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] &&
    [ -s "$BASE16_SHELL/profile_helper.sh" ] &&
    eval "$("$BASE16_SHELL/profile_helper.sh")"

# =======================================LOCALE================================#
# Fix repeating characters on tab completion
export LC_ALL="en_US.UTF-8"
# You may need to manually set your language environment
export LANG=en_US.UTF-8

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

chpwd() {
    ls --color=auto
}

# ========================================COMPINSTALL==========================#
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'
autoload -Uz compinit
compinit
# case-insensitive (all) completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# End of lines added by compinstall

# ===========================================ALACRITTY=========================#
# dynamic alacritty title
case ${TERM} in
	 alacritty*)
		 local term_title () { print -n "\e]0;${(j: :q)@}\a" }
   		 precmd () {
     			 local DIR="$(print -P '  %~')"
     			 term_title "$DIR" " zsh"
   			 }
   		 preexec () {
     			 local DIR="$(print -P '  %~')"
			 local ICN="$(print -P '')"
     			 local CMD="${(j:\n:)${(f)1}}"
     			 term_title "$DIR" "$ICN" "$CMD"
   		 }
	         ;;
esac
