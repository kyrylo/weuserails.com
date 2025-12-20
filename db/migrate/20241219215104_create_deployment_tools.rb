class CreateDeploymentTools < ActiveRecord::Migration[8.0]
  def change
    create_table :deployment_tools do |t|
      t.string :name, null: false, index: { unique: true }

      t.timestamps
    end

    create_join_table :deployment_tools, :sites do |t|
      t.index [ :deployment_tool_id, :site_id ], unique: true
      t.index [ :site_id, :deployment_tool_id ]
    end
  end
end
