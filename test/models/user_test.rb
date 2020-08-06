require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'email attribute of User model is always lowercase before being validated' do
    user = User.new(email: 'ME@MAIL.COM', password: 'a')
    user.save
    assert_equal 'me@mail.com', user.email
  end
end
