class RubyOnRailsWebsites::BackgroundJobLibraryTechStacksController < ApplicationController
  include Pageable

  allow_unauthenticated_access

  def index
    @background_job_libraries =
      BackgroundJobLibrary.joins(:sites)
        .merge(Site.published)
        .group("background_job_libraries.id")
        .select("background_job_libraries.*, COUNT(sites.id) as site_count")
        .order("COUNT(sites.id) DESC")

    add_breadcrumb("technologies", technologies_path)
    add_breadcrumb("background job libraries")
  end

  def show
    @background_job_library = BackgroundJobLibrary.friendly.find(params[:id])
    @base_query = @background_job_library.sites
      .where.not(published_at: nil)
      .order(created_at: :desc)

    @results_count = @base_query.count
    set_pagination_params

    @sites = @base_query.offset((@current_page - 1) * @items_per_page).limit(@items_per_page)

    add_breadcrumb("technologies", technologies_path)
    add_breadcrumb("background job libraries", background_job_library_tech_stacks_path)
    add_breadcrumb(@background_job_library.name.downcase)
  end
end
