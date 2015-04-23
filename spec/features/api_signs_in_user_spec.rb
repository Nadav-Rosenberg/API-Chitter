feature 'Signing in to Chitter' do
  
  let(:sign_up_request) {"email=test@test.com&name=Test&user_name=Testy&password=123&password_confirmation=123"}
  let(:sign_in_request) {"email=test@test.com&password=123"}
  let(:peep_request) { "peep=This+is+a+test+peep" }
  scenario 'user signs in to Chitter without signing up first' do
    response = page.driver.post "api/sign_in", sign_in_request
    expect(response.body).to eq("user details are incorrect")
  end 

  scenario 'user cannot peep if not signed in' do
    response = page.driver.post "/api/new_peep", peep_request
    expect(response.body).to eq('You must be signed in to peep!')
    expect(Peep.all.empty?).to be(true)
  end

  scenario 'user signs in to Chitter with correct details' do
    page.driver.post "api/sign_up", sign_up_request
    response = page.driver.post "/api/sign_in", sign_in_request
    expect(response.body).to eq("{\"message\":\"Welcome, Testy!\"}")
  end



  scenario 'user can peep if signed in' do
    page.driver.post "/api/sign_up", sign_up_request
    page.driver.post "/api/sign_in", sign_in_request
    response = page.driver.post "/api/new_peep", peep_request
    page.driver.post "/api/sign_out"
    expect(Peep.first.content).to eq ("This is a test peep")
    expect(response.body).to eq ("peep recieved")
  end

end