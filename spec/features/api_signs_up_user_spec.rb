feature 'Signing up to Chitter' do

  let(:request) {"email=test@test.com&name=Test&user_name=Testy&password=123&password_confirmation=123"}

  scenario "User signs up to Chitter and its details beeing added to the database" do
    page.driver.post "api/sign_up", request
    user = User.first
    expect(user.email).to eq("test@test.com")
    expect(user.name).to eq("Test")
    expect(user.user_name).to eq("Testy")
    expect(user.password).to eq("123")
  end  

end