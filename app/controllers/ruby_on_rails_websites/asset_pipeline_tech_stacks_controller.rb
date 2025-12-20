class RubyOnRailsWebsites::AssetPipelineTechStacksController < ApplicationController
  include Pageable

  allow_unauthenticated_access

  def index
    @asset_pipelines =
      AssetPipeline
        .joins(:sites)
        .merge(Site.published)
        .group("asset_pipelines.id")
        .select("asset_pipelines.*, COUNT(sites.id) as site_count")
        .order("COUNT(sites.id) DESC")

    add_breadcrumb("technologies", technologies_path)
    add_breadcrumb("asset pipelines")
  end

  def show
    @asset_pipeline = AssetPipeline.friendly.find(params[:id])
    @base_query = @asset_pipeline.sites
      .where.not(published_at: nil)
      .order(created_at: :desc)

    @results_count = @base_query.count
    set_pagination_params

    @sites = @base_query.offset((@current_page - 1) * @items_per_page).limit(@items_per_page)

    add_breadcrumb("technologies", technologies_path)
    add_breadcrumb("asset pipelines", asset_pipeline_tech_stacks_path)
    add_breadcrumb(@asset_pipeline.name.downcase)
  end
end
