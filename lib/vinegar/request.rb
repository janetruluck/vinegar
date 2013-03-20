module Vinegar
  module Request
    def get(path, options = {})
      response = request(:get, path, options)
      response.body
    end

    def post(path, options = {})
      response = request(:post, path, options)
      response
    end

    private
    def request(method, path, options = {})
      url = options.delete(:api_endpoint) || api_endpoint
      key = options.delete(:api_key) || api_key

      connection_options = {
        :url    => url
      }

      response = connection(connection_options).send(method) do |request|
        options.merge!(:apikey => key)

        case method
        when :get
          request.url(path, options)
        when :post
          request.path = path
          request.body = options unless options.empty?
        end
      end

      response
    end
  end
end