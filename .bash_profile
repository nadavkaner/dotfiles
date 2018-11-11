export TERM=xterm-256color

#PROMPT STUFF
GREEN=$(tput setaf 2);
YELLOW=$(tput setaf 3);
WHITE=$(tput setaf 7);
RESET=$(tput sgr0);

function git_branch {
  # Shows the current branch if in a git repository
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \(\1\)/';
}

rand() {
  printf $((  $1 *  RANDOM  / 32767   ))
}
rand_element () {
  local -a th=("$@")
  unset th[0]
  printf $'%s\n' "${th[$(($(rand "${#th[*]}")+1))]}"
}
#Default Prompt
setEmoji () {
  EMOJI="$@"
  PS1="${YELLOW}\w${GREEN}\$(git_branch)${RESET}\n${EMOJI}  $ ";
}

setEmoji $(rand_element 😅 👽 🔥 🚀 👻 ⛄ 👾 🍔 😄 🍰 🐑 😎 🏎 🤖 😇 😼 💪 🦄 🥓 🌮 🎉 💯 ⚛️ 🐠 🐳 🐿)

# history size
HISTSIZE=5000
HISTFILESIZE=10000

# Custom Aliases
alias c="code .";
alias ll="ls -al";
alias ..="cd ../";
alias ..l="cd ../ && ll";
alias ~="cd ~";

# git aliases
alias gco="git checkout";
alias gc="git commit -m $1";
alias gs="git status";
alias gp="git pull";
alias glr="git pull --rebase";
alias gf="git fetch";
alias gpush="git push origin $(git_branch)";
alias gd="git diff";
alias ga="git add .";
alias gcm="git checkout master";
alias ggrh="git reset --hard origin/$(git_branch)";

if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi
