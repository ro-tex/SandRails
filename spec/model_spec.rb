RSpec.describe Model do
  describe 'echo' do
    model = Model.new
    input = 'loren ipsum'

    expect(model.echo(input)).to eq(input)
  end
end
