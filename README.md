# Vinegar

Rotten Tomatoes API Wrapper in Ruby. Currently the wrapper supports the movies api and lists api is comming shortly.

## Installation

Add this line to your application's Gemfile:

    gem 'vinegar'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install vinegar

## Documentation

http://rdoc.info/github/jasontruluck/vinegar

## Usage

### Setup a new client

```ruby
client = Vinegar::Client.new(:api_key => 1234567890)
```

### [Search for movies](http://rdoc.info/github/jasontruluck/vinegar/Vinegar/Client/Movie#movies_search-instance_method)

```ruby
client.movies_search("Star Wars")
```

### [View a single movie](http://rdoc.info/github/jasontruluck/vinegar/Vinegar/Client/Movie#movie-instance_method)

```ruby
client.movie(12345) #12345 is the movies Rotten Tomatoes ID
```

### [Get the cast for a movie](http://rdoc.info/github/jasontruluck/vinegar/Vinegar/Client/Cast)

```ruby
client.full_movie_cast(12345) #12345 is the movies Rotten Tomatoes ID
```

### [Get reviews for a movie](http://rdoc.info/github/jasontruluck/vinegar/Vinegar/Client/Review)

```ruby
client.all_movie_reviews(12345) #12345 is the movies Rotten Tomatoes ID
```

### [Get similar movies for a movie](http://rdoc.info/github/jasontruluck/vinegar/Vinegar/Client/Similar)

```ruby 
client.similar_movies(12345) #12345 is the movies Rotten Tomatoes ID
```

### [Get clips for a movie](http://rdoc.info/github/jasontruluck/vinegar/Vinegar/Client/Clip)

```ruby 
client.clips_for_movie(12345) #12345 is the movies Rotten Tomatoes ID
```

## Testing

This gem uses VCR to record requests to the api so you must test using a valid API key from Rotten Tomatoes.

Add a sample authentications file to your `spec/fixtures` directory:
    
```ruby
#spec/fixtures/authentications.yml
api_key:        1234567890 # Your API key
movies_search: "Star Wars" # Movie title you would like to use for search tests
movie_id:       9          # ID of a movie you would like to use for movie tests
```

A sample is included in the [directory](https://github.com/jasontruluck/vinegar/blob/master/spec/fixtures/authentication.yml.sample).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
