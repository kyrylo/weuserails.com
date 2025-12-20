class RubyOnRailsWebsites::CssProcessorTechStacksController < ApplicationController
  include Pageable

  allow_unauthenticated_access

  def index
    @css_processors =
      CssProcessor.joins(:sites)
        .merge(Site.published)
        .group("css_processors.id")
        .select("css_processors.*, COUNT(sites.id) as site_count")
        .order("COUNT(sites.id) DESC")

    add_breadcrumb("technologies", technologies_path)
    add_breadcrumb("css preprocessors")
  end

  def show
    @css_processor = CssProcessor.friendly.find(params[:id])
    @base_query = @css_processor.sites
      .where.not(published_at: nil)
      .order(created_at: :desc)

    @results_count = @base_query.count
    set_pagination_params

    @sites = @base_query.offset((@current_page - 1) * @items_per_page).limit(@items_per_page)

    add_breadcrumb("technologies", technologies_path)
    add_breadcrumb("css preprocessors", css_processor_tech_stacks_path)
    add_breadcrumb(@css_processor.name.downcase)
  end
end
