function rvm
  set -l gems ''
  set -l ruby ''
 
  if test ! $argv[1]
    set argv[1] '<nothing>'
  end
 
  switch $argv[1]
    case system
      set gems $HOME/.gem-system
      set ruby /usr/bin/ruby
    case '*'
      echo 'hey, ruby needs to be one of [system]'
      return
  end
 
  echo $argv[1] > ~/.lastruby
 
  set -xg GEM_HOME $gems
  set -xg GEM_PATH $gems
  set -xg PATH $gems/bin (dirname $ruby) $PATH
end