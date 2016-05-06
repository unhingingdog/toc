module UsersHelper
  def user_signup_button_action
    @user.new_record? ? "Sign up" : "Update"
  end
end
