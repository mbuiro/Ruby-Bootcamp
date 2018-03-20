#!/usr/bin/ruby
require 'optparse'

options = {:first_name => nil, :last_name => nil, :age => nil}

parser = OptionParser.new do|opts|
	opts.banner = "Usage: hello.rb [options]"
	opts.on('-f', '--first firstname', 'First Name') do |first_name|
		options[:first_name] = first_name;
	end

	opts.on('-l', '--last lastname', 'Last Name') do |last_name|
		options[:last_name] = last_name;
	end

	opts.on('-a', '--age age', 'Age') do |age|
		options[:age] = age;
	end

	opts.on('-h', '--help', 'Displays Help') do
		puts opts
		exit
	end
end

parser.parse!

if options[:first_name] == nil
	print 'Enter First Name: '
    options[:first_name] = gets.chomp
end

if options[:last_name] == nil
	print 'Enter Last Name: '
    options[:last_name] = gets.chomp
end

if options[:age] == nil
	print 'Enter Age: '
    options[:age] = gets.chomp
end

sayHello = 'Hello ' + options[:first_name] + ' ' + options[:last_name] + ', '

if Integer(options[:age]) == 100
    sayAge = 'You are already 100 years old!'
elsif Integer(options[:age]) < 100
    sayAge = 'You will be 100 in ' + String(100 - Integer(options[:age])) + ' years!'
else
    sayAge = 'You turned 100 ' + String(Integer(options[:age]) - 100) + ' years ago!'
end

puts sayHello + sayAge