require "application_system_test_case"

class ShowIdeasTest < ApplicationSystemTestCase
  test 'create and show an idea' do 
    idea = Idea.new
    idea.title = "Motorcycle"
    idea.done_count = 4444
    idea.photo_url = "http://fpoimg.com/255x170?text=Preview"
    idea.user = create_user
    idea.save!

    visit(idea_path(idea))
    assert page.has_content?('Motorcycle')
    assert page.has_content?('4444')
    assert page.has_content?("Created on "+ idea.created_at.strftime("%d %b '%y"))

    click_on "Edit"
    assert_equal current_path, idea_path(idea)
  end
end
