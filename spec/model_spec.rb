require 'rails_helper'

describe Model do
  before do
    @mod = Model.new
  end

  # All describes on the chain should form a readable sentence.
  describe '#double' do
    it 'should double an integer' do
      expect(@mod.double(3)).to eq(6)
      expect(@mod.double(-23)).not_to eq(6)
    end

    it 'should double a string, after converting it to an integer' do
      expect(@mod.double('3')).to eq(6)
      expect(@mod.double('3asdf')).to eq(6)
    end
  end

  # By convention, class methods are prefixed with a dot (".add"),
  # and instance methods with a dash ("#add").
  describe '.class_quick' do
    it 'should print out "oi!" to stdout' do
      expect { Model.class_quick }.to output("oi!\n").to_stdout
    end
  end
end
