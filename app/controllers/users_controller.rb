class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  
  def show
    @user = User.find(params[:id])
    @purposes = @user.purposes.where(complete: nil).page(params[:page])
    @review_purposes = @user.review_purposes.where(open: true).where.not(user_id: @user.id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
     
    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  ###############################################
  def complist
    @purposes = current_user.purposes.where(complete: true).order(id: :desc).page(params[:page])
  end
  ###############################################
  
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
