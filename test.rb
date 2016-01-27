#!/usr/bin/ruby
require 'csv'

puts "Enter the number of questions for the quiz"
sInput = gets
iQuestions = sInput.to_i
puts "You will be given " + iQuestions.to_s + " questions"

totalrows=0
questions=Array.new

CSV.foreach('questions.csv') do |row|
  totalrows=totalrows+1
  questions.push row
  #puts row.inspect
  #puts row[0]
end

#puts "Parsed " + totalrows.to_s + " questions"

for i in 1..iQuestions do
  puts questions[i]
end

