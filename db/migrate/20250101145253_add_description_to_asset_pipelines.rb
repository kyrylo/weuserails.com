class AddDescriptionToAssetPipelines < ActiveRecord::Migration[8.0]
  def change
    add_column :asset_pipelines, :description, :string
  end
end
