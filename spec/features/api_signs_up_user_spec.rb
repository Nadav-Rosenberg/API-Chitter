feature 'Signing up to Chitter' do

  let(:request) {"email=test@test.com&name=Test&user_name=Testy&password=123&password_confirmation=123"}

  scenario "User signs up to Chitter and its details beeing added to the database" do
    page.driver.post "api/sign_up", request
    user = User.first
    expect(user.email).to eq("test@test.com")
    expect(user.name).to eq("Test")
    expect(user.user_name).to eq("Testy")
  end

  scenario "user siging up with a name that is taken returns an error message" do
    page.driver.post "api/sign_up", request
    response = page.driver.post "api/sign_up", request
    expect(response.body).to eq("user name already taken")
  end

  scenario "user sings up with passwords that does not match" do
    response = page.driver.post "api/sign_up", "email=test@test.com&name=Test&user_name=Testy&password=123&password_confirmation=wrong"
    expect(response.body).to eq("passwords don't match")
  end

end