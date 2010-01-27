#!/usr/bin/env ruby

require 'rubygems'
gem 'ruby-gmail'
require 'gmail'
require 'yaml'

FILE_NAME = '/Users/jesse/.gmail_unread_count'

Gmail.new(ARGV[0], ARGV[1]) do |gmail|
  gmail_hash = YAML.load_file(FILE_NAME) || {}
  gmail_hash[ARGV[0]] = gmail.inbox.count

 File.open(FILE_NAME, 'w' ) do |out|
    YAML.dump(gmail_hash, out )
  end
end

