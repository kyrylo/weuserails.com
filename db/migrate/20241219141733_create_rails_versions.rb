class CreateRailsVersions < ActiveRecord::Migration[8.0]
  def change
    create_table :rails_versions do |t|
      t.string :version, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
