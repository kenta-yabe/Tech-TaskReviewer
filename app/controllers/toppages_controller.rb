class ToppagesController < ApplicationController
  def index
    if logged_in?
      #優先タスク表示用
      #@priory_tasks = current_user.purposes.tasks.order(id: :desc).page(params[:page])
      
      #フォロワー目標表示用
      #followings=find.
      #@follower_purposes = followings.purposes
      #@follower_comments = purposes.comments()
      #@comments = purposes.commnets()
    end
  end
end
