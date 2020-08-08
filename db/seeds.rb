# create an admin User and a registered User.
admin = User.create! email: 'neill@extensionschool.ch',
                     password: 'password',
                     name: 'NJ Pearman',
                     role: 'admin'

user1 = User.create! email: 'visitor@extensionschool.ch',
                     password: 'password',
                     name: 'Visitor'

user2 = User.create! email: 'visitor2@extensionschool.ch',
                     password: 'password',
                     name: 'Visitor'

user3 = User.create! email: 'visitor3@extensionschool.ch',
                     password: 'password',
                     name: 'Visitor'

photo_url = 'http://fpoimg.com/255x170'
5.times do |i|
  Idea.create! user: admin,
               title: "Neill's idea #{admin.name}. Idea #: #{i}", photo_url: photo_url
  Idea.create! title: "Idea for user #{user1.name}. Idea #: #{i} ", user: user1, photo_url: photo_url
  Idea.create! title: "Idea for user #{user2.name} Idea #: #{i} ", user: user2, photo_url: photo_url
  Idea.create! title: "Idea for user #{user3.name} Idea #: #{i} ", user: user3, photo_url: photo_url
end
