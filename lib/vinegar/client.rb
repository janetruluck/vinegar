# Client Module
require "vinegar/authentication"
require "vinegar/connection"
require "vinegar/request"

require "vinegar/client/root"
require "vinegar/client/movie"
require "vinegar/client/movie/review"
require "vinegar/client/movie/cast"
require "vinegar/client/movie/similar"
require "vinegar/client/movie/clip"

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
    include Vinegar::Client::Review
    include Vinegar::Client::Cast
    include Vinegar::Client::Similar
    include Vinegar::Client::Clip
  end
end