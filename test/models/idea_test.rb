require 'test_helper'

class IdeaTest < ActiveSupport::TestCase
  test 'changing the title' do 
    idea = create_idea( 'Learn how to program')
    updated_at = idea.updated_at
    idea.title = 'Learn about Ruby on Rails'

    assert idea.save
    refute_equal idea.updated_at, updated_at
  end

  test 'removing the title' do 
    idea = create_idea( 'Learn how to program')
    updated_at = idea.updated_at

    idea.title = ''

    refute idea.save
    assert_equal idea.updated_at, updated_at
  end

  test 'the first empty Idea created is the first in the list' do
    first_idea = create_idea('first') 
    first_idea.save!
    second_idea = create_idea('second') 
    second_idea.save!
    assert_equal first_idea, Idea.all.first
  end

  test 'search - one matching result' do
    create_idea('Stand at the top of the Empire State building')
    result= Idea.search('the top')
    assert result.length == 1 
    assert_equal 'Stand at the top of the Empire State building', result[0].title
  end

  test 'search - no matching results' do
    create_idea('Stand at the top of the Empire State building')
    result = Idea.search('snorkeling')
    assert result.length == 0
  end

  test 'search - two matching ideas' do
    create_idea('Stand at the top of the Empire State building')
    create_idea('Stand on the pyramids')
    result = Idea.search('Stand')
    assert result.length == 2
    assert_equal 'Stand at the top of the Empire State building', result[0].title
    assert_equal 'Stand on the pyramids', result[1].title
  end

  test 'most_recent - no records exist' do
    result = Idea.most_recent
    assert result.length == 0
  end

  test 'most_recent - two idea records exist' do
    create_idea("one")
    create_idea("two")
    result = Idea.most_recent
    assert result.length == 2
    assert result[0].created_at > result[1].created_at
  end

  test 'most_recent - six idea records exist' do
    create_idea("one")
    create_idea("two")
    create_idea("three")
    create_idea("four")
    create_idea("five")
    create_idea("six")
    result = Idea.most_recent
    assert result.length == 3
    assert result[0].created_at > result[1].created_at
    assert result[0].created_at > result[2].created_at
  end

  test 'find by description' do 
    create_idea('Surfing in Portugal', 'See what the Atlantic coast waves are like')
    result = Idea.search('coast')
    assert result.length == 1
  end

  test 'find record by title or description' do 
    create_idea('Hike in the mountains in Italy', 'See the Dolomites and Italian Alps')
    create_idea('Overnight hike in Switzerland', 'Stay at in a refuge in the mountains')
    result = Idea.search('mountains')
    assert result.length == 2
  end

  test 'long title is not valid' do
    idea =    Idea.new(title: 'This title is too longThis title is too longThis title is too longThis title is too longThis title is too longThis title is too longThis title is too longThis title is too longThis title is too longThis title is too long')
    refute idea.valid?
  end

  test 'idea must have title' do
    idea = Idea.new
    refute idea.save
  end
end
