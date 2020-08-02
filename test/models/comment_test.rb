require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test 'changing the associated Idea for a Comment' do 
    idea = create_idea("Great idea")
    comment = Comment.new(body: "I'd like to do this!", idea: idea)
    idea2 = create_idea("Second idea")
    comment.idea = idea2
    comment.save
    assert_equal comment.idea, idea2
  end

  test 'cascading save' do 
    idea = create_idea("Great idea")
    comment = Comment.new(body: "Great idea!")
    idea.comments << comment
    idea.save!
    assert_equal Comment.first, comment
  end

  test 'Comments are ordered correctly' do 
    idea = create_idea("Great idea")
    comment = Comment.new(body: "This would be great fun")
    comment2 = Comment.new(body: "I agree!  I'd like to do this as well")
    idea.comments << comment
    idea.comments << comment2
    idea.save!

    assert_equal idea.comments[0], comment
    assert_equal idea.comments.length, 2 
  end
end
