class RailsVersion < ApplicationRecord
  has_many :sites, inverse_of: :rails_version
end
