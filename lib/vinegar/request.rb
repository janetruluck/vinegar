module Vinegar
  module Request
    def get(path, options = {})
      response = request(:get, path, options)
      response.body
    rescue Vinegar::UnauthorizedError
      "You must enter your API key to authorize your requests."
    end

    private
    def request(method, path, options = {})
      authenticated?

      url = options.delete(:api_endpoint) || api_endpoint
      key = options.delete(:api_key)      || api_key

      connection_options = {
        :url    => url
      }

      response = connection(connection_options).send(method) do |request|
        options.merge!(:apikey => key)

        case method
        when :get
          request.url(path, options)
        end
      end

      response
    end
  end
end