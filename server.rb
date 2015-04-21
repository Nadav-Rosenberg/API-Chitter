require 'sinatra/base'
require 'data_mapper'
require 'bcrypt'
require './lib/peep'
require './lib/user'

require_relative 'data_mapper_setup'

class APIChitter < Sinatra::Base

  enable :sessions

  get '/' do
    'hello chitter api'
  end

  post '/api/new_peep' do
    if session[:user_id]
      peep = params[:peep]
      Peep.create(content: peep)
      'peep recieved'
    else
      'You must be signed in to peep!'
    end
  end


  get '/api/all_peeps' do
    peeps = ''
    Peep.all.each do |peep|
      peeps << (peep.content + ' ')
    end
    peeps
  end
  
  post '/api/sign_up' do
    email = params[:email]
    name = params[:name]
    user_name = params[:user_name]
    password = params[:password]
    password_confirmation = params[:password_confirmation] 

    user = User.create(email: email,
                name: name,
                user_name: user_name,
                password: password,
                password_confirmation: password_confirmation)
    unless user.save
      user.errors.full_messages
    end
  end

  post '/api/sign_in' do
    email, password = params[:email], params[:password]
    user = User.authenticate(email, password) 
      if user
        session[:user_id] = user.id 
        "Welcome, #{user.user_name}!"
      else  
        "user details are incorrect" 
      end  
    end

    post '/api/sign_out' do
      session[:user_id] = nil
    end
end