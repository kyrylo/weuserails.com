class CreateVirtualSiteFts < ActiveRecord::Migration[8.0]
  def change
    create_virtual_table :site_fts, :fts5, [ "title", "url", "tagline", "description" ]
  end
end
