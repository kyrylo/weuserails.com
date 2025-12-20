class CreateAssetPipelines < ActiveRecord::Migration[8.0]
  def change
    create_table :asset_pipelines do |t|
      t.string :name, null: false, index: { unique: true }

      t.timestamps
    end

    create_join_table :asset_pipelines, :sites do |t|
      t.index [ :asset_pipeline_id, :site_id ], unique: true
      t.index [ :site_id, :asset_pipeline_id ]
    end
  end
end
