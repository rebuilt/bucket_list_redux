class Idea < ApplicationRecord
  validates :title, presence: true
  validates :title, length: {maximum: 75}

  has_many :comments

  def self.search(search_term)
    where('title LIKE ?', "%#{search_term}%").or(where('description LIKE ?', "%#{search_term}%"))
  end

  def self.most_recent
    all.limit(3).order(created_at: :desc)
  end
end
