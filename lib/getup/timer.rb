require "timers"
module Getup
  # Timer
  class Timer
    attr_accessor :timer_lib, :notify
    def initialize(opts={}, timer_lib = Timers.new, notify = Getup::Notify)
      @name          = opts.fetch(:name) 
      @message       = opts.fetch(:message)
      @interval      = opts.fetch(:interval)
      self.timer_lib = timer_lib
      self.notify    = notify.new(message: @message, body: @name)
    end

    def start
      timer_lib.after(@interval.to_f) { notify.show }
      timer_lib.wait
      "timer started"
    end

    def stop
      #timer_lib.cancel
    end

    def pause
      #
    end

    def resume
      #
    end
  end
end
