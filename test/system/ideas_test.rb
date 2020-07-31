require "application_system_test_case"

class IdeasTest < ApplicationSystemTestCase
  test 'Create new idea' do
    visit(ideas_new_path)
    fill_in 'title', with: "ride a camel"
    fill_in 'done_count', with: "1,344"
    fill_in 'photo_url', with: "http://fpoimg.com/255x170?text=Preview"
    click_on 'Create idea'
    visit(ideas_path)
    assert page.has_content?('ride a camel')
  end

  test 'Two ideas are created and appear in ideas page' do 
    idea = Idea.new
    idea.title = "Ride a camel"
    idea.done_count = 1223
    idea.photo_url = "http://fpoimg.com/255x170?text=Preview"
    idea.save!
    idea2 = Idea.new
    idea2.title = "Have a wonderful day"
    idea2.done_count = 1223
    idea2.photo_url = "http://fpoimg.com/255x170?text=Preview"
    idea2.save!

    visit(ideas_path)
    assert page.has_content? "Ride a camel"
    assert page.has_content?  "Have a wonderful day"
  end
end
