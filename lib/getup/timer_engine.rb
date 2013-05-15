require "timers"
module Getup
  # TimerEngine
  class TimerEngine
    attr_accessor :timer_engine, :notify
    def initialize(options={}, timer_engine = Timers.new, notify = Getup::Notify)
      @name             = options.fetch(:name) 
      @message          = options.fetch(:message)
      @interval         = options.fetch(:interval)
      @repeat           = options.fetch(:repeat)
      self.timer_engine = timer_engine
      self.notify       = notify.new(message: @message, body: @name)
    end

    def start
      @repeat ? repeat : one_time
      puts "timer started"
    end

    def stop
      timer_engine.cancel
    end

    def pause
      timer_engine.pause
    end

    def resume
      timer_engine.continue
    end

private
   def notify_show
      ->(*) { notify.show }
    end

    # @private
    # repeating timer event
    def repeat
      timer_engine.every(@interval.to_i) { notify_show.call }
      loop { timer_engine.wait }
    end

    # @private
    # non-repeating timer event
    def one_time
      timer_engine.after(@interval.to_i) { notify_show.call }
      timer_engine.wait
    end
  end
end
