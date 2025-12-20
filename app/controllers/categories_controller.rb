class CategoriesController < ApplicationController
  include Pageable

  allow_unauthenticated_access

  def index
    @current_letter = params[:letter]&.upcase

    @categories = Category
      .left_joins(:sites)
      .where.not(sites: { published_at: nil })
      .group(:id)
      .order(:name)
      .select("categories.*, COUNT(sites.id) as sites_count")

    if @current_letter.present?
      @categories = @categories.where("UPPER(categories.name) LIKE ?", "#{@current_letter}%")
    end

    @sites_count = Site.where.not(published_at: nil).count
    @categories_count = Category.joins(:sites).where.not(sites: { published_at: nil }).distinct.count

    add_breadcrumb("Home", root_path)
    add_breadcrumb(@current_letter.present? ? "Categories starting with #{@current_letter}" : "Rails web apps by category")
  end

  def show
    @category = Category.find_by!(slug: params[:slug])
    @base_query = @category.sites
      .where.not(published_at: nil)
      .order(created_at: :desc)

    @results_count = @base_query.count
    set_pagination_params

    @sites = @base_query.offset((@current_page - 1) * @items_per_page).limit(@items_per_page)

    add_breadcrumb("categories", categories_path)
    add_breadcrumb(@category.name.downcase)
  end
end
