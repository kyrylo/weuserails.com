class WebAppsController < ApplicationController
  include Pageable

  allow_unauthenticated_access

  def index
    @base_query = Site
      .includes(:categories)
      .includes(:upvotes)
      .where.not(published_at: nil)
      .order(created_at: :desc)

    @results_count = @base_query.count
    set_pagination_params

    @sites = @base_query.offset((@current_page - 1) * @items_per_page).limit(@items_per_page)
  end

  def show
    @site =
      Site.friendly
        .includes(:databases)
        .includes(:background_job_libraries)
        .includes(:cache_store_implementations)
        .includes(:css_frameworks)
        .includes(:css_processors)
        .includes(:deployment_tools)
        .includes(:frontend_frameworks)
        .includes(:js_bundlers)
        .includes(:js_transpilers)
        .includes(:realtime_frameworks)
        .includes(:ruby_implementations)
        .includes(:template_engines)
        .includes(:testing_tools)
        .includes(:categories)
        .includes(:upvotes)
        .where.not(published_at: nil)
        .find(params.expect(:id))

    ordered_sites = Site.where.not(published_at: nil).order(created_at: :desc)
    @prev_site = ordered_sites.where("created_at < ?", @site.created_at).first
    @next_site = ordered_sites.where("created_at > ?", @site.created_at).last

    @similar_sites =
      Site.where.not(id: @site.id)
        .where.not(published_at: nil)
        .joins(:categories)
        .where(categories: { id: @site.categories.pluck(:id) })
        .distinct
        .limit(4)
  end
end
