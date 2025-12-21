class RubyOnRailsWebsites::TemplateEngineTechStacksController < ApplicationController
  include Pageable

  allow_unauthenticated_access

  # <rails-lens:routes:begin>
  # ROUTE: /rails-web-apps/by-template-engine, name: template_engine_tech_stacks, via: GET
  # <rails-lens:routes:end>
  def index
    @template_engines =
      TemplateEngine
        .joins(:sites)
        .merge(Site.published)
        .group("template_engines.id")
        .select("template_engines.*, COUNT(sites.id) as site_count")
        .order("COUNT(sites.id) DESC")

    add_breadcrumb("technologies", technologies_path)
    add_breadcrumb("template engines")
  end

  # <rails-lens:routes:begin>
  # ROUTE: /rails-web-apps/by-template-engine/:id, name: template_engine_tech_stack, via: GET
  # <rails-lens:routes:end>
  def show
    @template_engine = TemplateEngine.friendly.find(params[:id])
    @base_query = @template_engine.sites
      .where.not(published_at: nil)
      .order(created_at: :desc)

    @results_count = @base_query.count
    set_pagination_params

    @sites = @base_query.offset((@current_page - 1) * @items_per_page).limit(@items_per_page)

    add_breadcrumb("technologies", technologies_path)
    add_breadcrumb("template engines", template_engine_tech_stacks_path)
    add_breadcrumb(@template_engine.name.downcase)
  end
end
