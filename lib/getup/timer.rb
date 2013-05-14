require "timers"
module Getup
  class Timer
    attr_accessor :timer_lib, :notify
    def initialize(opts={}, timer_lib = Timers.new, notify = Getup::Notify)
      self.timer_lib = timer_lib
      @name       = opts.fetch(:name) 
      @message    = opts.fetch(:message)
      @interval   = opts.fetch(:interval)
      self.notify = notify.new(message: @message, body: @name)
    end

    def start
      timer_lib.after(@interval.to_f) { notify.show}
      timer_lib.wait
      "timer started"
    end

    def stop
      
    end

    def pause
      
    end

    def resume
      
    end
  end
end
