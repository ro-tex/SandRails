require 'rails_helper'

describe Model do
  before do
    @mod = Model.new
  end

  it 'should double an integer' do
    @mod.double(3).should eq(6)
  end
end