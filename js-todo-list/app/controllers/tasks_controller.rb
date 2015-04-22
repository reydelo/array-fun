class TasksController < ApplicationController

  def index
    @tasks = Task.all
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.update(placement: Task.count)
    if @task.save
      render json: @task
    else
      render json: @task, status: 500
    end
  end

  def update
    @task = Task.find(params[:id])
    if params[:direction]
      Task.swap(@task, params[:direction].to_i)
    end
  end

  def delete
    Task.find(params[:id]).destroy
    Task.all.order(:placement).each_with_index do |task, index|
      task.update(placement: index)
    end
  end

  private
  def task_params
    params.require(:task).permit(:description, :placement, :completed)
  end

end
