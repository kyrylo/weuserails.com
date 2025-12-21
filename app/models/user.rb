# <rails-lens:schema:begin>
# table = "users"
# database_dialect = "SQLite"
#
# columns = [
#   { name = "id", type = "integer", pk = true, null = false },
#   { name = "email_address", type = "string", null = false },
#   { name = "password_digest", type = "string", null = false },
#   { name = "created_at", type = "datetime", null = false },
#   { name = "updated_at", type = "datetime", null = false },
#   { name = "nickname", type = "string" },
#   { name = "full_name", type = "string" },
#   { name = "google_id", type = "string" },
#   { name = "avatar_url", type = "text" },
#   { name = "locale", type = "string", null = false, default = "en" },
#   { name = "verified", type = "boolean", null = false },
#   { name = "data", type = "text", null = false, default = "{}" }
# ]
#
# indexes = [
#   { name = "index_users_on_nickname", columns = ["nickname"], unique = true },
#   { name = "index_users_on_google_id", columns = ["google_id"], unique = true },
#   { name = "index_users_on_email_address", columns = ["email_address"], unique = true }
# ]
#
# notes = ["sessions:N_PLUS_ONE", "sites:N_PLUS_ONE", "upvotes:N_PLUS_ONE", "upvoted_sites:N_PLUS_ONE", "nickname:NOT_NULL", "full_name:NOT_NULL", "avatar_url:NOT_NULL", "email_address:LIMIT", "password_digest:LIMIT", "nickname:LIMIT", "full_name:LIMIT", "google_id:LIMIT", "locale:LIMIT", "avatar_url:STORAGE", "data:STORAGE"]
# <rails-lens:schema:end>


class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy, inverse_of: :user

  has_many :sites, dependent: :destroy, inverse_of: :user

  has_many :upvotes, dependent: :destroy, inverse_of: :user
  has_many :upvoted_sites, through: :upvotes, source: :site

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  validates :email_address, presence: true, uniqueness: true
end
