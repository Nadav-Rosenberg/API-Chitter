require 'spec_helper.rb'
require './lib/peep'
describe Peep do
  
  it 'can store a message' do
    expect {add_peep}.to change(described_class, :count).by(1)
  end
end