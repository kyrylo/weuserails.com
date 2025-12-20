class Upvote < ApplicationRecord
  belongs_to :user
  belongs_to :site

  validates :user_id, uniqueness: { scope: :site_id, message: "has already upvoted this web app" }

  scope :excluding_own_submissions, ->(user) { joins(:site).where.not(sites: { user_id: user.id }) }
end
