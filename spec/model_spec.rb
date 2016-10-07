require 'rails_helper'

describe Model do
  # This section can also be called 'setup'
  # :all can be :each and so on
  before :all do
    puts 'Setting up the test environment.'
    @mod = Model.new
  end

  after :all do
    @mod.destroy
    puts "\nThe test environment is now destroyed."
  end

  # All describes on the chain should form a readable sentence.
  describe '#double' do
    it 'should double an integer' do
      expect(@mod.double(3)).to eq(6)
      expect(@mod.double(-23)).not_to eq(6)
    end

    # Context is basically the same as 'describe' but signals a special case
    context 'given a nil' do
      it 'should return zero' do
        expect(@mod.double(nil)).to eq(0)
      end
    end

    context 'given a string' do
      it 'should double its integer value' do
        expect(@mod.double('-3')).to eq(-6)
        expect(@mod.double('3asdf')).to eq(6)
      end
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
