class Model < ActiveRecord::Base
  def slow
    sleep 2
    puts 'hi'
  end
  handle_asynchronously :slow, run_at: proc { 1.minute.from_now }

  # Run like this:
  # Delayed::Worker.new.run(Delayed::Job.find(id))
  # Delayed::Worker.new.run(Delayed::Job.last)

  def quick
    puts 'oi!'
  end

  def echo(input)
    input
  end
end
