require "application_system_test_case"

class IdeaCommentsTest < ApplicationSystemTestCase
  test 'Adding a comment to an idea' do
    idea = create_idea('Volunteer for a charity')
    visit(idea_path(idea))
    fill_in('Add a comment', with: 'This is a fantastic idea!')
    click_on 'Post', match: :first
    assert_equal idea_path(idea), current_path
  end
end
