class RubyOnRailsWebsites::RubyImplementationTechStacksController < ApplicationController
  include Pageable

  allow_unauthenticated_access

  # <rails-lens:routes:begin>
  # ROUTE: /rails-web-apps/by-ruby-implementation, name: ruby_implementation_tech_stacks, via: GET
  # <rails-lens:routes:end>
  def index
    @ruby_implementations =
      RubyImplementation.joins(:sites)
        .merge(Site.published)
        .group("ruby_implementations.id")
        .select("ruby_implementations.*, COUNT(sites.id) as site_count")
        .order("COUNT(sites.id) DESC")

    add_breadcrumb("technologies", technologies_path)
    add_breadcrumb("ruby implementations")
  end

  # <rails-lens:routes:begin>
  # ROUTE: /rails-web-apps/by-ruby-implementation/:id, name: ruby_implementation_tech_stack, via: GET
  # <rails-lens:routes:end>
  def show
    @ruby_implementation = RubyImplementation.friendly.find(params[:id])
    @base_query = @ruby_implementation.sites
      .where.not(published_at: nil)
      .order(created_at: :desc)

    @results_count = @base_query.count
    set_pagination_params

    @sites = @base_query.offset((@current_page - 1) * @items_per_page).limit(@items_per_page)

    add_breadcrumb("technologies", technologies_path)
    add_breadcrumb("ruby implementations", ruby_implementation_tech_stacks_path)
    add_breadcrumb(@ruby_implementation.name.downcase)
  end
end
