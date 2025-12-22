class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy, inverse_of: :user

  has_many :sites, dependent: :destroy, inverse_of: :user

  has_many :upvotes, dependent: :destroy, inverse_of: :user
  has_many :upvoted_sites, through: :upvotes, source: :site

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  validates :email_address, presence: true, uniqueness: true
end
