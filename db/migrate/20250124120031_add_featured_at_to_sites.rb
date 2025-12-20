class AddFeaturedAtToSites < ActiveRecord::Migration[8.0]
  def change
    add_column :sites, :featured_at, :datetime
  end
end
