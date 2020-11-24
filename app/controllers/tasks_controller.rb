class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = current_user.tasks
  end

  def new
    @task = Task.new
  end

  def show

  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      flash[:success] = "Task Created"
      redirect_to tasks_path
    else
      flash[:error] = "Error #{@task.errors.full_messages}"
      render :new
    end
  end
  def edit

  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end
  private

  def set_task 
    @task = current_user.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:item)
  end
end
