env = ENV['RACK_ENV'] || 'development'

postvar = "postgres://localhost/apichitter_#{env}"
DataMapper.setup(:default, ENV['DATABASE_URL'] || postvar)

# DataMapper.setup(:default, "postgres://localhost/apichitter_#{env}")

DataMapper.finalize

DataMapper.auto_upgrade!


