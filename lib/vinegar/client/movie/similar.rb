# Similar
module Vinegar
  class Client
    # Similar
    #
    # @see http://developer.rottentomatoes.com/docs/json/v10/Movie_Similar
    module Similar
      # Shows similar movies for a movie.
      #
      # @see http://developer.rottentomatoes.com/docs/json/v10/Movie_Similar
      #
      # @param [Integer] movie_id The id of the movie from Rotten Tomatoes
      # @param [Integer] limit Limit the number of similar movies to show
      #
      # @return [Hashie::Mash] Similar movies response
      #
      # @example Get the similar movies for a movie
      #   @client.similar_movies(12345)
      #
      # @author Jason Truluck
      def similar_movies(movie_id, limit = 5, options = {})
        options.merge!(
          :limit => limit
        )
        get("movies/#{movie_id}/similar.json", options)
      end
    end
  end
end