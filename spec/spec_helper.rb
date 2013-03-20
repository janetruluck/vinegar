require 'rubygems'

# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'

if ENV['RAILS_ENV'] == 'test'
  require 'simplecov'
  SimpleCov.start 'rails'
  class SimpleCov::Formatter::QualityFormatter
    def format(result)
      SimpleCov::Formatter::HTMLFormatter.new.format(result)
      File.open("coverage/covered_percent", "w") do |f|
        f.puts result.source_files.covered_percent.to_f
      end
    end
  end
  SimpleCov.formatter = SimpleCov::Formatter::QualityFormatter
end

require 'vinegar'
require 'vcr'
require "webmock/rspec"
require "mocha/api"

# Load Authentications
auth = YAML::load(File.open(File.expand_path("../fixtures/authentications.yml", __FILE__)))

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :faraday
  c.ignore_localhost = true
  # Uncomment if you need to log VCR
  # c.debug_logger = File.open(Rails.root.join("log","vcr_debugger.log"), 'w')
  c.configure_rspec_metadata!
  c.allow_http_connections_when_no_cassette = true
end

WebMock.allow_net_connect!

Dir[File.expand_path("spec/support/**/*.rb", __FILE__)].each {|f| require f}

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.order                                           = "random"
end
