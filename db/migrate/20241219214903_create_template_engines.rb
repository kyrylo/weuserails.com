class CreateTemplateEngines < ActiveRecord::Migration[8.0]
  def change
    create_table :template_engines do |t|
      t.string :name, null: false, index: { unique: true }

      t.timestamps
    end

    create_join_table :template_engines, :sites do |t|
      t.index [ :template_engine_id, :site_id ], unique: true
      t.index [ :site_id, :template_engine_id ]
    end
  end
end
