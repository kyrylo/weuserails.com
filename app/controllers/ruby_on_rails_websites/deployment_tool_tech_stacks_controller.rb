class RubyOnRailsWebsites::DeploymentToolTechStacksController < ApplicationController
  include Pageable

  allow_unauthenticated_access

  def index
    @deployment_tools =
      DeploymentTool.joins(:sites)
        .merge(Site.published)
        .group("deployment_tools.id")
        .select("deployment_tools.*, COUNT(sites.id) as site_count")
        .order("COUNT(sites.id) DESC")

    add_breadcrumb("technologies", technologies_path)
    add_breadcrumb("deployment tools")
  end

  def show
    @deployment_tool = DeploymentTool.friendly.find(params[:id])
    @base_query = @deployment_tool.sites
      .where.not(published_at: nil)
      .order(created_at: :desc)

    @results_count = @base_query.count
    set_pagination_params

    @sites = @base_query.offset((@current_page - 1) * @items_per_page).limit(@items_per_page)

    add_breadcrumb("technologies", technologies_path)
    add_breadcrumb("deployment tools", deployment_tool_tech_stacks_path)
    add_breadcrumb(@deployment_tool.name.downcase)
  end
end
