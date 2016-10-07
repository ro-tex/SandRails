require 'rails_helper'

describe Model do
  before do
    @mod = Model.new
  end

  it 'should double an integer' do
    expect(@mod.double(3)).to eq(6)
  end
end
