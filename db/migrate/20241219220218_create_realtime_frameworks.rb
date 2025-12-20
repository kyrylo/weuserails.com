class CreateRealtimeFrameworks < ActiveRecord::Migration[8.0]
  def change
    create_table :realtime_frameworks do |t|
      t.string :name, null: false, index: { unique: true }

      t.timestamps
    end

    create_join_table :realtime_frameworks, :sites do |t|
      t.index [ :realtime_framework_id, :site_id ], unique: true
      t.index [ :site_id, :realtime_framework_id ]
    end
  end
end
