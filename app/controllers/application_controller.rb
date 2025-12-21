class ApplicationController < ActionController::Base
  include Authentication, Breadcrumbs
  include Lapsoss::RailsControllerContext

  before_action :set_lapsoss_user_context

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  # allow_browser versions: :modern

  private

  def set_lapsoss_user_context
    return unless Current.user

    Lapsoss.current_scope.set_user(id: Current.user.id)
  end
end
