class Article < ApplicationRecord
  scope :by_title, ->(search) { where('title ILIKE ?', "%#{search}%") }

  validates :title, :content, presence: true
end
