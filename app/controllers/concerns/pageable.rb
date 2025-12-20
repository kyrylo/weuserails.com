module Pageable
  private

  def set_pagination_params
    @items_per_page = 20
    @current_page = [ params[:page].to_i, 1 ].max
    @total_pages = (@results_count.to_f / @items_per_page).ceil
    @next_page = @current_page < @total_pages
    @prev_page = @current_page > 1
  end
end
