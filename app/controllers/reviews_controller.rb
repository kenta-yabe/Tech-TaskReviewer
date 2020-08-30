class ReviewsController < ApplicationController
  before_action :require_user_logged_in
   
  def create
    #@purpose = Purpose.find(params[:][:purpose_id]) #投稿先の目標を指定
    @review = current_user.reviews.build(review_params)
    @purpose = @review.purpose
    @review.save
    flash[:success] = 'コメントを投稿しました。'
    redirect_to review_purpose_path(@purpose) 
  end

  def destroy
    @purpose =　Purpose.find(params[:purpose_id])
    review = current_user.reviews.find(params[:id])
    review.destroy if review
    flash[:success] = 'コメントを削除しました。'
    redirect_to review_purpose_path(@purpose) 
  end

  def edit
    @review = current_user.reviews.find_by(id: params[:id])
    @purpose = Purpose.find_by(id: params[:purpose_id])
     unless @review
      redirect_to review_purpose_path(@purpose) 
     end
  end

  def update
    @review = current_user.reviews.find_by(id: params[:id])
    @purpose = Purpose.find_by(id: params[:purpose_id])
    
        if @review.update(review_params)
          flash[:success] = 'タスクの編集に成功しました。'
          redirect_to review_purpose_path(@purpose) 
        else
          flash.now[:danger] = 'コメントの編集に失敗しました。'
          redirect_to review_purpose_path(@purpose) 
        end
  end
  
  private
  
  def review_params
    params.require(:review).permit(:purpose_id, :content)
  end
end
