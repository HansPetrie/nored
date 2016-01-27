#!/usr/bin/ruby

require 'csv'

totalrows=0
questions=Array.new

CSV.foreach('questions.csv') do |row|
  totalrows=totalrows+1
  questions.push row
  #puts row.inspect
  #puts row[0]
end

questions.each do |question|
  puts question
end

puts "Parsed " + totalrows.to_s + " questions"
