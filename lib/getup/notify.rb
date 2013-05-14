require "libnotify"

module Getup
  # notfiy engine
  # @note currently this is used for Ubuntu only
  class Notify
    def initialize(opts={})
      @message = opts.fetch(:message) {"nothing important to say"}
      @body    = opts.fetch(:body) { "woot!" }
      @timeout = 2.0 # default
      @engine  = Libnotify.new(summary: @message,
                               body: @body, 
                               timeout: @timeout)
    end

    # display the message
    def show
      @engine.update
    end
  end
end

