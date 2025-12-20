class CreateCssProcessors < ActiveRecord::Migration[8.0]
  def change
    create_table :css_processors do |t|
      t.string :name, null: false, index: { unique: true }

      t.timestamps
    end

    create_join_table :css_processors, :sites do |t|
      t.index [ :css_processor_id, :site_id ], unique: true
      t.index [ :site_id, :css_processor_id ]
    end
  end
end
