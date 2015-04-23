require 'json'
module Helpers

  def sign_up
    p params
    email = params["email"]
    name = params["name"]
    user_name = params["user_name"]
    password = params["password"]
    password_confirmation = params["password_confirmation"] 

    user = User.create(email: email,
                name: name,
                user_name: user_name,
                password: password,
                password_confirmation: password_confirmation)
    unless user.save
      puts "Failure"
      user.errors.full_messages
    end
  end

  def sign_in
    p params
    email, password = params["email"], params["password"]
    user = User.authenticate(email, password) 
      if user
        session[:user_id] = user.id 
        message = {message: "Welcome, #{user.user_name}!"}
        JSON.generate(message)
      else  
        JSON.generate({message: "user details are incorrect"})
      end 
  end

  def sign_out
    session[:user_id] = nil
  end

  def new_peep
    if session[:user_id]
      peep = params["peep"]
      Peep.create(content: peep, time: Time.now.to_s[0..18], author: User.first(id: session[:user_id]).user_name)
      'peep recieved'
    else
      'You must be signed in to peep!'
    end
  end  

  def all_peeps
    peeps = []
    Peep.all.reverse_each do |peep|
      peeps << {text: peep.content, author: peep.author, time: peep.time}
    end
    JSON.generate(peeps)
  end  

end  