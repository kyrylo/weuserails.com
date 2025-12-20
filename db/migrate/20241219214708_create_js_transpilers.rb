class CreateJsTranspilers < ActiveRecord::Migration[8.0]
  def change
    create_table :js_transpilers do |t|
      t.string :name, null: false, index: { unique: true }

      t.timestamps
    end

    create_join_table :js_transpilers, :sites do |t|
      t.index [ :js_transpiler_id, :site_id ], unique: true
      t.index [ :site_id, :js_transpiler_id ]
    end
  end
end
