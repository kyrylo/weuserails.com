# <rails-lens:schema:begin>
# table = "js_transpilers"
# database_dialect = "SQLite"
#
# columns = [
#   { name = "id", type = "integer", pk = true, null = false },
#   { name = "name", type = "string", null = false },
#   { name = "created_at", type = "datetime", null = false },
#   { name = "updated_at", type = "datetime", null = false },
#   { name = "slug", type = "string" },
#   { name = "description", type = "string" }
# ]
#
# indexes = [
#   { name = "index_js_transpilers_on_slug", columns = ["slug"], unique = true },
#   { name = "index_js_transpilers_on_name", columns = ["name"], unique = true }
# ]
#
# [callbacks]
# before_validation = [{ method = "set_slug" }]
# after_validation = [{ method = "unset_slug_if_invalid" }]
# before_save = [{ method = "set_slug" }]
#
# notes = ["slug:NOT_NULL", "description:NOT_NULL", "name:LIMIT", "slug:LIMIT", "description:LIMIT"]
# <rails-lens:schema:end>


class JsTranspiler < ApplicationRecord
  has_and_belongs_to_many :sites

  extend FriendlyId
  friendly_id :name, use: :slugged
end
