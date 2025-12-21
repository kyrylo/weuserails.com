class UpvotesController < ApplicationController
  # <rails-lens:routes:begin>
  # ROUTE: /upvotes, name: upvotes, via: GET
  # <rails-lens:routes:end>
  def index
    @upvotes = Current.user.upvotes.excluding_own_submissions(Current.user).includes(:site)
  end

  # <rails-lens:routes:begin>
  # ROUTE: /upvotes, name: upvotes, via: POST
  # <rails-lens:routes:end>
  def create
    @site = Site.friendly.find(params[:site_id])
    upvote = Current.user.upvotes.build(site: @site)
    upvote.save
  end

  # <rails-lens:routes:begin>
  # ROUTE: /upvotes/:id, name: upvote, via: DELETE
  # <rails-lens:routes:end>
  def destroy
    @site = Site.friendly.find(params[:id])
    upvote = Current.user.upvotes.find_by(site: @site)
    upvote.destroy
  end
end
