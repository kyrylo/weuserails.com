class UpvotesController < ApplicationController
  def index
    @upvotes = Current.user.upvotes.excluding_own_submissions(Current.user).includes(:site)
  end

  def create
    @site = Site.friendly.find(params[:site_id])
    upvote = Current.user.upvotes.build(site: @site)
    upvote.save

    Telesink.track(
      event: "site.upvoted",
      text: "#{Current.user.nickname || Current.user.email_address.split('@').first} upvoted \"#{@site.title}\"\n#{@site.url}",
      emoji: "👍",
      properties: {
        user_id: Current.user.id,
        site_id: @site.id,
        site_title: @site.title
      }
    )
  end

  def destroy
    @site = Site.friendly.find(params[:id])
    upvote = Current.user.upvotes.find_by(site: @site)
    upvote.destroy

    Telesink.track(
      event: "site.downvoted",
      text: "#{Current.user.nickname || Current.user.email_address.split('@').first} downvoted \"#{@site.title}\"\n#{@site.url}",
      emoji: "👎",
      properties: {
        user_id: Current.user.id,
        site_id: @site.id,
        site_title: @site.title
      }
    )
  end
end
