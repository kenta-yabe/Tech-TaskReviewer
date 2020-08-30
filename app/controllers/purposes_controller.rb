class PurposesController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:show, :edit, :destroy]
  
  def show
    @tasks = @purpose.tasks.page(params[:page])
    @task = @purpose.tasks.build
  end

  def new
    @purpose = current_user.purposes.build
  end

  def edit
     @purpose = Purpose.find(params[:id])
  end
  
  def update
    @purpose = current_user.purposes.find(params[:id])
    
    if params[:i]=="3"
      @purpose.update(purpose_params)
      redirect_to @purpose
    else
        if @purpose.update(purpose_params)
          if @purpose.complete==true
            flash[:success] = '達成目標を記録しました。'
            redirect_to complist_user_path(current_user)
          else
          flash[:success] = '目標を更新しました。'
           redirect_to @purpose
          end
        else 
          flash.now[:danger] = '目標の更新に失敗しました。'
          render :edit
        end
    end
  end

  def create
    @purpose = current_user.purposes.build(purpose_params) 
    if @purpose.save
      flash[:success] = '新しく目標を作成しました。'
      redirect_to current_user
    else
      flash.now[:danger] = '新しい目標の作成に失敗しました。'
      render :new
    end
  end

  def destroy
    @purpose.destroy
    flash[:success] = '目標を削除しました。'
    redirect_back(fallback_location: root_path)
  end
#################################################
  def done
    @purpose = current_user.purposes.find(params[:id])
  end
  
  def review
    @purpose = Purpose.find(params[:id])
    if current_user==@purpose.user
      @user = @purpose.user
      @user_reviews=@purpose.reviews.where(user_id: @purpose.user.id).order(id: :desc) 
      @reviews=@purpose.reviews.where.not(user_id: @purpose.user.id).order(id: :desc)
    else
      if @purpose.open==true
        @user = @purpose.user
        @user_reviews=@purpose.reviews.where(user_id: @purpose.user.id).order(id: :desc)
        @reviews=@purpose.reviews.where.not(user_id: @purpose.user.id).order(id: :desc)
      else
        flash[:danger] = 'この目標は非公開です。'
        redirect_to root_url
      end
    end
  end
###############################################
  private

  def purpose_params
    params.require(:purpose).permit(:content,:start_day,:end_day,:complete,:open)
  end
  
  def correct_user
    @purpose = current_user.purposes.find_by(id: params[:id])
    unless @purpose
      redirect_to root_url
    end
  end
  

end
