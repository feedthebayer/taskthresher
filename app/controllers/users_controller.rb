class UsersController < Clearance::UsersController
  before_action :require_login

  def show
    @tasks = current_user.tasks
    @new_task = Task.new
  end
end
