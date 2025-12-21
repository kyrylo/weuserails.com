# <rails-lens:schema:begin>
# table = "sessions"
# database_dialect = "SQLite"
#
# columns = [
#   { name = "id", type = "integer", pk = true, null = false },
#   { name = "user_id", type = "integer", null = false },
#   { name = "ip_address", type = "string" },
#   { name = "user_agent", type = "string" },
#   { name = "created_at", type = "datetime", null = false },
#   { name = "updated_at", type = "datetime", null = false }
# ]
#
# indexes = [
#   { name = "index_sessions_on_user_id", columns = ["user_id"] }
# ]
#
# foreign_keys = [
#   { column = "user_id", references_table = "users", references_column = "id" }
# ]
#
# notes = ["user:COUNTER_CACHE", "ip_address:NOT_NULL", "user_agent:NOT_NULL", "ip_address:LIMIT", "user_agent:LIMIT"]
# <rails-lens:schema:end>


class Session < ApplicationRecord
  belongs_to :user, inverse_of: :sessions
end
