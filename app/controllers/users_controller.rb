class UsersController < Clearance::UsersController
  before_action :require_login, only: [:show]

  def show
    @tasks = current_user.tasks
    @new_task = Task.new
  end

  def create
    @user = user_from_params

    if @user.save
      sign_in @user
      flash[:success] = "Yay! We hope you're delighted!"
      redirect_back_or url_after_create
    else
      flash.now[:alert] = "Uh oh, make sure everything is filled in properly."
      render template: "users/new"
    end
  end
end
