class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :name, String
  property :user_name, String, unique: true, message: "user name already taken"
  property :password, String 

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password, message: "passwords don't match"

end  