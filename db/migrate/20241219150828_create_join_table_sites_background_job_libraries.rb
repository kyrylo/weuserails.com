class CreateJoinTableSitesBackgroundJobLibraries < ActiveRecord::Migration[8.0]
  def change
    create_join_table :sites, :background_job_libraries do |t|
      t.index [ :site_id, :background_job_library_id ], unique: true
      t.index [ :background_job_library_id, :site_id ]
    end
  end
end
