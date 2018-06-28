# Goal:
# There is always one CounterJob waiting or running. With each request, the
# monitor class method should determine whether there's one there and if not,
# start one uo again.
# nah.

class CounterJob < ApplicationJob
  queue_as :counterqueue
  # after_perform do |job|
  #   logger.info "after: #{job}"
  #   CounterJob.set(wait: 10.seconds).perform_later
  # end

  def perform(*args)
    puts "counterjob perform"
    @events = Event.all
    @events.each do |event|
      event.count += 1
      logger.info("Counterjob: #{event.count}")
      event.save
    end
  end

  def self.monitor
    logger.info("monitor called")
  end
end
