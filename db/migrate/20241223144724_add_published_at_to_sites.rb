class AddPublishedAtToSites < ActiveRecord::Migration[8.0]
  def change
    add_column :sites, :published_at, :datetime
  end
end
