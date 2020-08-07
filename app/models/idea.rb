class Idea < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { maximum: 75 }

  has_many :comments
  belongs_to :user

  has_and_belongs_to_many :users

  scope :search, ->(term) { title_contains(term).or(description_contains(term)) }

  scope :most_recent, -> { all.order(created_at: :desc) }

  scope :title_contains, ->(term) { where('title LIKE ?', "%#{term}%") }
  scope :description_contains, ->(term) { where('description LIKE ?', "%#{term}%") }
end
