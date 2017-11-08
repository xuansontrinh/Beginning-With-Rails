require 'sinatra'
require 'sinatra/reloader'
SECRET_NUMBER = rand(100)
@@n_guesses = 5
def check_guess guess
  flag = false
  if guess <= SECRET_NUMBER - 5
    message = "Way to low!"
  elsif guess < SECRET_NUMBER
    message = "A little low!"
  elsif guess >= SECRET_NUMBER + 5
    message = "Way to high!"
  elsif guess > SECRET_NUMBER
    message = "A little high!"
  else
    message = "Correct!"
    flag = true
  end
  return message, flag
end
get '/' do
  if !params['guess'].nil? && params['guess'] != '' || params['cheat'] != 'on'
    guess = (params['guess']).to_i
    message, flag = check_guess(guess)
    if (flag == false && @@n_guesses == 0)
      @@n_guesses = 5
      message += " Out of turn, the game now resets the new number!"
      SECRET_NUMBER = rand(100)
    elsif flag == true
      @@n_guesses = 5
      message += " New number will be set!"
      SECRET_NUMBER = rand(100)
    else
      @@n_guesses -= 1
    end
  end
  erb :index, :locals => {:numby => SECRET_NUMBER, :message => message, :guess => guess, :cheat => params['cheat']}
end
