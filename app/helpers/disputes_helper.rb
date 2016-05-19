module DisputesHelper
    #sets dispute respondent using respondent_username form param
    def set_dispute_respondent
      @respondent_user = User.find_by_name(params[:dispute][:respondent_username])
    end

    def logged_in?
      !current_user.nil?
    end

    def dispute_belongs_to_current_user?
      session[:user_id] == @dispute.user.id
    end

end
