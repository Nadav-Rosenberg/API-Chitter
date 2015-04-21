require 'spec_helper'

feature 'Posting a message to the database' do
  let(:sign_up_request) {"email=test@test.com&name=Test&user_name=Testy&password=123&password_confirmation=123"}
  let(:sign_in_request) {"email=test@test.com&password=123"}
  let(:peep_request) { "peep=This+is+a+test+peep" }

  scenario 'API recieves a request to post a peep' do
    page.driver.post "/api/sign_up", sign_up_request
    page.driver.post "/api/sign_in", sign_in_request
    page.driver.post "/api/new_peep", peep_request
    peep = Peep.first
    expect(peep.content).to eq("This is a test peep")
    page.driver.post "/api/sign_out"
  end 
  
end  

