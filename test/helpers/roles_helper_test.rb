require 'test_helper'

class RolesHelperTest < ActionView::TestCase
  attr_accessor :current_user

  test 'registered users can edit owned ideas' do
    user = User.create(email: 'test@epfl.ch')
    self.current_user = user

    idea = Idea.create(title: 'A test idea!', user: user)

    assert can_edit? idea
  end

  test 'admin can edit ideas' do
    admin = User.create(email: 'admin@epfl.ch', role: 'admin')
    self.current_user = admin

    user = User.create(email: 'user@epfl.ch')
    idea = Idea.create(title: 'A test idea!', user: user)
    assert can_edit? idea
  end

  test 'registered user cannot edit another users ideas' do
    user = User.create(email: 'test@epfl.ch')
    self.current_user = user

    user2 = User.create(email: 'user2@epfl.ch')

    idea = Idea.create(title: 'A test idea!', user: user2)

    refute can_edit? idea
  end
end
