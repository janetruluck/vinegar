# Clip
module Vinegar
  class Client
    # Clip
    #
    # @see http://developer.rottentomatoes.com/docs/json/v10/Movie_Clips
    module Clip
      # Related movie clips and trailers for a movie
      #
      # @see http://developer.rottentomatoes.com/docs/json/v10/Movie_Clips
      #
      # @param [Integer] movie_id The id of the movie from Rotten Tomatoes
      #
      # @return [Hashie::Mash] Clips movies response
      #
      # @example Get the similar movies for a movie
      #   @client.clips_for_movie(12345)
      #
      # @author Jason Truluck
      def clips_for_movie(movie_id, options = {})
        get("movies/#{movie_id}/clips.json", options)
      end
    end
  end
end