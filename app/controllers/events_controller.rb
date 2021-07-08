class EventsController < ApplicationController
  skip_before_action :authenticate, only: :show
  before_action :set_event, only: [:show, :update, :edit, :destroy]

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = session[:user_id]
    if @event.save
      redirect_to @event, notice: "作成しました"
    else
      render 'new'
    end
  end

  def show
    @ticket = current_user && current_user.tickets.find_by(event: @event)
    @tickets = @event.tickets.includes(:user).order(:created_at)
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: "更新しました"
    else
      render 'edit'
    end
  end

  def destroy
    @event.destroy!
    redirect_to root_path, notice: "削除しました"
  end

  private

  def event_params
    params.require(:event).permit(
      :name, :type_id, :date_open, :date_close, :image, :remove_image,
      :pref_id, :place, :price, :price_detail, :needed_skill, :memo
    )
  end

  def set_event
    @event = Event.find(params[:id])
  end

end
