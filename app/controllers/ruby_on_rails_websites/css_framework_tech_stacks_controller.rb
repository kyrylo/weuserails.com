class RubyOnRailsWebsites::CssFrameworkTechStacksController < ApplicationController
  include Pageable

  allow_unauthenticated_access

  def index
    @css_frameworks =
      CssFramework.joins(:sites)
        .merge(Site.published)
        .group("css_frameworks.id")
        .select("css_frameworks.*, COUNT(sites.id) as site_count")
        .order("COUNT(sites.id) DESC")

    add_breadcrumb("technologies", technologies_path)
    add_breadcrumb("css frameworks")
  end

  def show
    @css_framework = CssFramework.friendly.find(params[:id])
    @base_query = @css_framework.sites
      .where.not(published_at: nil)
      .order(created_at: :desc)

    @results_count = @base_query.count
    set_pagination_params

    @sites = @base_query.offset((@current_page - 1) * @items_per_page).limit(@items_per_page)

    add_breadcrumb("technologies", technologies_path)
    add_breadcrumb("css frameworks", css_framework_tech_stacks_path)
    add_breadcrumb(@css_framework.name.downcase)
  end
end
