require 'byebug'
require 'colorize'
require 'csv'
require 'pry'
require 'time'

# Try to load source files.

files_pattern = File.expand_path('../lib/**/*.rb', __FILE__)

files = Dir[files_pattern].sort

if files.empty?
  puts "[error] Could not find Ruby source files. Aborting".colorize(:red)
  exit(1)
end

files.each do |file|
  print "Loading #{file}... "
  require(file)
  puts 'OK'.colorize(:green)
end

puts ""
