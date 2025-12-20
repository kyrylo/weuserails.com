# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_09_07_105644) do
  create_table "_litestream_lock", id: false, force: :cascade do |t|
    t.integer "id"
  end

  create_table "_litestream_seq", force: :cascade do |t|
    t.integer "seq"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "asset_pipelines", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "description"
    t.index ["name"], name: "index_asset_pipelines_on_name", unique: true
    t.index ["slug"], name: "index_asset_pipelines_on_slug", unique: true
  end

  create_table "asset_pipelines_sites", id: false, force: :cascade do |t|
    t.integer "asset_pipeline_id", null: false
    t.integer "site_id", null: false
    t.index ["asset_pipeline_id", "site_id"], name: "index_asset_pipelines_sites_on_asset_pipeline_id_and_site_id", unique: true
    t.index ["site_id", "asset_pipeline_id"], name: "index_asset_pipelines_sites_on_site_id_and_asset_pipeline_id"
  end

  create_table "background_job_libraries", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "description"
    t.index ["name"], name: "index_background_job_libraries_on_name", unique: true
    t.index ["slug"], name: "index_background_job_libraries_on_slug", unique: true
  end

  create_table "background_job_libraries_sites", id: false, force: :cascade do |t|
    t.integer "site_id", null: false
    t.integer "background_job_library_id", null: false
    t.index ["background_job_library_id", "site_id"], name: "idx_on_background_job_library_id_site_id_55bda73459"
    t.index ["site_id", "background_job_library_id"], name: "idx_on_site_id_background_job_library_id_36858d187b", unique: true
  end

  create_table "cache_store_implementations", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "description"
    t.index ["name"], name: "index_cache_store_implementations_on_name", unique: true
    t.index ["slug"], name: "index_cache_store_implementations_on_slug", unique: true
  end

  create_table "cache_store_implementations_sites", id: false, force: :cascade do |t|
    t.integer "cache_store_implementation_id", null: false
    t.integer "site_id", null: false
    t.index ["cache_store_implementation_id", "site_id"], name: "idx_on_cache_store_implementation_id_site_id_808029ad17", unique: true
    t.index ["site_id", "cache_store_implementation_id"], name: "idx_on_site_id_cache_store_implementation_id_d8b795ec6f"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["name"], name: "index_categories_on_name", unique: true
    t.index ["slug"], name: "index_categories_on_slug", unique: true
  end

  create_table "categories_sites", id: false, force: :cascade do |t|
    t.integer "site_id", null: false
    t.integer "category_id", null: false
    t.index ["category_id", "site_id"], name: "index_categories_sites_on_category_id_and_site_id"
    t.index ["site_id", "category_id"], name: "index_categories_sites_on_site_id_and_category_id", unique: true
  end

  create_table "css_frameworks", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "description"
    t.index ["name"], name: "index_css_frameworks_on_name", unique: true
    t.index ["slug"], name: "index_css_frameworks_on_slug", unique: true
  end

  create_table "css_frameworks_sites", id: false, force: :cascade do |t|
    t.integer "css_framework_id", null: false
    t.integer "site_id", null: false
    t.index ["css_framework_id", "site_id"], name: "index_css_frameworks_sites_on_css_framework_id_and_site_id", unique: true
    t.index ["site_id", "css_framework_id"], name: "index_css_frameworks_sites_on_site_id_and_css_framework_id"
  end

  create_table "css_processors", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "description"
    t.index ["name"], name: "index_css_processors_on_name", unique: true
    t.index ["slug"], name: "index_css_processors_on_slug", unique: true
  end

  create_table "css_processors_sites", id: false, force: :cascade do |t|
    t.integer "css_processor_id", null: false
    t.integer "site_id", null: false
    t.index ["css_processor_id", "site_id"], name: "index_css_processors_sites_on_css_processor_id_and_site_id", unique: true
    t.index ["site_id", "css_processor_id"], name: "index_css_processors_sites_on_site_id_and_css_processor_id"
  end

  create_table "databases", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "description"
    t.index ["name"], name: "index_databases_on_name", unique: true
    t.index ["slug"], name: "index_databases_on_slug", unique: true
  end

  create_table "databases_sites", id: false, force: :cascade do |t|
    t.integer "site_id", null: false
    t.integer "database_id", null: false
    t.index ["database_id", "site_id"], name: "index_databases_sites_on_database_id_and_site_id"
    t.index ["site_id", "database_id"], name: "index_databases_sites_on_site_id_and_database_id", unique: true
  end

  create_table "deployment_tools", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "description"
    t.index ["name"], name: "index_deployment_tools_on_name", unique: true
    t.index ["slug"], name: "index_deployment_tools_on_slug", unique: true
  end

  create_table "deployment_tools_sites", id: false, force: :cascade do |t|
    t.integer "deployment_tool_id", null: false
    t.integer "site_id", null: false
    t.index ["deployment_tool_id", "site_id"], name: "index_deployment_tools_sites_on_deployment_tool_id_and_site_id", unique: true
    t.index ["site_id", "deployment_tool_id"], name: "index_deployment_tools_sites_on_site_id_and_deployment_tool_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "frontend_frameworks", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "description"
    t.index ["name"], name: "index_frontend_frameworks_on_name", unique: true
    t.index ["slug"], name: "index_frontend_frameworks_on_slug", unique: true
  end

  create_table "frontend_frameworks_sites", id: false, force: :cascade do |t|
    t.integer "frontend_framework_id", null: false
    t.integer "site_id", null: false
    t.index ["frontend_framework_id", "site_id"], name: "idx_on_frontend_framework_id_site_id_ee59305de3", unique: true
    t.index ["site_id", "frontend_framework_id"], name: "idx_on_site_id_frontend_framework_id_318e8e3c1e"
  end

  create_table "js_bundlers", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "description"
    t.index ["name"], name: "index_js_bundlers_on_name", unique: true
    t.index ["slug"], name: "index_js_bundlers_on_slug", unique: true
  end

  create_table "js_bundlers_sites", id: false, force: :cascade do |t|
    t.integer "js_bundler_id", null: false
    t.integer "site_id", null: false
    t.index ["js_bundler_id", "site_id"], name: "index_js_bundlers_sites_on_js_bundler_id_and_site_id", unique: true
    t.index ["site_id", "js_bundler_id"], name: "index_js_bundlers_sites_on_site_id_and_js_bundler_id"
  end

  create_table "js_transpilers", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "description"
    t.index ["name"], name: "index_js_transpilers_on_name", unique: true
    t.index ["slug"], name: "index_js_transpilers_on_slug", unique: true
  end

  create_table "js_transpilers_sites", id: false, force: :cascade do |t|
    t.integer "js_transpiler_id", null: false
    t.integer "site_id", null: false
    t.index ["js_transpiler_id", "site_id"], name: "index_js_transpilers_sites_on_js_transpiler_id_and_site_id", unique: true
    t.index ["site_id", "js_transpiler_id"], name: "index_js_transpilers_sites_on_site_id_and_js_transpiler_id"
  end

  create_table "rails_versions", force: :cascade do |t|
    t.string "version", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["version"], name: "index_rails_versions_on_version", unique: true
  end

  create_table "realtime_frameworks", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "description"
    t.index ["name"], name: "index_realtime_frameworks_on_name", unique: true
    t.index ["slug"], name: "index_realtime_frameworks_on_slug", unique: true
  end

  create_table "realtime_frameworks_sites", id: false, force: :cascade do |t|
    t.integer "realtime_framework_id", null: false
    t.integer "site_id", null: false
    t.index ["realtime_framework_id", "site_id"], name: "idx_on_realtime_framework_id_site_id_5b28f40c31", unique: true
    t.index ["site_id", "realtime_framework_id"], name: "idx_on_site_id_realtime_framework_id_b294dd0b8a"
  end

  create_table "ruby_implementations", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "description"
    t.index ["name"], name: "index_ruby_implementations_on_name", unique: true
    t.index ["slug"], name: "index_ruby_implementations_on_slug", unique: true
  end

  create_table "ruby_implementations_sites", id: false, force: :cascade do |t|
    t.integer "ruby_implementation_id", null: false
    t.integer "site_id", null: false
    t.index ["ruby_implementation_id", "site_id"], name: "idx_on_ruby_implementation_id_site_id_7ead08db2d", unique: true
    t.index ["site_id", "ruby_implementation_id"], name: "idx_on_site_id_ruby_implementation_id_4def2d6da5"
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "sites", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tagline", null: false
    t.boolean "open_source", default: false, null: false
    t.string "repo_url"
    t.boolean "nsfw", default: false, null: false
    t.integer "year_launched", null: false
    t.integer "rails_version_id"
    t.integer "user_id", null: false
    t.string "slug"
    t.datetime "published_at"
    t.datetime "featured_at"
    t.datetime "sponsored_at"
    t.index ["rails_version_id"], name: "index_sites_on_rails_version_id"
    t.index ["slug"], name: "index_sites_on_slug", unique: true
    t.index ["user_id"], name: "index_sites_on_user_id"
  end

  create_table "sites_template_engines", id: false, force: :cascade do |t|
    t.integer "template_engine_id", null: false
    t.integer "site_id", null: false
    t.index ["site_id", "template_engine_id"], name: "index_sites_template_engines_on_site_id_and_template_engine_id"
    t.index ["template_engine_id", "site_id"], name: "index_sites_template_engines_on_template_engine_id_and_site_id", unique: true
  end

  create_table "sites_testing_tools", id: false, force: :cascade do |t|
    t.integer "testing_tool_id", null: false
    t.integer "site_id", null: false
    t.index ["site_id", "testing_tool_id"], name: "index_sites_testing_tools_on_site_id_and_testing_tool_id"
    t.index ["testing_tool_id", "site_id"], name: "index_sites_testing_tools_on_testing_tool_id_and_site_id", unique: true
  end

  create_table "template_engines", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "description"
    t.index ["name"], name: "index_template_engines_on_name", unique: true
    t.index ["slug"], name: "index_template_engines_on_slug", unique: true
  end

  create_table "testing_tools", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "description"
    t.index ["name"], name: "index_testing_tools_on_name", unique: true
    t.index ["slug"], name: "index_testing_tools_on_slug", unique: true
  end

  create_table "upvotes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "site_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["site_id"], name: "index_upvotes_on_site_id"
    t.index ["user_id", "site_id"], name: "index_upvotes_on_user_id_and_site_id", unique: true
    t.index ["user_id"], name: "index_upvotes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname"
    t.string "full_name"
    t.string "google_id"
    t.text "avatar_url"
    t.string "locale", default: "en", null: false
    t.boolean "verified", default: false, null: false
    t.text "data", default: "{}", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
    t.index ["google_id"], name: "index_users_on_google_id", unique: true
    t.index ["nickname"], name: "index_users_on_nickname", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "sessions", "users"
  add_foreign_key "sites", "rails_versions"
  add_foreign_key "sites", "users"
  add_foreign_key "upvotes", "sites"
  add_foreign_key "upvotes", "users"

  # Virtual tables defined in this database.
  # Note that virtual tables may not work with other database engines. Be careful if changing database.
  create_virtual_table "site_fts", "fts5", ["title", "url", "tagline", "description"]
end
