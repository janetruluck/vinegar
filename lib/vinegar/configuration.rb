#Configuration
module Vinegar
  module Configuration
    VALID_OPTIONS_KEYS = [
      :api_key,
      :api_version,
      :api_endpoint
    ]

    DEFAULT_API_VERSION   = 1.0
    DEFAULT_API_ENDPOINT  = "http://api.rottentomatoes.com/api/public/v#{DEFAULT_API_VERSION}"

    attr_accessor(*VALID_OPTIONS_KEYS)

    def configure
      yield self
    end

    def options
      VALID_OPTIONS_KEYS.inject({}){|o,k| o.merge!(k => send(k)) }
    end

    def reset!
      self.api_key             = nil
      self.api_version         = DEFAULT_API_VERSION
      self.api_endpoint        = DEFAULT_API_ENDPOINT
    end
  end
end
