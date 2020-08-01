class Idea < ApplicationRecord
  def self.search(search_term)
    where('title LIKE ?', "%#{search_term}%")
  end

  def self.most_recent
    Idea.all.limit(3).order(created_at: :desc)
  end
end
