class WelcomController < ApplicationController
  skip_before_action :authenticate

  def index
    @events = Event.all
    now = Time.current
    @days_ago = now.ago(3.days)
  end
end
