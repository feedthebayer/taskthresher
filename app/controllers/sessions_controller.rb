class SessionsController < Clearance::SessionsController
  def create
    @user = authenticate(params)

    sign_in(@user) do |status|
      if status.success?
        redirect_back_or url_after_create
      else
        flash.now[:alert] = "Uh oh, your info is incorrect."
        render template: "sessions/new", status: :unauthorized
      end
    end
  end
end
