source ~/.bash/paths
source ~/.zsh/aliases
source ~/.bash/completions
source ~/.bash/config

# rvm-install added line:
if [[ -s /Users/jesse/.rvm/scripts/rvm ]] ; then source /Users/jesse/.rvm/scripts/rvm ; fi

if which fortune &> /dev/null
then echo; fortune -a
fi

if alias to &> /dev/null
then echo; echo; to ls
fi

if [ -f `brew --prefix`/etc/autojump ]; then
  . `brew --prefix`/etc/autojump
fi

if [[ -s $HOME/.screeninator/scripts/screeninator ]] ; then source $HOME/.screeninator/scripts/screeninator ; fi
if [[ -s /usr/local/Library/Contributions/brew_bash_completion.sh ]] ; then source /usr/local/Library/Contributions/brew_bash_completion.sh ; fi
