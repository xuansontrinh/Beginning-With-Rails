require './song'
require 'sinatra'
require 'sinatra/reloader'
require 'sass'
require 'slim'

get('/styles.css'){ scss :styles }

get '/' do
  @name = "Son"
  @title = "Jump Start Sinatra"
  erb :home
end

get '/about' do
  @title = "All About This Website"
  erb :about
end

get '/contact' do
  @title = "Jump Start Sinatra"
  erb :contact
end

not_found do
  erb :not_found
end
