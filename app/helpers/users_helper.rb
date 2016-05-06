module UsersHelper
  #changes button depending on whether creating or updating. No updating functionality yet.
  def user_signup_button_action
    @user.new_record? ? "Sign up" : "Update"
  end
end
