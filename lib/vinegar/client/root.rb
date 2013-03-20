# Root
module Vinegar
  class Client
    # Root level tasks for Rotten Tomatoes API
    #
    # @see http://developer.rottentomatoes.com/docs/json/v10/
    module Root
      # Returns the root of the api
      #
      # @see http://developer.rottentomatoes.com/docs/json/v10/
      #
      # @return api root
      #
      # @example Return the root of the api
      #   @client.root
      #
      # @author Jason Truluck
      def root(options = {})
        get("", options)
      end
    end
  end
end