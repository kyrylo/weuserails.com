# <rails-lens:schema:begin>
# table = "upvotes"
# database_dialect = "SQLite"
#
# columns = [
#   { name = "id", type = "integer", pk = true, null = false },
#   { name = "user_id", type = "integer", null = false },
#   { name = "site_id", type = "integer", null = false },
#   { name = "created_at", type = "datetime", null = false },
#   { name = "updated_at", type = "datetime", null = false }
# ]
#
# indexes = [
#   { name = "index_upvotes_on_user_id", columns = ["user_id"] },
#   { name = "index_upvotes_on_user_id_and_site_id", columns = ["user_id", "site_id"], unique = true },
#   { name = "index_upvotes_on_site_id", columns = ["site_id"] }
# ]
#
# foreign_keys = [
#   { column = "user_id", references_table = "users", references_column = "id" },
#   { column = "site_id", references_table = "sites", references_column = "id" }
# ]
#
# notes = ["user:COUNTER_CACHE", "site:COUNTER_CACHE"]
# <rails-lens:schema:end>


class Upvote < ApplicationRecord
  belongs_to :user, inverse_of: :upvotes
  belongs_to :site, inverse_of: :upvotes

  validates :user_id, uniqueness: { scope: :site_id, message: "has already upvoted this web app" }

  scope :excluding_own_submissions, ->(user) { joins(:site).where.not(sites: { user_id: user.id }) }
end
