feature 'the api sends all peeps' do

  let (:request) { "peep=This+is+a+test+peep" }

  scenario 'api recieves request for all peeps' do
    page.driver.post "/api/new_peep", request
    page.driver.post "/api/new_peep", request

    content = page.driver.get "api/all_peeps"
    
    expect(content.body).to eq("This is a test peep This is a test peep ")

  end
end 