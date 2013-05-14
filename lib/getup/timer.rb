require "timers"
module Getup
  class Timer
    attr_accessor :timer_lib
    def initialize(opts={}, timer_lib = Timers.new)
      self.timer_lib = timer_lib
      @name      = opts.fetch(:name) 
      @message   = opts.fetch(:message)
      @interval  = opts.fetch(:interval)
    end

    def start
      timer_lib.after(@interval.to_f) { puts @message}
      timer_lib.wait
    end

    def stop
      
    end

    def pause
      
    end

    def resume
      
    end
  end
end
