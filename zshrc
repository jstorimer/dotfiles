source ~/.zsh/aliases
source ~/.zsh/completion
source ~/.zsh/config

# rvm-install added line:
if [[ -s /Users/jesse/.rvm/scripts/rvm ]] ; then source /Users/jesse/.rvm/scripts/rvm ; fi

if which fortune &> /dev/null
then echo; fortune -a
fi

if which t &> /dev/null
then echo; echo; t ls
fi
