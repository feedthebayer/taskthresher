class UsersController < Clearance::UsersController
  def show
    @tasks = current_user.tasks
    @new_task = Task.new
  end
end
