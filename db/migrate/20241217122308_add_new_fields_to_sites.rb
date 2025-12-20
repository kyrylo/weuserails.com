class AddNewFieldsToSites < ActiveRecord::Migration[8.0]
  def change
    change_table :sites do |t|
      t.string :logo_url, null: false
      t.string :featured_image_url, null: false
      t.string :tagline, null: false
      t.text :gemfile

      t.boolean :open_source, null: false, default: false
      t.string :repo_url

      t.boolean :nsfw, null: false, default: false
      t.integer :year_launched, null: false
    end
  end
end
