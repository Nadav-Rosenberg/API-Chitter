require 'sinatra/base'
require 'data_mapper'

require_relative 'data_mapper_setup'

class APIChitter < Sinatra::Base
  get '/' do
    'hello chitter api'
  end
end