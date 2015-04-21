class Peep
  include DataMapper::Resource

  property :id, Serial
  property :content, Text, lazy: false
  property :time, String
end