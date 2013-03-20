# Client Module
require "vinegar/authentication"
require "vinegar/connection"
require "vinegar/request"

require "vinegar/client/root"
require "vinegar/client/movie"

module Vinegar
  class Client
    attr_accessor(*Configuration::VALID_OPTIONS_KEYS)

    def initialize(options = {})
      options = Vinegar.options.merge(options)

      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end

      login_token(options[:api_key])
    end


    include Vinegar::Authentication
    include Vinegar::Connection
    include Vinegar::Request

    include Vinegar::Client::Root
    include Vinegar::Client::Movie
  end
end