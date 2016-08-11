require 'test_helper'

class ModelTest < ActiveSupport::TestCase
  # All test methods are executed in random order.
  # The config.active_support.test_orderoption can be used to configure test order.

  setup do
    @model = Model.new
    @input = 'loren ipsum'
  end

  test 'should echo' do # could have named it test_echo
    assert @model.echo(@input) == @input, 'Make sure the echo method returns its input without changing it.'
  end

  # This is a test that would fail because we're using an undefined variable.
  # But we want it to pass anyway - consider this a TDD test for a feature
  # that is still not implemented.
  test 'failing test' do
    assert_raises(NameError) do
      this_will_raise_an_error = undefined_variable
    end

    assert_raises(NoMethodError) do
      assert_success @model.undefined_method
    end
  end
end
