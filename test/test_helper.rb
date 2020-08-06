ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # fixtures :all

  # Add more helper methods to be used by all tests here...
  def create_idea(title = 'default title', description = 'default description', photo_url = 'http://fpoimg.com/255x170?text=Preview', done_count = 666, user = create_user)
    idea = Idea.new(title: title, description: description, photo_url: photo_url, done_count: done_count, user: user)
    idea.save!
    idea
  end

  def sign_up
    visit(new_user_path)
    fill_in('user_email', with: 'me@mail.com')
    fill_in('user_password', with: 'a')
    within '.new_user' do
      click_on('Sign up')
    end
  end

  def create_user(email = 'me@mail.com', password = '123456')
    user = User.new(email: email, password: password)
    user.save
    user
  end
end
