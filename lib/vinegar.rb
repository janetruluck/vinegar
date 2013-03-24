require "vinegar/version"
require "vinegar/configuration"
require "vinegar/error"
require "vinegar/client"

module Vinegar
  extend Configuration

  class << self
    # Alias for Vinegar::Client.new
    # @return [Vinegar::Client]
    def new(options = {})
      Vinegar::Client.new(options)
    end

    def respond_to?(method, include_private=false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end
  end
end