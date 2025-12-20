class AddDescriptionToDatabases < ActiveRecord::Migration[8.0]
  def change
    add_column :databases, :description, :string
  end
end
