class AddSponsoredAtToSites < ActiveRecord::Migration[8.0]
  def change
    add_column :sites, :sponsored_at, :datetime
  end
end
