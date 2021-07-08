class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :authenticate
  helper_method :logged_in?, :current_user, :log_in?

  def authenticate
    return if logged_in?
    redirect_to root_path, alert: "ログインしてください"
  end
end
