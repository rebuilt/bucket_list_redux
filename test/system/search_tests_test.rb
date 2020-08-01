require "application_system_test_case"

class SearchTestsTest < ApplicationSystemTestCase
  test 'title and description searches' do
    create_idea('Go cycling across Europe', 'An amazing way to see lots of Europe')
    create_idea('Visit Provence', 'Go to vineyards, go cycling up Mont Ventoux, see the fields of lavender')
    create_idea('Overnight hike in Switzerland', 'Stay in a Swiss refuge in the mountains')
    visit(root_path)
    fill_in('q', with: 'cycling')
    click_on('Search', match: :first)
    assert page.has_content?('Go cycling across Europe')
    assert page.has_content?('Visit Provence')
    refute page.has_content?('Overnight hike in Switzerland')
  end
end
