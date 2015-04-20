require 'spec_helper'

feature 'Posting a message to the database' do

  let (:request) { "peep=This+is+a+test+peep" }

  scenario 'API recieves a request to post a peep' do
    page.driver.post "/api/new_peep", request
    peep = Peep.first
    expect(peep.content).to eq("This is a test peep")
  end  

end  

