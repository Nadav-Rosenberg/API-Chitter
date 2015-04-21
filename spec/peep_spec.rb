require 'spec_helper.rb'
require './lib/peep'
context '*** Unit test ***' do

  describe Peep do
    
    it 'can store a message' do
      expect {add_peep "Test"}.to change(described_class, :count).by(1)
      expect(Peep.first.content).to eq("Test")
    end

    it 'registers the time of the message' do
      add_peep "Test"
      expect(Peep.first.time).to eq(Time.now.to_s[0..-7])
    end

  end

end

def add_peep message
  Peep.create(content: message, time: Time.now)
end
