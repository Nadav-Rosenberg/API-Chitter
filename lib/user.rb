require 'bcrypt'
class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :name, String
  property :user_name, String, unique: true, message: "user name already taken"
  property :password_digest, Text 

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password, message: "passwords don't match"

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    user if user && BCrypt::Password.new(user.password_digest) == password
  end
end  