class CreateFrontendFrameworks < ActiveRecord::Migration[8.0]
  def change
    create_table :frontend_frameworks do |t|
      t.string :name, null: false, index: { unique: true }

      t.timestamps
    end

    create_join_table :frontend_frameworks, :sites do |t|
      t.index [ :frontend_framework_id, :site_id ], unique: true
      t.index [ :site_id, :frontend_framework_id ]
    end
  end
end
