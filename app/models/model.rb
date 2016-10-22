class Model < ActiveRecord::Base
  @@class_message = 'Hello World!'.freeze
  @message = '\'ello!'

  def initialize(*message)
    @message = message.nil? || message.empty? ? 'hi!' : message
  end

  def slow
    sleep 2
    puts @message
  end
  # handle_asynchronously :slow, run_at: proc { 1.minute.from_now }

  # Run like this:
  # Delayed::Worker.new.run(Delayed::Job.find(id))
  # Delayed::Worker.new.run(Delayed::Job.last)

  def self.pub(*args)
    puts "public: #{args}"
  end

  def quick
    puts 'oi!'
  end

  def echo(input)
    input
  end

  def put_id
    puts id.inspect
    puts @id.inspect # what does this do and what's the difference?
  end

  # We just want to have someting testable
  def double(n)
    2 * n.to_i
  end

  def self.class_quick
    puts 'oi!'
  end
end
