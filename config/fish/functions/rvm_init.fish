function rvm_init
  if -f ~/.rvm/current
    __bash_env_to_fish (cat ~/.rvm/current)
  end
end