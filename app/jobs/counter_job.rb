# Goal:
# There is always one CounterJob running. With each request, the controller will call CounterJob.monitor
# Whenever a counnterjob is constructed we add it to an array of counterjobs
# To check we look to see that there's greater than 0, and if there are whether one of them is in the queue
# nah.

class CounterJob < ApplicationJob
  queue_as :counterqueue
  # after_perform do |job| 
  #   logger.info "after: #{job}"
  #   CounterJob.set(wait: 10.seconds).perform_later
  # end

  def perform(*args)
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

