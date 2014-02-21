# we create an array of 20 sub arrays and assign it to
# the questions variable
questions = [

  # each sub array has two elements, the first element is the correct
  # answer, the second element is the question
  ['y', 'are you alive?'],
  ['y', 'soft shirts are better than scratchy shirts'],
  ['y', 'you contain lots of bacteria'],
  ['y', 'abstraction is the bread and butter of programming'],
  ['n', 'the internet is maintained by dumptrucks'],
  ['y', 'this is the last question']
]

# we create a variable to track how many correct
# answers the user gave
correct_answers = 0

# we go through each of the question sub arrays
questions.each do |question|

  # print out to the terminal our prompt + the question
  # from our sub array (the 2nd element, at index 1)
  puts 'Answer y/n: ' + question[1]

  # we get a line (in our case single char) worth of input
  # from the user, using chomp to remove any space on the
  # begining or end of their answer
  answer = gets.chomp.downcase

  # we compare their answer to the question's known good answer
  if answer == question[0]

    # if they got it right we add one to the score
    #correct_answers = correct_answers + 1
    correct_answers += 1
  end
end

puts 'you scored: '
puts correct_answers