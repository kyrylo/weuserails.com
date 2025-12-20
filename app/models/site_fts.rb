class SiteFts < ApplicationRecord
  self.primary_key = "rowid"

  belongs_to :site, foreign_key: "rowid"
end
