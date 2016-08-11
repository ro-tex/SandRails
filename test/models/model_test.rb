require 'test_helper'

class ModelTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @model = Model.new
  end

  test 'should echo' do
    assert @model.echo('input') == 'input'
  end
end
