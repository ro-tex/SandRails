require 'rails_helper'

describe Model do
  before do
    @mod = Model.new
  end

  # All describes on the chain should form a readable sentence.
  describe '.double' do
    it 'should double an integer' do
      expect(@mod.double(3)).to eq(6)
      expect(@mod.double(-23)).not_to eq(6)
    end

    it 'should double a string, after converting it to an integer' do
      expect(@mod.double('3')).to eq(6)
      expect(@mod.double('3asdf')).to eq(6)
    end
  end
end
