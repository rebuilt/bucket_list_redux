require "application_system_test_case"

class IdeasTest < ApplicationSystemTestCase
  test 'Create new idea' do
    visit(new_idea_path)
    fill_in 'title', with: "ride a camel"
    fill_in 'photo_url', with: "http://fpoimg.com/255x170?text=Preview"
    click_on 'Create idea'
    visit(ideas_path)
    assert page.has_content?('ride a camel')
  end

  test 'Two ideas are created and appear in ideas page' do 
    idea = Idea.new
    idea.title = "Ride a camel"
    idea.photo_url = "http://fpoimg.com/255x170?text=Preview"
    idea.save!
    idea2 = Idea.new
    idea2.title = "Have a wonderful day"
    idea2.photo_url = "http://fpoimg.com/255x170?text=Preview"
    idea2.save!

    visit(ideas_path)
    assert page.has_content? "Ride a camel"
    assert page.has_content?  "Have a wonderful day"
  end

  test 'editing an Idea' do
    idea = Idea.new
    idea.save!

    visit(edit_idea_path(idea))
    fill_in('title', with: 'Learn Ruby on Rails')
    click_on 'Edit idea'
    click_on 'Learn Ruby on Rails'
    assert page.has_content? 'Learn Ruby on Rails'
  end

  test 'search' do
    idea = Idea.new
    idea.title = 'Climb Mont Blanc'
    idea.photo_url = 'http://fpoimg.com/255x170' 
    idea.save!
    niagara = Idea.new
    niagara.title = 'Visit Niagara Falls'
    niagara.photo_url = 'http://fpoimg.com/255x170' 
    niagara.save!
    visit(root_path)
    fill_in 'q', with: 'Mont'
    click_on 'Search', match: :first
    assert_equal current_path, ideas_path
    assert page.has_content? 'Climb Mont Blanc'
    refute page.has_content? 'Visit Niagara Falls'

  end
end
