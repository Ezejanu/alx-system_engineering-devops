#!/usr/bin/env ruby
input = ARGV[0]

pattern = /\[from:(?<sender>[^\]]+)\] \[to:(?<recipient>[^\]]+)\] \[flags:(?<flags>[^\]]+)\]/
matches = input.scan(pattern)

matches.each do |match|
  sender = match[0]
  recipient = match[1]
  flags = match[2]
  puts "#{sender},#{recipient},#{flags}"
end
