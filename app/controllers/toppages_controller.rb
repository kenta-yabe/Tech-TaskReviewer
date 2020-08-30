class ToppagesController < ApplicationController
  def index
    if logged_in?
      #優先タスク表示用
      @purposes = current_user.purposes
    
      
      #フォロワー目標表示用
      #followings=find.
      @follow_users = current_user.followings
      #@comments = purposes.commnets()
    end
  end
end
