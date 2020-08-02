require "application_system_test_case"

class LogInsTest < ApplicationSystemTestCase
  test 'can log in' do
  visit(new_user_path)
  fill_in('user_email', with: 'me@mail.com')
  click_on 'Log in'
  assert_equal User.all.length, 1
  assert_equal User.first.email, 'me@mail.com'
  end

  test 'additional log in does not create a User' do
  visit(new_user_path)
  fill_in('user_email', with: 'me@mail.com')
  click_on 'Log in'
  assert_equal User.all.length, 1
  assert_equal User.first.email, 'me@mail.com'
  visit(new_user_path)
  fill_in('user_email', with: 'me@mail.com')
  click_on 'Log in'
  assert_equal User.all.length, 1
  assert_equal User.first.email, 'me@mail.com'
  end
end
