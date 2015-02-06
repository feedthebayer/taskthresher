class UsersController < Clearance::UsersController
  def show
    @tasks = current_user.tasks
  end
end
