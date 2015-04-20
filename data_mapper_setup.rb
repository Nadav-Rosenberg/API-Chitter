env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/apichitter_#{env}")

require './lib/peep'

DataMapper.finalize

DataMapper.auto_upgrade!