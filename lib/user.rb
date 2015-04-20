class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :name, String
  property :user_name, String
  property :password, String 
end  