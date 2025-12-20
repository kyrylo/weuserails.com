class AddDescriptionToTechStackTables < ActiveRecord::Migration[8.0]
  def change
    add_column :background_job_libraries, :description, :string
    add_column :cache_store_implementations, :description, :string
    add_column :css_frameworks, :description, :string
    add_column :css_processors, :description, :string
    add_column :deployment_tools, :description, :string
    add_column :frontend_frameworks, :description, :string
    add_column :js_bundlers, :description, :string
    add_column :js_transpilers, :description, :string
    add_column :realtime_frameworks, :description, :string
    add_column :ruby_implementations, :description, :string
    add_column :template_engines, :description, :string
    add_column :testing_tools, :description, :string
  end
end
