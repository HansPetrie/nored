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

last_question_asked=0
last_strand_asked=0

for i in 1..no_of_questions do
  good_question=false
  until good_question do
    question_to_ask=rand(1..totalrows-1)
    if question_to_ask != last_question_asked 
      good_question=true
      if questions[question_to_ask][0] != last_strand_asked
        good_question=true
      end
    end
  end
  puts "Asking question number: " + questions[question_to_ask][4]
  last_question_asked = question_to_ask
  last_strand_asked = questions[question_to_ask][0]
end
