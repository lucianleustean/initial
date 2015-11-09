ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'spec_helper'
require 'rspec/rails'
require 'capybara/rspec'
require 'database_cleaner'
require 'factory_girl'
FactoryGirl.find_definitions

RSpec.configure do |config|
  config.include Mongoid::Matchers, type: :model
  config.include FactoryGirl::Syntax::Methods
  config.include Capybara::DSL

  config.infer_spec_type_from_file_location!

  config.before(:suite) do
    DatabaseCleaner[:mongoid].strategy = :truncation
    DatabaseCleaner[:mongoid].clean_with(:truncation)

    # Mongoid 5 is very noisy at DEBUG level by default
    Mongoid.logger.level = Logger::INFO
    Mongo::Logger.logger.level = Logger::INFO if defined?(Mongo)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
