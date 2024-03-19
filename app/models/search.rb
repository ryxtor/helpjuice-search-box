class Search < ApplicationRecord
  belongs_to :user

  scope :trending, -> { select('query, COUNT(*)').group(:query).order(Arel.sql('COUNT(*) DESC')).limit(10) }
end
