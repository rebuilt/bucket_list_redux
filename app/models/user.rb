class User < ApplicationRecord
  has_many :comments
  has_many :ideas
  before_validation :downcase_email
  validates :email, uniqueness: true
  validates :email, :password, presence: true
  attribute :role, :string, default: 'registered'

  has_secure_password

  has_and_belongs_to_many :goals, class_name: 'Idea'

  private

  def downcase_email
    self.email = email.downcase
  end
end
