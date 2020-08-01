ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # fixtures :all

  # Add more helper methods to be used by all tests here...
  def create_idea(title = "default title", description = "default description", photo_url = "http://fpoimg.com/255x170?text=Preview", done_count = 666)
    idea = Idea.new(title: title, description: description, photo_url: photo_url, done_count: done_count)
    idea.save!
    idea
  end
end
