# Connection
require "faraday_middleware"

module Vinegar
  module Connection
    def connection(options = {})
      connection = Faraday.new(options) do |build|
        build.use FaradayMiddleware::Mashify
        build.use FaradayMiddleware::ParseJson
        build.adapter  Faraday.default_adapter
      end

      connection
    end
  end
end