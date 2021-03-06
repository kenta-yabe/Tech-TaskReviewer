class ApplicationController < ActionController::Base
  include SessionsHelper
     
    private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def counts(user)
    @count_microposts = user.microposts.count
    @count_followings = user.followings.count
    @count_followers = user.followers.count
  end
  
  def counts(purpose)
    @count_user_reviews = purpose.reviews.where(user_id: purpose.user.id).count
    @count_other_reviews = purpose.reviews.where.not(user_id: purpose.user.id).count
  end
end
