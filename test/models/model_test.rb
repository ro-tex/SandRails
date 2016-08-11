class ModelTest < ActionController::TestCase
  setup do
    @model = Model.new
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should echo' do
    m = Model.new
    assert m.echo('input') == 'input'
  end
end
