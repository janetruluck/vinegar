require "spec_helper"

auth = YAML::load(File.open(File.expand_path("../../../../fixtures/authentications.yml", __FILE__)))

# Movie Search Spec
describe Vinegar::Client do
  before do
    Vinegar.reset!
    Vinegar.configure do |c|
      c.api_key = auth["api_key"]
    end
  end

  let(:vinegar) { Vinegar::Client.new(:api_key => auth["api_key"]) }

  describe "#similar_movies", :vcr do
    let(:current_response) { vinegar.similar_movies(auth["movie_id"]) }

    it "returns the similar_movies response" do
      current_response.should_not be_nil
    end

    describe "methods" do
      it "responds to .movies" do
        current_response.should respond_to(:movies)
      end

      it "responds to .links" do
        current_response.should respond_to(:links)
      end

      it "responds to .link_template" do
        current_response.should respond_to(:link_template)
      end

      describe "within each .movies item" do
        it "responds to .id" do
          current_response.movies.first.should respond_to(:id)
        end

        it "responds to .title" do
          current_response.movies.first.should respond_to(:title)
        end

        it "responds to .year" do
          current_response.movies.first.should respond_to(:year)
        end

        it "responds to .mpaa_rating" do
          current_response.movies.first.should respond_to(:mpaa_rating)
        end

        it "responds to .runtime" do
          current_response.movies.first.should respond_to(:runtime)
        end

        it "responds to .critics_consensus" do
          current_response.movies.first.should respond_to(:critics_consensus)
        end

        it "responds to .release_dates" do
          current_response.movies.first.should respond_to(:release_dates)
        end

        it "responds to .ratings" do
          current_response.movies.first.should respond_to(:ratings)
        end

        it "responds to .synopsis" do
          current_response.movies.first.should respond_to(:synopsis)
        end

        it "responds to .posters" do
          current_response.movies.first.should respond_to(:posters)
        end

        it "responds to .abridged_cast" do
          current_response.movies.first.should respond_to(:abridged_cast)
        end

        it "responds to .alternate_ids" do
          current_response.movies.first.should respond_to(:alternate_ids)
        end

        it "responds to .links" do
          current_response.should respond_to(:links)
        end

        describe "within .release_dates" do
          it "responds to .theater" do
            current_response.movies.first.release_dates.should respond_to(:theater)
          end

          it "responds to .dvd" do
            current_response.movies.first.release_dates.should respond_to(:dvd)
          end
        end

        describe "within .ratings" do
          it "responds to .critics_rating" do
            current_response.movies.first.ratings.should respond_to(:critics_rating)
          end

          it "responds to .critics_score" do
            current_response.movies.first.ratings.should respond_to(:critics_score)
          end

          it "responds to .audience_rating" do
            current_response.movies.first.ratings.should respond_to(:audience_rating)
          end

          it "responds to .audience_score" do
            current_response.movies.first.ratings.should respond_to(:audience_score)
          end
        end

        describe "within .posters" do
          it "responds to .thumbnail" do
            current_response.movies.first.posters.should respond_to(:thumbnail)
          end

          it "responds to .profile" do
            current_response.movies.first.posters.should respond_to(:profile)
          end

          it "responds to .detailed" do
            current_response.movies.first.posters.should respond_to(:detailed)
          end

          it "responds to .original" do
            current_response.movies.first.posters.should respond_to(:original)
          end
        end

        describe "within each .abridged_cast item" do
          it "responds to .name" do
            current_response.movies.first.abridged_cast.first.should respond_to(:name)
          end

          it "responds to .characters" do
            current_response.movies.first.abridged_cast.first.should respond_to(:characters)
          end
        end

        describe "within .links" do
          it "responds to .self" do
            current_response.movies.first.links.should respond_to(:self)
          end

          it "responds to .alternate" do
            current_response.movies.first.links.should respond_to(:alternate)
          end

          it "responds to .cast" do
            current_response.movies.first.links.should respond_to(:cast)
          end

          it "responds to .clips" do
            current_response.movies.first.links.should respond_to(:clips)
          end

          it "responds to .reviews" do
            current_response.movies.first.links.should respond_to(:reviews)
          end

          it "responds to .similar" do
            current_response.movies.first.links.should respond_to(:similar)
          end
        end
      end

      describe "within .links" do
        it "responds to .rel" do
          current_response.links.should respond_to(:rel)
        end

        it "responds to .self" do
          current_response.links.should respond_to(:self)
        end
      end
    end
  end
end