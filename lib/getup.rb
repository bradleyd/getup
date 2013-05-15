require "getup/version"
require "getup/process"
require "getup/notify"
require "getup/timer_engine"

# getup toplevel
module Getup
  # init is the public facing api to getup
  class Init
    # @param options [Hash]
    # @param name [String] name of the alert
    # @param interval [Integer] amount of time in seconds for the alert
    # @param message [String] message the alert will display
    # @param repeat [Boolean] repeat the timer or not
    #
    # @example
    #  Getup::Init.new(name: "foo",
    #                  interval: 10, #seconds
    #                  message: "this is the top level message",
    #                  repeat: false) #this is a one off timer alert

    def initialize(options={})
      @name       = options.fetch(:name) { "foo" }
      @interval   = options.fetch(:interval) { 1.0 }
      @message    = options.fetch(:message) { "Get Up!"}
      @repeat     = options.fetch(:repeat) { false } 
    end

    # create timer object
    # fire and forget process
    def run
      timer = TimerEngine.new(name: @name, 
                              interval: @interval, 
                              message: @message, 
                              repeat: @repeat)
      Getup::Process.fork_me(timer)
    end
  end
end
