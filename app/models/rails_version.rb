# <rails-lens:schema:begin>
# table = "rails_versions"
# database_dialect = "SQLite"
#
# columns = [
#   { name = "id", type = "integer", pk = true, null = false },
#   { name = "version", type = "string", null = false },
#   { name = "created_at", type = "datetime", null = false },
#   { name = "updated_at", type = "datetime", null = false }
# ]
#
# indexes = [
#   { name = "index_rails_versions_on_version", columns = ["version"], unique = true }
# ]
#
# notes = ["sites:N_PLUS_ONE", "version:LIMIT"]
# <rails-lens:schema:end>


class RailsVersion < ApplicationRecord
  has_many :sites, inverse_of: :rails_version
end
