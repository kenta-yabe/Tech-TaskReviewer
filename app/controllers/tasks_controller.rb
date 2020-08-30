class TasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :current_purpose, only: [:edit, :destroy, :update]
  
  def create
    @purpose = current_user.purposes.find_by(id: params[:purpose_id])
    @task = @purpose.tasks.build(task_params)
    if @task.save
      flash[:success] = 'タスクの登録に成功しました。'
      redirect_to @purpose
    else
      flash[:danger] = 'タスクの登録に失敗しました。'
      redirect_to @purpose
    end
  end

  def destroy
    @task.destroy
    flash[:success] = 'タスクを削除しました。'
    redirect_back(fallback_location: root_path)
  end

  def edit
  end
  
  def update
    if params[:i]=="2"
      @task.update(task_params)
      redirect_to @purpose
    else
      if params[:i]=="1"
        if @task.update(task_params)
          redirect_to @purpose
        else
          flash[:danger] = 'タスクの優先・非優先処理に失敗しました。'
          redirect_to @purpose
        end
      else
        if @task.update(task_params)
          flash[:success] = 'タスクの編集に成功しました。'
          redirect_to @purpose
        else
          flash.now[:danger] = 'タスクの編集に失敗しました。'
          render :edit
        end
      end
    end
  end
  
  #def priority
   # @task = Task.find(params[:id])
    #@task.update(priority: true)
    #redirect_to @purpose
  #end
  
  private
  
  def task_params
    params.require(:task).permit(:content, :priority, :check)
  end
  
  def current_purpose
    @purpose = current_user.purposes.find_by(id: params[:purpose_id])
    @task = @purpose.tasks.find_by(id: params[:id])
     
     unless @purpose
      redirect_to root_url
     end
   
    
     unless @task
      redirect_to root_url
     end
  end

  
end
