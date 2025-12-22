class Upvote < ApplicationRecord
  belongs_to :user, inverse_of: :upvotes
  belongs_to :site, inverse_of: :upvotes

  validates :user_id, uniqueness: { scope: :site_id, message: "has already upvoted this web app" }

  scope :excluding_own_submissions, ->(user) { joins(:site).where.not(sites: { user_id: user.id }) }
end
