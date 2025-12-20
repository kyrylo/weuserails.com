class DropBookmarks < ActiveRecord::Migration[8.0]
  def change
    drop_table :bookmarks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :site, null: false, foreign_key: true

      t.timestamps
    end
  end
end
