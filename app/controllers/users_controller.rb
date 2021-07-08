class UsersController < ApplicationController
  skip_before_action :authenticate, only: [:new, :create]
  before_action :set_user, only: [:show, :edit, :update]
  before_action :ensure_correct_user, only: [:edit, :update]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_prams)
    if @user.save
      flash[:success] = "登録されました"
      redirect_to user_path(@user)
    else
      flash[:warning] = "登録できません"
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_prams)
      flash[:success] = "会員情報が更新されました"
      redirect_to @user
    else
      render :edit
    end
  end
    

  private

  def user_prams
    params.require(:user).permit(:nickname,
          :first_name, :last_name, :address, :mail, :password, :password_comfirmation, :birthday)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def ensure_correct_user
    user = User.find(params[:id])
    if session[:user_id] != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end
end
