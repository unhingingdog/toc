module DisputesHelper
    #sets current user using session hash
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    #sets dispute respondent using respondent_username form param
    def set_dispute_respondent
      @respondent_user = User.find_by_name(params[:dispute][:respondent_username])
    end

end
