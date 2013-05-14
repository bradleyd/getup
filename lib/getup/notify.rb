require "libnotify"

module Getup
  class Notify
    def initialize(opts={})
      @message = opts.fetch(:message) {"nothing important to say"}
      @body    = opts.fetch(:body) { "woot!" }
      @timeout = 2.0 # default
      @engine  = Libnotify.new(summary: @message, body: @body, timeout: @timeout)
    end

    def show
      @engine.update
    end
  end
end

