# Cast
module Vinegar
  class Client
    # Cast
    #
    # @see http://developer.rottentomatoes.com/docs/json/v10/Movie_Cast
    module Cast
      # Pulls the complete movie cast for a movie
      #
      # @see http://developer.rottentomatoes.com/docs/json/v10/Movie_Cast
      #
      # @param [Integer] movie_id The id of the movie from Rotten Tomatoes
      #
      # @return [Hashie::Mash] Movie cast response
      #
      # @example Get the cast results for a movie
      #   @client.full_movie_cast(12345)
      #
      # @author Jason Truluck
      def full_movie_cast(movie_id, options = {})
        get("movies/#{movie_id}/cast.json", options)
      end
    end
  end
end