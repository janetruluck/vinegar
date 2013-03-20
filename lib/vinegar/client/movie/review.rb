# Reviews
module Vinegar
  class Client
    # Reviews
    #
    # @see http://developer.rottentomatoes.com/docs/json/v10/Movie_Reviews
    module Review
      # Retrieves all reviews for a movie. Results are paginated if they go past the specified page limit
      #
      # @see http://developer.rottentomatoes.com/docs/json/v10/Movie_Reviews
      #
      # @param [Integer] movie_id The id of the movie from Rotten Tomatoes
      # @param [String] country Provides localized data for the selected country if available. Otherwise, returns US data.
      # @param [Integer] page_limit The amount of movie search results to show per page
      # @param [Integer] page The selected page of movie search results
      #
      # @return [Hashie::Mash] Movies reviews Response
      #
      # @example Get the search results for a query
      #   @client.all_movie_reviews("12345")
      #
      # @author Jason Truluck
      def all_movie_reviews(movie_id, country = "us", per_page = "", page = "", options = {})
        options.merge!(
          :review_type  => :all,
          :country      => country,
          :page_limit   => per_page,
          :page         => page
        )
        reviews(movie_id, options)
      end

      # Retrieves top_critic reviews for a movie. Results are paginated if they go past the specified page limit
      #
      # @see http://developer.rottentomatoes.com/docs/json/v10/Movie_Reviews
      #
      # @param [Integer] movie_id The id of the movie from Rotten Tomatoes
      # @param [String] country Provides localized data for the selected country if available. Otherwise, returns US data.
      # @param [Integer] page_limit The amount of movie search results to show per page
      # @param [Integer] page The selected page of movie search results
      #
      # @return [Hashie::Mash] Movies reviews Response
      #
      # @example Get the search results for a query
      #   @client.top_critic_movie_reviews("12345")
      #
      # @author Jason Truluck
      def top_critic_movie_reviews(movie_id, country = "us", per_page = "", page = "", options = {})
        options.merge!(
          :review_type  => :top_critic,
          :country      => country,
          :page_limit   => per_page,
          :page         => page
        )
        reviews(movie_id, options)
      end

      # Retrieves dvd reviews for a movie. Results are paginated if they go past the specified page limit
      #
      # @see http://developer.rottentomatoes.com/docs/json/v10/Movie_Reviews
      #
      # @param [Integer] movie_id The id of the movie from Rotten Tomatoes
      # @param [String] country Provides localized data for the selected country if available. Otherwise, returns US data.
      # @param [Integer] page_limit The amount of movie search results to show per page
      # @param [Integer] page The selected page of movie search results
      #
      # @return [Hashie::Mash] Movies reviews Response
      #
      # @example Get the search results for a query
      #   @client.dvd_movie_reviews("12345")
      #
      # @author Jason Truluck
      def dvd_movie_reviews(movie_id, country = "us", per_page = "", page = "", options = {})
        options.merge!(
          :review_type  => :dvd,
          :country      => country,
          :page_limit   => per_page,
          :page         => page
        )
        reviews(movie_id, options)
      end

      private
      # @private
      #
      # General method to handle endpoints for grabing reviews
      #
      # @param [Integer] movie_id The id of the movie from Rotten Tomatoes
      #
      # @return [Hashie::Mash] Movies reviews Response
      #
      # @author Jason Truluck
      def reviews(movie_id, options)
        get("movies/#{movie_id}/reviews.json", options)
      end
    end
  end
end