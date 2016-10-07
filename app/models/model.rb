class Model < ActiveRecord::Base
  def slow
    sleep 2
    puts 'hi'
  end
  handle_asynchronously :slow, run_at: proc { 1.minute.from_now }

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
  end

  # We just want to have someting testable
  def double(n)
    2 * n.to_i
  end

  def self.class_quick
    puts 'oi!'
  end
end
