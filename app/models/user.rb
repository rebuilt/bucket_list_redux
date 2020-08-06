class User < ApplicationRecord
  has_many :comments
  has_many :ideas
  validates :email, uniqueness: true

  has_secure_password

  has_and_belongs_to_many :goals, class_name: 'Idea'
end
