class Peep
  include DataMapper::Resource

  property :id, Serial
  property :content, Text, lazy: false
end