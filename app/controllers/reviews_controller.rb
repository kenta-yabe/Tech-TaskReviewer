class ReviewsController < ApplicationController
  before_action :require_user_logged_in
   
  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      flash[:success] = 'レビューを投稿しました。'
      redirect_to review_purpose_path(@review.purpose) 
    else
      flash[:danger] = 'レビューの投稿に失敗しました。'
      redirect_to review_purpose_path(@review.purpose)
    end
  end

  def destroy
    @purpose = Purpose.find_by(id: params[:purpose_id])
    review = current_user.reviews.find(params[:id])
    review.destroy if review
    flash[:success] = 'レビューを削除しました。'
    redirect_to review_purpose_path(@purpose) 
  end

  def edit
    @review = current_user.reviews.find(params[:id])
    @purpose = Purpose.find_by(id: params[:purpose_id])
     unless @review
      redirect_to review_purpose_path(@purpose) 
     end
  end

  def update
    @review = current_user.reviews.find(params[:id])
    @purpose = Purpose.find_by(id: params[:purpose_id])
    
        if @review.update(review_params)
          flash[:success] = 'タスクの編集に成功しました。'
          redirect_to review_purpose_path(@purpose) 
        else
          flash.now[:danger] = 'レビューの編集に失敗しました。'
          render :edit
        end
  end
  
  private
  
  def review_params
    params.require(:review).permit(:purpose_id, :content, :id)
  end
end
