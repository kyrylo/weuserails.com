class CreateJsBundlers < ActiveRecord::Migration[8.0]
  def change
    create_table :js_bundlers do |t|
      t.string :name, null: false, index: { unique: true }

      t.timestamps
    end

    create_join_table :js_bundlers, :sites do |t|
      t.index [ :js_bundler_id, :site_id ], unique: true
      t.index [ :site_id, :js_bundler_id ]
    end
  end
end
