class CreateJoinTableSitesCategories < ActiveRecord::Migration[8.0]
  def change
    create_join_table :sites, :categories do |t|
      t.index [ :site_id, :category_id ], unique: true
      t.index [ :category_id, :site_id ]
    end
  end
end
