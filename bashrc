source ~/.bash/paths
source ~/.zsh/aliases
source ~/.bash/completions
source ~/.bash/config

if which fortune &> /dev/null
then echo; fortune -a
fi

if [ -f `brew --prefix`/etc/autojump ]; then
  . `brew --prefix`/etc/autojump
fi

export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"
source ~/.rbenv/completions/rbenv.bash

