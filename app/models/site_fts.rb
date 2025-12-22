class SiteFts < ApplicationRecord
  self.primary_key = "rowid"

  belongs_to :site, foreign_key: "rowid", inverse_of: :site_fts
end
