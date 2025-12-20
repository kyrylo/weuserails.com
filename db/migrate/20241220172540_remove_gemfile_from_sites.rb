class RemoveGemfileFromSites < ActiveRecord::Migration[8.0]
  def change
    remove_column :sites, :gemfile, :text
  end
end
