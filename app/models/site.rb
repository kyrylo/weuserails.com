# <rails-lens:schema:begin>
# table = "sites"
# database_dialect = "SQLite"
#
# columns = [
#   { name = "id", type = "integer", pk = true, null = false },
#   { name = "title", type = "string" },
#   { name = "url", type = "string" },
#   { name = "description", type = "text" },
#   { name = "created_at", type = "datetime", null = false },
#   { name = "updated_at", type = "datetime", null = false },
#   { name = "tagline", type = "string", null = false },
#   { name = "open_source", type = "boolean", null = false },
#   { name = "repo_url", type = "string" },
#   { name = "nsfw", type = "boolean", null = false },
#   { name = "year_launched", type = "integer", null = false },
#   { name = "rails_version_id", type = "integer" },
#   { name = "user_id", type = "integer", null = false },
#   { name = "slug", type = "string" },
#   { name = "published_at", type = "datetime" },
#   { name = "featured_at", type = "datetime" },
#   { name = "sponsored_at", type = "datetime" }
# ]
#
# indexes = [
#   { name = "index_sites_on_user_id", columns = ["user_id"] },
#   { name = "index_sites_on_slug", columns = ["slug"], unique = true },
#   { name = "index_sites_on_rails_version_id", columns = ["rails_version_id"] }
# ]
#
# foreign_keys = [
#   { column = "user_id", references_table = "users", references_column = "id" },
#   { column = "rails_version_id", references_table = "rails_versions", references_column = "id" }
# ]
#
# [polymorphic]
# targets = [{ name = "logo_attachment", as = "record" }, { name = "featured_image_attachment", as = "record" }]
#
# [callbacks]
# before_validation = [{ method = "set_slug" }]
# after_validation = [{ method = "unset_slug_if_invalid" }]
# before_save = [{ method = "set_slug" }]
# after_save = [{ method = "proc" }]
# after_update = [{ method = "create_site_fts" }]
# after_commit = [{ method = "proc" }]
#
# notes = ["upvotes:N_PLUS_ONE", "upvoting_users:N_PLUS_ONE", "rails_version:COUNTER_CACHE", "user:COUNTER_CACHE", "title:NOT_NULL", "url:NOT_NULL", "description:NOT_NULL", "repo_url:NOT_NULL", "slug:NOT_NULL", "title:LIMIT", "url:LIMIT", "tagline:LIMIT", "repo_url:LIMIT", "slug:LIMIT", "description:STORAGE"]
# <rails-lens:schema:end>


class Site < ApplicationRecord
  has_one :site_fts, foreign_key: "rowid", inverse_of: :site

  has_and_belongs_to_many :categories
  has_and_belongs_to_many :databases
  has_and_belongs_to_many :background_job_libraries
  has_and_belongs_to_many :testing_tools
  has_and_belongs_to_many :frontend_frameworks
  has_and_belongs_to_many :ruby_implementations
  has_and_belongs_to_many :deployment_tools
  has_and_belongs_to_many :realtime_frameworks
  has_and_belongs_to_many :cache_store_implementations
  has_and_belongs_to_many :template_engines
  has_and_belongs_to_many :asset_pipelines
  has_and_belongs_to_many :css_frameworks
  has_and_belongs_to_many :css_processors
  has_and_belongs_to_many :js_transpilers
  has_and_belongs_to_many :js_bundlers

  has_many :upvotes, dependent: :destroy, inverse_of: :site
  has_many :upvoting_users, through: :upvotes, source: :user

  belongs_to :rails_version, optional: true, inverse_of: :sites

  belongs_to :user, inverse_of: :sites

  extend FriendlyId
  friendly_id :title, use: :slugged

  has_one_attached :logo do |attachable|
    attachable.variant :thumb_mini,
      resize_to_fill: [ 32, 32 ],
      preprocessed: true,
      saver: {
        strip: true,
        quality: 80
      }
    attachable.variant :thumb,
      resize_to_fill: [ 64, 64 ],
      preprocessed: true,
      saver: {
        strip: true,
        quality: 80
      }
    attachable.variant :thumb_retina,
      resize_to_fill: [ 128, 128 ],
      preprocessed: true,
      saver: {
        strip: true,
        quality: 80
      }
  end

  has_one_attached :featured_image do |attachable|
    attachable.variant :regular,
      resize_to_limit: [ 896, nil ],
      preprocessed: true,
      saver: {
        strip: true,
        quality: 80
      }
    attachable.variant :retina,
      resize_to_limit: [ 1792, nil ],
      preprocessed: true,
      saver: {
        strip: true,
        quality: 80
    }
  end

  validates :title, presence: true, length: { minimum: 2, maximum: 80 }
  validates :url, presence: true, uniqueness: true, format: {
    with: URI::DEFAULT_PARSER.make_regexp
  }
  validates :description, presence: true, length: { minimum: 160 }
  validates :tagline, presence: true, length: { minimum: 10, maximum: 120 }
  validates :year_launched, presence: true,
    inclusion: 2004..Time.current.year,
    numericality: {
      only_integer: true
    }
  validates :open_source, inclusion: { in: [ true, false ] }
  validates :nsfw, inclusion: { in: [ true, false ] }

  validate :categories_count_within_limit, on: :create

  validates :user, presence: true

  after_update :create_site_fts

  normalizes :tagline, with: ->(tagline) { tagline.chomp(".") }

  scope :featured, -> { where.not(featured_at: nil) }
  scope :unfeatured, -> { where(featured_at: nil) }
  scope :published, -> { where.not(published_at: nil) }
  scope :unpublished, -> { where(published_at: nil) }

  def self.full_text_search(query)
    return none if query.blank?

    # Remove or escape SQLite FTS5 special characters, including dots
    cleaned_query = query.gsub(/[";:*+?()\[\]{}.]/, " ").strip.squeeze(" ")
    return none if cleaned_query.blank?

    # Split query into tokens and wrap each in quotes for exact matching
    tokens = cleaned_query.split.map { |token| %Q("#{token}") }.join(" ")

    sanitized_query = ActiveRecord::Base.sanitize_sql_array([ "site_fts MATCH ?", tokens ])
    where(sanitized_query)
      .joins(:site_fts)
      .order("bm25(site_fts)")
      .distinct
  end

  private

  def categories_count_within_limit
    if categories.size < 1
      errors.add(:categories, "must have at least 1 category")
    elsif categories.size > 5
      errors.add(:categories, "must have at most 5 categories")
    end
  end

  def create_site_fts
    return if site_fts

    sql = ActiveRecord::Base.sanitize_sql_array(
      [
        "INSERT INTO site_fts (rowid, title, url, tagline, description) VALUES (?, ?, ?, ?, ?)",
        id, title, url, tagline, description
      ]
    )
    ActiveRecord::Base.connection.execute(sql)
  end
end
