#!/usr/bin/ruby
require 'csv'

puts "Enter the number of questions for the quiz"
input = gets
no_of_questions = input.to_i
puts "You will be given " + no_of_questions.to_s + " questions"

if no_of_questions < 1
  puts "Make sure you enter a number greater than 0"
end

totalrows=0
questions=Array.new

CSV.foreach('questions.csv') do |row|
  totalrows=totalrows+1
  questions.push row
  #puts row.inspect
  #puts row[0]
end

#puts "Parsed " + totalrows.to_s + " questions"

for i in 1..no_of_questions do
  question_to_ask=rand(1..totalrows-1)
  puts "Asking question number: " + questions[question_to_ask][4]
end
