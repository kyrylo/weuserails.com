class CreateJoinTableSitesDatabases < ActiveRecord::Migration[8.0]
  def change
    create_join_table :sites, :databases do |t|
      t.index [ :site_id, :database_id ], unique: true
      t.index [ :database_id, :site_id ]
    end
  end
end
