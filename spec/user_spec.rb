describe User do
  
  it 'can have email, name, user name, and password' do
    expect { add_user }.to change(described_class, :count).by(1) 
  end

  it 'doesnt allow a user to sign up with a name thats already taken' do
    add_user
    expect { add_user }.to change(described_class, :count).by(0)
  end

end

def add_user
  User.create(email: "test@test.com",
              name: "Test",
              user_name: "Testy",
              password: "123")                   
end