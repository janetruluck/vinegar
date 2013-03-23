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

  describe "#clips_for_movie", :vcr do
    let(:current_response) { vinegar.clips_for_movie(auth["movie_id"]) }

    it "should return the clips_for_movie response" do
      current_response.should_not be_nil
    end

    describe "methods" do
      it "responds to .clips" do
        current_response.should respond_to(:clips)
      end

      it "responds to .links" do
        current_response.should respond_to(:links)
      end

      describe "within each .clips item" do
        it "responds to .title" do
          current_response.clips.first.should respond_to(:title)
        end

        it "responds to .duration" do
          current_response.clips.first.should respond_to(:duration)
        end

        it "responds to .thumbnail" do
          current_response.clips.first.should respond_to(:thumbnail)
        end

        it "responds to .links" do
          current_response.clips.first.should respond_to(:links)
        end
      end

      describe "within .links" do
        it "responds to .self" do
          current_response.links.should respond_to(:self)
        end

        it "responds to .alternate" do
          current_response.links.should respond_to(:alternate)
        end

        it "responds to .rel" do
          current_response.links.should respond_to(:rel)
        end
      end
    end
  end
end