class PurposesController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:show, :edit, :destroy]
  
  def show
    @purpose = current_user.purpose.find(params[:id])
    @tasks = @purpose.tasks.order(id: :desc).page(params[:page])
    @task = @purpose.tasks.build
  end

  def new
    @purpose = current_user.purposes.build
  end

  def edit
     @purpose = Purpose.find(params[:id])
  end

  def create
    @purpose = current_user.purposes.build(purpose_params) 
    if @purpose.save
      flash[:success] = '新しく目標を作成しました。'
      redirect_to 'users/show'
    else
      @purposes = current_user.purposes.order(id: :desc).page(params[:page])
      flash.now[:danger] = '新しい目標の作成に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
    @purpose.destroy
    flash[:success] = '目標を削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private

  def purposes_params
    params.require(:purpose).permit(:content)
  end
  
  def correct_user
    @purpose = current_user.purposes.find_by(id: params[:id])
    unless @purpose
      redirect_to root_url
    end
  end
end
