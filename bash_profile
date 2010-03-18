source ~/.bash/aliases
source ~/.bash/completions
source ~/.bash/paths
source ~/.bash/config

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

if [ -f ~/.localrc ]; then
  . ~/.localrc
fi

# rvm-install added line:
if [[ -s /Users/jesse/.rvm/scripts/rvm ]] ; then source /Users/jesse/.rvm/scripts/rvm ; fi


export NARWHAL_ENGINE=jsc

export NARWHAL_ENGINE=jsc

export PATH="/Users/jesse/workspace/lib/cappuccino/yes/bin:$PATH"

export NARWHAL_ENGINE=jsc
