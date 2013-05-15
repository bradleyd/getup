require "getup/version"
require "getup/process"
require "getup/notify"
require "getup/timer_engine"

module Getup
  class Init
    def initialize(options={})
      @name       = options.fetch(:name) { "foo" }
      @interval   = options.fetch(:interval) { 1.0 }
      @message    = options.fetch(:message) { "Get Up!"}
      @repeat     = options.fetch(:repeat) { false } 
    end

    def run
      timer = TimerEngine.new(name: @name, 
                              interval: @interval, 
                              message: @message, 
                              repeat: @repeat)
      Getup::Process.fork_me(timer)
    end
  end
end
