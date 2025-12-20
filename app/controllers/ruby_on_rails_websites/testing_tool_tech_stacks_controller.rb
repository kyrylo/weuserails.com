class RubyOnRailsWebsites::TestingToolTechStacksController < ApplicationController
  include Pageable

  allow_unauthenticated_access

  def index
    @testing_tools =
      TestingTool
        .joins(:sites)
        .merge(Site.published)
        .group("testing_tools.id")
        .select("testing_tools.*, COUNT(sites.id) as site_count")
        .order("COUNT(sites.id) DESC")

    add_breadcrumb("technologies", technologies_path)
    add_breadcrumb("testing tools")
  end

  def show
    @testing_tool = TestingTool.friendly.find(params[:id])
    @base_query = @testing_tool.sites
      .where.not(published_at: nil)
      .order(created_at: :desc)

    @results_count = @base_query.count
    set_pagination_params

    @sites = @base_query.offset((@current_page - 1) * @items_per_page).limit(@items_per_page)

    add_breadcrumb("technologies", technologies_path)
    add_breadcrumb("testing tools", testing_tool_tech_stacks_path)
    add_breadcrumb(@testing_tool.name.downcase)
  end
end
