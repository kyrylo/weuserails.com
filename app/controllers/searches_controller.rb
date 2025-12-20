class SearchesController < ApplicationController
  include Pageable

  allow_unauthenticated_access

  def show
    @query = params[:q]

    @base_query =
      if @query.present?
        Site.full_text_search(@query)
      else
        Site.none
      end

    @base_query = @base_query
      .includes(:categories)
      .includes(:upvotes)
      .where.not(published_at: nil)

    @results_count = @base_query.count
    set_pagination_params

    @sites = @base_query.offset((@current_page - 1) * @items_per_page).limit(@items_per_page)
  end
end
