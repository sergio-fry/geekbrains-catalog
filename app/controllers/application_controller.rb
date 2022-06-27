class ApplicationController < ActionController::Base
  include Pundit::Authorization

  protected

  def access_denied(ex)
    flash[:alert] = ex.message
    redirect_to root_path
  end

  def authenticate_admin!
    authenticate_user!

    unless current_user.role == "admin"
      flash[:alert] = "Only admins, sorry"
      redirect_to root_path
    end
  end
end
