# Authentication Module
module Vinegar
  module Authentication
    def authentication
      if api_key
        { :api_key => api_key}
      else
        {}
      end
    end

    def authenticated?
      !authentication.empty?
    end

    def login_token(api_key = "")
      return if api_key.nil?
      self.api_key  = api_key
    end
  end
end