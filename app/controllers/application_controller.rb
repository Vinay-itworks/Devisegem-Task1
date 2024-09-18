class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  private
  def check_admin!
    redirect_to root_path, { alert: "You do not have access to this page." } unless current_user.admin?
  end
end
