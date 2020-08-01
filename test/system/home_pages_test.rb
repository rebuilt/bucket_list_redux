require "application_system_test_case"

class HomePagesTest < ApplicationSystemTestCase

  test 'recent ideas display on homepage' do
    create_idea("oneidea")
    create_idea("twoidea")
    create_idea("threeidea")
    create_idea("fouridea")
    visit(root_path)
    assert page.has_content?('twoidea') 
    assert page.has_content?('threeidea') 
    assert page.has_content?('fouridea') 

  end
end
