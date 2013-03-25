require "spec_helper"

# Movie Search Spec
describe Vinegar::Client do
  before do
    Vinegar.reset!
    Vinegar.configure do |c|
      c.api_key = ENV["API_KEY"]
    end
  end

  let(:vinegar) { Vinegar::Client.new(:api_key => ENV["API_KEY"]) }

  describe "#reviews", :vcr do
    let(:current_response) { vinegar.all_movie_reviews(ENV["MOVIE_ID"]) }

    it "returns the all_movie_review response" do
      current_response.should_not be_nil
    end

    describe "methods" do
      it "responds to .total" do
        current_response.should respond_to(:total)
      end

      it "responds to .reviews" do
        current_response.should respond_to(:reviews)
      end

      it "responds to .links" do
        current_response.should respond_to(:links)
      end

      it "responds to .link_template" do
        current_response.should respond_to(:link_template)
      end

      describe "within .reviews" do
        it "responds to .critic" do
          current_response.reviews.first.should respond_to(:critic)
        end

        it "responds to .date" do
          current_response.reviews.first.should respond_to(:date)
        end

        it "responds to .freshness" do
          current_response.reviews.first.should respond_to(:freshness)
        end

        it "responds to .publication" do
          current_response.reviews.first.should respond_to(:publication)
        end

        it "responds to .quote" do
          current_response.reviews.first.should respond_to(:quote)
        end

        it "responds to .links" do
          current_response.reviews.first.should respond_to(:links)
        end
      end

      describe "within .links" do
        it "responds to .self" do
          current_response.links.should respond_to(:self)
        end

        it "responds to .next" do
          current_response.links.should respond_to(:next)
        end

        it "responds to .alternate" do
          current_response.links.should respond_to(:alternate)
        end

        it "responds to .rel" do
          current_response.links.should respond_to(:rel)
        end
      end
    end

    context "#all_movie_reviews" do
      let(:current_response) { vinegar.all_movie_reviews(ENV["MOVIE_ID"]) }

      it "returns the all_movie_review response" do
        current_response.should_not be_nil
      end
    end

    context "#top_critic_movie_reviews" do
      let(:current_response) { vinegar.top_critic_movie_reviews(ENV["MOVIE_ID"]) }

      it "returns the top_critic_movie_review response" do
        current_response.should_not be_nil
      end
    end

    context "#dvd_movie_reviews" do
      let(:current_response) { vinegar.dvd_movie_reviews(ENV["MOVIE_ID"]) }

      it "returns the dvd_movie_review response" do
        current_response.should_not be_nil
      end
    end
  end
end