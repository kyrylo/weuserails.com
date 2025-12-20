class CreateTestingTools < ActiveRecord::Migration[8.0]
  def change
    create_table :testing_tools do |t|
      t.string :name, null: false, index: { unique: true }

      t.timestamps
    end

    create_join_table :testing_tools, :sites do |t|
      t.index [ :testing_tool_id, :site_id ], unique: true
      t.index [ :site_id, :testing_tool_id ]
    end
  end
end
