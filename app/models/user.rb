class User < ApplicationRecord
  has_many :searches

  validates :ip_address, presence: true, uniqueness: true
end
