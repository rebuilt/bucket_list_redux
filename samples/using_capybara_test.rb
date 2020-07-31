require 'application_system_test_case'

Capybara.run_server = false

class CapybaraTest < ApplicationSystemTestCase
  test 'capybara works' do
    visit('http://www.google.com')
    sleep(1.seconds)
    fill_in('q', with: 'Cinque Terre')
    sleep(1.seconds)
    click_on('gNO89b', match: :first)
    click_on('Italian Riviera', match: :first)
    sleep(1.seconds)
    click_on('Guides')
    sleep(20.seconds)
  end

  test 'We can use capybara' do 
    visit('http://en.wikipedia.org/wiki/Internet')
    fill_in('searchInput', with: 'Ruby programming language')
    sleep(5.seconds)
    click_on 'searchButton', match: :first
    sleep(5.seconds)
    click_on 'Examples', match: :first
    sleep(5.seconds)
    click_on 'Hello world', match: :first
  end
end
