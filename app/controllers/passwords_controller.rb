class PasswordsController < Clearance::PasswordsController
  def create
    if user = find_user_for_create
      user.forgot_password!
      deliver_email(user)
      flash[:notice] = "We just sent you an email with reset instructions."
      redirect_to sign_in_path
    else
      flash[:error] = "Sorry, but nobody lives at that address!"
      redirect_to new_password_path
    end
  end
end
