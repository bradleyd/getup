require "libnotify"

module Getup
  # notfiy engine
  # @note currently this is used for Ubuntu only
  class Notify
    attr_accessor :notify_engine
    # @param message [String] message to display
    # @param body [String] secondary message to display
    # @param notify_engine [Object] notification library
    def initialize(options={}, notify_engine=Libnotify)
      @message = options.fetch(:message) {"nothing important to say"}
      @body    = options.fetch(:body) { "woot!" }
      @timeout = options.fetch(:timeout) { 0.5}  
      self.notify_engine  = notify_engine
    end

    # display the message
    def show
      notify_engine.show(summary: @message,
                         body: @body, 
                         timeout: @timeout)
    end
  end
end

