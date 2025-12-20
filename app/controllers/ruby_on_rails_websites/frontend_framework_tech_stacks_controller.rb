class RubyOnRailsWebsites::FrontendFrameworkTechStacksController < ApplicationController
  include Pageable

  allow_unauthenticated_access

  def index
    @frontend_frameworks =
      FrontendFramework.joins(:sites)
        .merge(Site.published)
        .group("frontend_frameworks.id")
        .select("frontend_frameworks.*, COUNT(sites.id) as site_count")
        .order("COUNT(sites.id) DESC")

    add_breadcrumb("technologies", technologies_path)
    add_breadcrumb("frontend frameworks")
  end

  def show
    @frontend_framework = FrontendFramework.friendly.find(params[:id])
    @base_query = @frontend_framework.sites
      .where.not(published_at: nil)
      .order(created_at: :desc)

    @results_count = @base_query.count
    set_pagination_params

    @sites = @base_query.offset((@current_page - 1) * @items_per_page).limit(@items_per_page)

    add_breadcrumb("technologies", technologies_path)
    add_breadcrumb("frontend frameworks", frontend_framework_tech_stacks_path)
    add_breadcrumb(@frontend_framework.name.downcase)
  end
end
