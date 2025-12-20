class RubyOnRailsWebsites::JsBundlerTechStacksController < ApplicationController
  include Pageable

  allow_unauthenticated_access

  def index
    @js_bundlers =
      JsBundler.joins(:sites)
        .merge(Site.published)
        .group("js_bundlers.id")
        .select("js_bundlers.*, COUNT(sites.id) as site_count")
        .order("COUNT(sites.id) DESC")

    add_breadcrumb("technologies", technologies_path)
    add_breadcrumb("javascript bundlers")
  end

  def show
    @js_bundler = JsBundler.friendly.find(params[:id])
    @base_query = @js_bundler.sites
      .where.not(published_at: nil)
      .order(created_at: :desc)

    @results_count = @base_query.count
    set_pagination_params

    @sites = @base_query.offset((@current_page - 1) * @items_per_page).limit(@items_per_page)

    add_breadcrumb("technologies", technologies_path)
    add_breadcrumb("javascript bundlers", js_bundler_tech_stacks_path)
    add_breadcrumb(@js_bundler.name.downcase)
  end
end
