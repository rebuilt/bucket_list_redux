require "application_system_test_case"

class IdeaCommentsTest < ApplicationSystemTestCase
  test 'Adding a comment to an idea' do
    user = User.new(email: 'me@mail.com')
    user.save!
    visit(new_user_path)
    fill_in('user_email', with: 'me@mail.com')
    click_on('Log in')

    idea = create_idea('Volunteer for a charity')
    visit(idea_path(idea))
    fill_in('Add a comment', with: 'This is a fantastic idea!')
    click_on 'Post', match: :first
    assert_equal idea_path(idea), current_path
    assert page.has_content? 'This is a fantastic idea!'
  end

  test 'comments cannot be added when not logged in' do
    idea = create_idea('Volunteer for a charity')
    visit(idea_path(idea))
    refute page.has_content?('Add a comment')
  end
end
