#!/usr/bin/env ruby

require 'irb/completion'
require 'pp'
require 'socket'

IRB.conf[:AUTO_INDENT]=true

# Save History between irb sessions
# require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 10_000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"

def pbcopy(str)
  stdin = IO.popen('pbcopy', 'w')
  stdin.write(str)
  stdin.close
end

def pbpaste
  stdout = IO.popen('pbpaste', 'r')
  stdout.read
end

def history
  Readline::HISTORY.entries.join("\n")
end

