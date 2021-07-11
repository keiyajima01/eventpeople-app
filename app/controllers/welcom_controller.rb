class WelcomController < ApplicationController
  skip_before_action :authenticate

  def index
    @events = Event.page(params[:page]).per(10).where("date_open > ?", Time.zone.now).order(:date_open)
    now = Time.current
    @days_ago = now.ago(3.days)
  end
end
