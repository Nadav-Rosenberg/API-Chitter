require 'sinatra/base'
require 'data_mapper'

require_relative 'data_mapper_setup'

class APIChitter < Sinatra::Base
  get '/' do
    'hello chitter api'
  end

  post '/api/new_peep' do
    peep = params[:peep]
    Peep.create(content: peep)
  end  
end