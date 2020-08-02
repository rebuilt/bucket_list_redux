require "application_system_test_case"

class IdeasTest < ApplicationSystemTestCase
  test 'Create new idea' do
    sign_in
    visit(new_idea_path)
    fill_in 'idea_title', with: "ride a camel"
    fill_in 'idea_photo_url', with: "http://fpoimg.com/255x170?text=Preview"
    click_on 'Submit'
    visit(ideas_path)
    assert page.has_content?('ride a camel')
  end

  test 'Two ideas are created and appear in ideas page' do 
    create_idea "Ride a camel"
    create_idea "Have a wonderful day"

    visit(ideas_path)
    assert page.has_content? "Ride a camel"
    assert page.has_content?  "Have a wonderful day"
  end

  test 'editing an Idea' do
    idea = create_idea 'none' 

    visit(edit_idea_path(idea))
    fill_in('idea_title', with: 'Learn Ruby on Rails')
    click_on 'Submit'
    click_on 'Learn Ruby on Rails'
    assert page.has_content? 'Learn Ruby on Rails'
  end

  test 'search' do
    create_idea  'Climb Mont Blanc'
    create_idea  'Visit Niagara Falls'

    visit(root_path)
    fill_in 'q', with: 'Mont'
    click_on 'Search', match: :first
    assert_equal current_path, ideas_path
    assert page.has_content? 'Climb Mont Blanc'
    refute page.has_content? 'Visit Niagara Falls'
  end

  test 'fail if ideas title is too long' do 
    idea = create_idea("First")
    visit(edit_idea_path(idea))
    fill_in('idea_title', with: 'This idea is too long. This idea is too long. This idea is too long. This idea is too long. This idea is too long. This idea is too long. This idea is too long. This idea is too long. This idea is too long. This idea is too long. This idea is too long. This idea is too long. ')
    click_on('Submit')
    assert page.has_content? 'Title is too long'
  end
end
