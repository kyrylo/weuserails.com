class UpvotesController < ApplicationController
  def index
    @upvotes = Current.user.upvotes.excluding_own_submissions(Current.user).includes(:site)
  end

  def create
    @site = Site.friendly.find(params[:site_id])
    upvote = Current.user.upvotes.build(site: @site)
    upvote.save
  end

  def destroy
    @site = Site.friendly.find(params[:id])
    upvote = Current.user.upvotes.find_by(site: @site)
    upvote.destroy
  end
end
