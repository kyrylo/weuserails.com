class RubyOnRailsWebsites::DatabaseTechStacksController < ApplicationController
  include Pageable

  allow_unauthenticated_access

  def index
    @databases =
      Database.joins(:sites)
        .merge(Site.published)
        .group("databases.id")
        .select("databases.*, COUNT(sites.id) as site_count")
        .order("COUNT(sites.id) DESC")

    add_breadcrumb("technologies", technologies_path)
    add_breadcrumb("databases")
  end

  def show
    @database = Database.friendly.find(params[:id])
    @base_query = @database.sites
      .where.not(published_at: nil)
      .order(created_at: :desc)

    @results_count = @base_query.count
    set_pagination_params

    @sites = @base_query.offset((@current_page - 1) * @items_per_page).limit(@items_per_page)

    add_breadcrumb("technologies", technologies_path)
    add_breadcrumb("databases", database_tech_stacks_path)
    add_breadcrumb(@database.name.downcase)
  end
end
