class TasksController < ApplicationController
  before_action :require_login
  respond_to :html, :js

  def create
    @task = current_user.tasks.new(task_params)
    @new_task = Task.new

    if !@task.save
      flash.now[:error] = "Oops, there was a problem saving the task"
    end

    respond_with(@task) do |format|
      format.html { redirect_to signed_in_root_path }
    end
  end

  def destroy
    @task = current_user.tasks.find(params[:id])

    if !@task.destroy
      flash.now[:error] = "Oops, there was a problem deleting the task"
    end

    respond_with(@task) do |format|
      format.html { redirect_to signed_in_root_path }
    end
  end

  private

  def task_params
    params.require(:task).permit(:description)
  end
end
