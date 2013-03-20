# Movies
module Vinegar
  class Client
    # Movies Search
    #
    # @see http://developer.rottentomatoes.com/docs/json/v10/Movies_Search
    module Movie
      # Returns the response from querying the movies search endpoint
      #
      # @see http://developer.rottentomatoes.com/docs/json/v10/Movies_Search
      #
      # @param [String] query The query you want to search on
      # @param [Integer] page_limit The amount of movie search results to show per page
      # @param [Integer] page The selected page of movie search results
      #
      # @return [Hashie::Mash] Movies serach Response
      #
      # @example Get the search results for a query
      #   @client.movies_search("Movie Title")
      #
      # @example Get the search results for a query with a page limit
      #   @client.movies_search("Movie Title", 10)
      #
      # @example Get the search results for a query with a page limit and a page
      #   @client.movies_search("Movie Title", 10, 1)
      #
      # @author Jason Truluck
      def movies_search(query, per_page = "", page = "", options = {})
        options.merge!(
          :q          => query,
          :page_limit => per_page,
          :page       => page
        )
        get("movies.json", options)
      end

      # Detailed information on a specific movie specified by Id. You can use the movies search endpoint
      # or peruse the lists of movies/dvds to get the urls to movies.
      #
      # @see http://developer.rottentomatoes.com/docs/json/v10/Movie_Info
      #
      # @param [Integer] Movie ID from Rotten Tomatoes
      #
      # @return [Hashie::Mash] Movie Response
      #
      # @example Get the search results for a query
      #   @client.movie(12345)
      #
      # @author Jason Truluck
      def movie(movie_id, options = {})
        get("movies/#{movie_id}.json", options)
      end
    end
  end
end