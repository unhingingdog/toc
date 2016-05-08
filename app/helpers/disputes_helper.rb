module DisputesHelper
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def set_dispute_respondent
      @respondent_user = User.find_by_name(params[:dispute][:respondent_username])
    end

end
