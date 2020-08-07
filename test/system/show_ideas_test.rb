require 'application_system_test_case'

class ShowIdeasTest < ApplicationSystemTestCase
  test 'create and show an idea' do
    sign_up
    visit(new_idea_path)
    fill_in 'idea_title', with: 'Motorcycle'
    fill_in 'idea_description', with: 'Ride my moto'
    fill_in 'idea_photo_url', with: 'http://fpoimg.com/255x170'
    click_on 'Submit'

    click_on 'Motorcycle'
    assert page.has_content?('Motorcycle')

    click_on 'Edit'
    assert_equal edit_idea_path(Idea.first), current_path
  end
end
