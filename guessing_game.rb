# This programs allows users to guess a randomly chosen number from 1 to 1000.
# This game uses the bundler gem, in addition to the sinatra gem to allow users to successfully use the program.
require 'bundler'
Bundler.require

# When a user types this into their local host, the computer will start a new game with a new random number.
get '/new_game' do
  File.delete('Game.txt')
  number = rand(1000)
  f = File.new('Game.txt','w')
  f.puts(number)
  f.close
  'Welcome to my game! Use this program to guess a number between one and a thousand!'
end

# If a user types in guess without a number, they will be given this message.
get '/guess' do
  'Please guess a number and/or start a new game!'
end

# If the user types this into their local host, the number guessed (x) will either match or not match the goal number.
get '/guess/:x' do
  if params[:x].to_i == File.read('Game.txt').to_i
    'Congratulations, that was the right number!'
  else
    'Sorry, that was not the right number, please guess again!'
  end
end

# This function lets users determine whether the number that is given (n) (on the local host) is greater than the goal number.
get '/higher/:n' do
  if params[:n].to_i < File.read('Game.txt').to_i
    "Yes, the number is higher than #{params[:n]}."
  else
    "No, the number is lower than #{params[:n]}."
  end
end

# This function lets users determine whether the given number (r) (on the local host) is less than the goal number.
get '/lower/:r' do
  if params[:r].to_i > File.read('Game.txt').to_i
    "Yes, the number is lower than #{params[:r]}."
  else
    "No, the number is higher than #{params[:r]}."
  end
end