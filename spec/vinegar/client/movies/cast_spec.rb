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

  describe "#full_movie_cast", :vcr do
    let(:current_response) { vinegar.full_movie_cast(ENV["MOVIE_ID"]) }

    it "returns the full_movie_cast response" do
      current_response.should_not be_nil
    end

    describe "methods" do
      it "responds to .cast" do
        current_response.should respond_to(:cast)
      end

      it "responds to .links" do
        current_response.should respond_to(:links)
      end

      describe "within .links" do
        it "responds to .rel" do
          current_response.links.should respond_to(:rel)
        end
      end

      describe "within .cast" do
        it "responds to .id" do
          current_response.cast.first.should respond_to(:id)
        end

        it "responds to .name" do
          current_response.cast.first.should respond_to(:name)
        end

        it "responds to .characters" do
          current_response.cast.first.should respond_to(:characters)
        end
      end
    end
  end
end