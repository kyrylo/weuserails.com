class RubyOnRailsWebsites::RealtimeFrameworkTechStacksController < ApplicationController
  include Pageable

  allow_unauthenticated_access

  # <rails-lens:routes:begin>
  # ROUTE: /rails-web-apps/by-realtime-framework, name: realtime_framework_tech_stacks, via: GET
  # <rails-lens:routes:end>
  def index
    @realtime_frameworks =
      RealtimeFramework.joins(:sites)
        .merge(Site.published)
        .group("realtime_frameworks.id")
        .select("realtime_frameworks.*, COUNT(sites.id) as site_count")
        .order("COUNT(sites.id) DESC")

    add_breadcrumb("technologies", technologies_path)
    add_breadcrumb("realtime frameworks")
  end

  # <rails-lens:routes:begin>
  # ROUTE: /rails-web-apps/by-realtime-framework/:id, name: realtime_framework_tech_stack, via: GET
  # <rails-lens:routes:end>
  def show
    @realtime_framework = RealtimeFramework.friendly.find(params[:id])
    @base_query = @realtime_framework.sites
      .where.not(published_at: nil)
      .order(created_at: :desc)

    @results_count = @base_query.count
    set_pagination_params

    @sites = @base_query.offset((@current_page - 1) * @items_per_page).limit(@items_per_page)

    add_breadcrumb("technologies", technologies_path)
    add_breadcrumb("realtime frameworks", realtime_framework_tech_stacks_path)
    add_breadcrumb(@realtime_framework.name.downcase)
  end
end
