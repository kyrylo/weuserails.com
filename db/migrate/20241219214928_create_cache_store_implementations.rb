class CreateCacheStoreImplementations < ActiveRecord::Migration[8.0]
  def change
    create_table :cache_store_implementations do |t|
      t.string :name, null: false, index: { unique: true }

      t.timestamps
    end

    create_join_table :cache_store_implementations, :sites do |t|
      t.index [ :cache_store_implementation_id, :site_id ], unique: true
      t.index [ :site_id, :cache_store_implementation_id ]
    end
  end
end
