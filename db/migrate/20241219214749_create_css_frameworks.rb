class CreateCssFrameworks < ActiveRecord::Migration[8.0]
  def change
    create_table :css_frameworks do |t|
      t.string :name, null: false, index: { unique: true }

      t.timestamps
    end

    create_join_table :css_frameworks, :sites do |t|
      t.index [ :css_framework_id, :site_id ], unique: true
      t.index [ :site_id, :css_framework_id ]
    end
  end
end
