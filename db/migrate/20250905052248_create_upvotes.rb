class CreateUpvotes < ActiveRecord::Migration[8.0]
  def change
    create_table :upvotes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :site, null: false, foreign_key: true

      t.timestamps
    end

    add_index :upvotes, [ :user_id, :site_id ], unique: true

    reversible do |dir|
      dir.up do
        execute <<-SQL
          INSERT INTO upvotes (user_id, site_id, created_at, updated_at)
          SELECT user_id, site_id, created_at, updated_at
          FROM bookmarks
        SQL
      end
    end
  end
end
