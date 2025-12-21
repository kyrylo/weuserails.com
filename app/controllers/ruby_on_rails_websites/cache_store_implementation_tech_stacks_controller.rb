class RubyOnRailsWebsites::CacheStoreImplementationTechStacksController < ApplicationController
  include Pageable

  allow_unauthenticated_access

  # <rails-lens:routes:begin>
  # ROUTE: /rails-web-apps/by-cache-store-implementation, name: cache_store_implementation_tech_stacks, via: GET
  # <rails-lens:routes:end>
  def index
    @cache_store_implementations =
      CacheStoreImplementation.joins(:sites)
        .merge(Site.published)
        .group("cache_store_implementations.id")
        .select("cache_store_implementations.*, COUNT(sites.id) as site_count")
        .order("COUNT(sites.id) DESC")

    add_breadcrumb("technologies", technologies_path)
    add_breadcrumb("cache store implementations")
  end

  # <rails-lens:routes:begin>
  # ROUTE: /rails-web-apps/by-cache-store-implementation/:id, name: cache_store_implementation_tech_stack, via: GET
  # <rails-lens:routes:end>
  def show
    @cache_store_implementation = CacheStoreImplementation.friendly.find(params[:id])
    @base_query = @cache_store_implementation.sites
      .where.not(published_at: nil)
      .order(created_at: :desc)

    @results_count = @base_query.count
    set_pagination_params

    @sites = @base_query.offset((@current_page - 1) * @items_per_page).limit(@items_per_page)

    add_breadcrumb("technologies", technologies_path)
    add_breadcrumb("cache store implementations", cache_store_implementation_tech_stacks_path)
    add_breadcrumb(@cache_store_implementation.name.downcase)
  end
end
