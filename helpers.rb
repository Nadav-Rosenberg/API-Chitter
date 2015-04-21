module Helpers

  def sign_up
    email = params[:email]
    name = params[:name]
    user_name = params[:user_name]
    password = params[:password]
    password_confirmation = params[:password_confirmation] 

    user = User.create(email: email,
                name: name,
                user_name: user_name,
                password: password,
                password_confirmation: password_confirmation)
    unless user.save
      user.errors.full_messages
    end
  end

  def sign_in
    email, password = params[:email], params[:password]
    user = User.authenticate(email, password) 
      if user
        session[:user_id] = user.id 
        "Welcome, #{user.user_name}!"
      else  
        "user details are incorrect" 
      end  
  end

  def sign_out
    session[:user_id] = nil
  end

  def new_peep
    if session[:user_id]
      peep = params[:peep]
      Peep.create(content: peep, time: Time.now.to_time, author: User.first(id: session[:user_id]).user_name)
      'peep recieved'
    else
      'You must be signed in to peep!'
    end
  end  

  def all_peeps
    peeps = ''
    Peep.all.each do |peep|
      peeps << ("#{peep.content} by #{peep.author} @#{peep.time.to_s[0..19]} ")
    end
    peeps
  end  

end  