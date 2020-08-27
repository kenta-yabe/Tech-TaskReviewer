class TasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :current_purpose, only: [:create,:edit, :destroy]
  
  def create
    @task = @purpose.tasks.build(task_params)
    if @task.save
      flash[:success] = 'タスクの登録に成功しました。'
      render @purpose
    else
      @tasks = @purpose.tasks.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'タスクの登録に失敗しました。'
      render @purpose
    end
  end

  def destroy
    @task.destroy
    flash[:success] = 'タスクを削除しました。'
    redirect_back(fallback_location: root_path)
  end

  def edit
    @task = @purpose.tasks.find(params[:id])
  end
  
  private
  
  def task_params
    params.require(:task).permit(:content)
  end
  
  def current_purpose
    @purpose = current_user.purpose.find_by(id: params[:purpose_id] )
    unless @purpose
      redirect_to root_url
    end
  end

  
end
