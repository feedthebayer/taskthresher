class TasksController < ApplicationController

  def create
    @task = current_user.tasks.new(task_params)

    if !@task.save
      flash[:error] = "Oops, there was a problem saving the task"
    end

    redirect_to signed_in_root_path
  end

  def destroy
    @task = current_user.tasks.find(params[:id])

    if !@task.destroy
      flash[:error] = "Oops, there was a problem deleting the task"
    end

    redirect_to signed_in_root_path
  end

  private

  def task_params
    params.require(:task).permit(:description)
  end
end
