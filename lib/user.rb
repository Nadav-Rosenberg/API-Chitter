class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :name, String
  property :user_name, String, unique: true, message: "user name already taken"
  property :password, String 
end  