class Box < Object
  @data
  @val

  def initialize(*data)
    @data = data.nil? ? [] : data.to_a
    @val = 0
  end

  # A getter and a setter, just using more "transparent" names.
  # Some validation, so these don't get 'beutified' into attr_*.
  def val
    @val.nil? ? 0 : @val
  end

  def val=(value) # the field is accessible as obj.val = some_val
    @val = value.nil? ? 0 : value
  end

  # shorthand, in case we don't need any validation:
  attr_reader :val
  attr_writer :val

  def to_s
    "(data:#{@data},val:#{@val})"
  end
end

puts Box.new.inspect
puts Box.new(1, 2, 3).inspect
puts "This is a box object: #{Box.new(1, 2)}" # this is why it's a good thing to define to_s for your class
