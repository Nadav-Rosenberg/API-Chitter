feature 'Signing in to Chitter' do
  
  let(:request) {"email=test@test.com&name=Test&user_name=Testy&password=123&password_confirmation=123"}
  let(:sign_in_request) {"email=test@test.com&password=123"}

  scenario 'user signs in to Chitter without signing up first' do
    response = page.driver.post "api/sign_in", sign_in_request
    expect(response.body).to eq("user details are incorrect")
  end 

  scenario 'user signs in to Chitter wit correct details' do
    page.driver.post "api/sign_up", request
    response = page.driver.post "api/sign_in", sign_in_request
    expect(response.body).to eq("Welcome, Testy!")
  end 

end