class TasksController < ApplicationController
  def index
  @tasks = Task.all

  end
  def show
  @task = Task.find(params[:id])
  end
  def new
  @task = Task.new
  end
  def create
    @task = Task.new(task_params)

    if @task.save
    date_reset
      redirect_to tasks_path
    else
      render :new
    end
  end
  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
    date_reset
      redirect_to tasks_path
    else
      render :edit
    end

  end
  def complete
    @task = Task.find(params[:id])
    if @task.is_complete == nil || @task.is_complete == false
    @task.update(is_complete: true)
    @task.update(complete_date: Date.today)
    redirect_to task_path
    else
    redirect_to task_path
    end

  end
  def destroy
    Task.find(params[:id]).destroy
  redirect_to tasks_path

  end
  private
  def task_params
    params.require(:task).permit(:task_name, :description, :is_complete, :complete_date)
  end
  def date_reset
    if @task.is_complete == nil ||  @task.is_complete == false
      @task.update(complete_date: nil)
    end
  end
end