require 'application_system_test_case'

class LogInsTest < ApplicationSystemTestCase
  test 'can log in' do
    visit(new_user_path)
    fill_in('user_email', with: 'me@mail.com')
    fill_in('user_password', with: 'a')
    within '.new_user' do
      click_on 'Sign up'
    end
    assert_equal User.all.length, 1
    assert_equal User.first.email, 'me@mail.com'
  end

  test 'additional sign up does not create a User' do
    visit(new_user_path)
    fill_in('user_email', with: 'me@mail.com')
    fill_in('user_password', with: 'a')
    within '.new_user' do
      click_on 'Sign up'
    end

    assert_equal User.all.length, 1
    assert_equal User.first.email, 'me@mail.com'
    visit(new_user_path)
    fill_in('user_email', with: 'me@mail.com')
    fill_in('user_password', with: 'a')
    within '.new_user' do
      click_on 'Sign up'
    end
    assert_equal User.all.length, 1
    assert_equal User.first.email, 'me@mail.com'
  end
end
