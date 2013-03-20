require "spec_helper"

auth = authentications = YAML::load(File.open(File.expand_path("../../fixtures/authentications.yml", __FILE__)))
p auth

# Client Spec
describe Vinegar::Client do
  before do
    Vinegar.reset!
    Vinegar.configure do |c|
      c.api_key = auth["api_key"]
    end
  end

  describe "#initialize" do
    it "can be initialized" do
      Vinegar::Client.new.class.should == Vinegar::Client
    end

    it "works with and api key", :vcr do
      response = Vinegar::Client.new(:api_key => auth["api_key"]).root
      response.should_not
      raise_exception
    end
  end
end