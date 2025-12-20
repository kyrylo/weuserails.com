class AddSlugsToCategoryTables < ActiveRecord::Migration[8.0]
  def change
    add_column :databases, :slug, :string
    add_index :databases, :slug, unique: true

    add_column :asset_pipelines, :slug, :string
    add_index :asset_pipelines, :slug, unique: true

    add_column :background_job_libraries, :slug, :string
    add_index :background_job_libraries, :slug, unique: true

    add_column :cache_store_implementations, :slug, :string
    add_index :cache_store_implementations, :slug, unique: true

    add_column :css_frameworks, :slug, :string
    add_index :css_frameworks, :slug, unique: true

    add_column :css_processors, :slug, :string
    add_index :css_processors, :slug, unique: true

    add_column :deployment_tools, :slug, :string
    add_index :deployment_tools, :slug, unique: true

    add_column :frontend_frameworks, :slug, :string
    add_index :frontend_frameworks, :slug, unique: true

    add_column :js_bundlers, :slug, :string
    add_index :js_bundlers, :slug, unique: true

    add_column :js_transpilers, :slug, :string
    add_index :js_transpilers, :slug, unique: true

    add_column :realtime_frameworks, :slug, :string
    add_index :realtime_frameworks, :slug, unique: true

    add_column :ruby_implementations, :slug, :string
    add_index :ruby_implementations, :slug, unique: true

    add_column :template_engines, :slug, :string
    add_index :template_engines, :slug, unique: true

    add_column :testing_tools, :slug, :string
    add_index :testing_tools, :slug, unique: true
  end
end
