class RubyOnRailsWebsites::JsTranspilerTechStacksController < ApplicationController
  include Pageable

  allow_unauthenticated_access

  # <rails-lens:routes:begin>
  # ROUTE: /rails-web-apps/by-javascript-transpiler, name: js_transpiler_tech_stacks, via: GET
  # <rails-lens:routes:end>
  def index
    @js_transpilers =
      JsTranspiler.joins(:sites)
        .merge(Site.published)
        .group("js_transpilers.id")
        .select("js_transpilers.*, COUNT(sites.id) as site_count")
        .order("COUNT(sites.id) DESC")

    add_breadcrumb("technologies", technologies_path)
    add_breadcrumb("javascript transpilers")
  end

  # <rails-lens:routes:begin>
  # ROUTE: /rails-web-apps/by-javascript-transpiler/:id, name: js_transpiler_tech_stack, via: GET
  # <rails-lens:routes:end>
  def show
    @js_transpiler = JsTranspiler.friendly.find(params[:id])
    @base_query = @js_transpiler.sites
      .where.not(published_at: nil)
      .order(created_at: :desc)

    @results_count = @base_query.count
    set_pagination_params

    @sites = @base_query.offset((@current_page - 1) * @items_per_page).limit(@items_per_page)

    add_breadcrumb("technologies", technologies_path)
    add_breadcrumb("javascript transpilers", js_transpiler_tech_stacks_path)
    add_breadcrumb(@js_transpiler.name.downcase)
  end
end
