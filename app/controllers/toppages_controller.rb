class ToppagesController < ApplicationController
  def index
    if logged_in?
      #優先タスク表示用
      @purposes = current_user.purposes
      # purposesをviewでサイクル, サイクル内でpurpose.tasks.where(priority: true)を取得し、それを2段階目のサイクルで表示する
      
      #フォロワー目標表示用
      #followings=find.
      @follow_users = current_user.followings
      #@comments = purposes.commnets()
    end
  end
end
