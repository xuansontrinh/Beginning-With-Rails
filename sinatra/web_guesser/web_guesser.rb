require 'sinatra'
require 'sinatra/reloader'
SECRET_NUMBER = rand(100)
def check_guess guess
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
  end
end
get '/' do
  guess = (params['guess']).to_i
  message = check_guess(guess)
  erb :index, :locals => {:numby => SECRET_NUMBER, :message => message, :guess => guess}
end
