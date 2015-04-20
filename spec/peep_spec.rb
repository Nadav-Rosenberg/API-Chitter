require 'spec_helper.rb'
require './lib/peep'
describe Peep do
  
  it 'can store a message' do
    expect {add_peep "Test"}.to change(described_class, :count).by(1)
    expect(Peep.first.content).to eq("Test")
  end

end

def add_peep message
  Peep.create(content: message)
end
