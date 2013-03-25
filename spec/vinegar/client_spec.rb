require "spec_helper"

# Client Spec
describe Vinegar::Client do
  before do
    Vinegar.reset!
    Vinegar.configure do |c|
      c.api_key = ENV["API_KEY"]
    end
  end

  describe "#initialize" do
    it "can be initialized" do
      Vinegar::Client.new.class.should == Vinegar::Client
    end

    it "is aliased within itself" do
      Vinegar.new.class.should == Vinegar::Client
    end

    it "works with and api key", :vcr do
      response = Vinegar::Client.new(:api_key => ENV["API_KEY"]).root
      response.should_not
      raise_exception
    end

    it "can be configured to use a new endpoint via options" do
      endpoint = "http://new.endpoint.com"
      client = Vinegar::Client.new(:api_key => ENV["API_KEY"], :api_endpoint => endpoint )
      client.api_endpoint.should == endpoint
    end

    it "can be configured to use a new API version via options" do
      version = 2.0
      client = Vinegar::Client.new(:api_key => ENV["API_KEY"], :api_version => version )
      client.api_version.should == version
    end

    it "can not make requests without authorization" do
      client = Vinegar::Client.new
      client.root.should == "You must enter your API key to authorize your requests."
    end
  end

  describe "#respond_to?" do
    it "returns true if the method exists" do
      Vinegar.respond_to?(:movies_search).should == true
    end

    it "returns false if the method does not exists" do
      Vinegar.respond_to?(:missing_method).should == false
    end

    it "can check private methods if the 'include_private' flag is true" do
      Vinegar.respond_to?(:request, true).should == true
    end

    it "can not check private methods if the 'include_private' flag is false" do
      Vinegar.respond_to?(:request, false).should == false
    end
  end
end