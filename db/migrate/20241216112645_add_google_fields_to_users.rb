class AddGoogleFieldsToUsers < ActiveRecord::Migration[8.0]
  def change
    change_table :users do |t|
      t.string :nickname
      t.string :full_name
      t.string :google_id
      t.text :avatar_url
      t.string :locale, null: false, default: "en"

      t.boolean :verified, null: false, default: false

      t.text :data, null: false, default: "{}"
    end

    add_index :users, :nickname, unique: true
    add_index :users, :google_id, unique: true
  end
end
