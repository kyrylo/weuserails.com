class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  has_many :sites, dependent: :destroy

  has_many :upvotes, dependent: :destroy
  has_many :upvoted_sites, through: :upvotes, source: :site

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  validates :email_address, presence: true, uniqueness: true
end
