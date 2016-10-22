class Box < Object
  @data
  @val

  def initialize(*data)
    @data = data.nil? ? [] : data.to_a
  end

  # classic getter and setter
  def getVal
    @val
  end

  def setVal=(value)
    @val = value
  end

  # more "transparent" getter and setter
  # some validation, so these don't get 'beutified' into attr_*
  def val
    @val.nil? ? 0 : @val
  end

  def val=(value) # the field is accessible as obj.val = some_val
    @val = value.nil? ? 0 : value
  end

  # shorthand, in case we don't need any validation:
  attr_reader :val # the field is accessible as obj.val
  attr_writer :val
end

puts Box.new.inspect
puts Box.new(1, 2, 3).inspect
