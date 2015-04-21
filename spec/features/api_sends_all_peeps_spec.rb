feature 'the api sends all peeps' do

  let(:sign_up_request) {"email=test@test.com&name=Test&user_name=Testy&password=123&password_confirmation=123"}
  let(:sign_in_request) {"email=test@test.com&password=123"}
  let(:peep_request) { "peep=This+is+a+test+peep" }

  scenario 'api recieves request for all peeps' do
    post_peep
    content = page.driver.get "api/all_peeps"
    expect(content.body).to eq("This is a test peep by Testy @#{Time.now.to_s[0..19]} This is a test peep by Testy @#{Time.now.to_s[0..19]} ")
  
  end

  scenario 'API sends peep with its author user_name' do
    post_peep
    expect(Peep.first.author).to eq("Testy")
  end 
end 


def post_peep
  page.driver.post "/api/sign_up", sign_up_request
  page.driver.post "/api/sign_in", sign_in_request
  page.driver.post "/api/new_peep", peep_request
  page.driver.post "/api/new_peep", peep_request
  page.driver.post "/api/sign_out"
end
