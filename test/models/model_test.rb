require 'test_helper'

class ModelTest < ActiveSupport::TestCase
  # All test methods are executed in random order.
  # The config.active_support.test_orderoption can be used to configure test order.

  setup do
    @model = models(:mod) # using a fixture called 'mod'
    @input = 'loren ipsum'
  end

  def test_echo
    assert_equal @input, @model.echo(@input), 'Make sure the echo method returns its input without changing it.'
  end

  test 'should echo' do # identical to test_echo but allows more readable names
    assert_equal @input, @model.echo(@input), 'Make sure the echo method returns its input without changing it.'
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

  # http://guides.rubyonrails.org/testing.html#available-assertions
  # http://docs.seattlerb.org/minitest/Minitest/Assertions.html

  #	Ensures that the numbers expected and actual are within delta of each other.
  # assert_in_delta( expected, actual, [delta], [msg] )
end
