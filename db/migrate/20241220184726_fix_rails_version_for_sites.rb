class FixRailsVersionForSites < ActiveRecord::Migration[8.0]
  def change
    remove_column :sites, :rails_version, :string

    add_reference :sites, :rails_version, foreign_key: true
  end
end
