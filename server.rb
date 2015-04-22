require 'sinatra/base'
require 'data_mapper'
require 'bcrypt'
require './lib/peep'
require './lib/user'
require './helpers'
require "sinatra/cross_origin"

require_relative 'data_mapper_setup'

class APIChitter < Sinatra::Base

  register Sinatra::CrossOrigin

  enable :cross_origin

  include Helpers

  enable :sessions

  get '/' do
    send_file 'index.html'
  end  


  post '/api/sign_up' do
    sign_up
  end

  post '/api/sign_in' do
    sign_in  
  end

  post '/api/sign_out' do
    sign_out
  end

  post '/api/new_peep' do
    new_peep
  end

  get '/api/all_peeps' do
    all_peeps
  end

end