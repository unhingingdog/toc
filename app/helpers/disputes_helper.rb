module DisputesHelper
    #sets dispute respondent using respondent_username form param
    def set_dispute_respondent
      respondent = User.find_by_name(params[:dispute][:respondent_username])
      @dispute.respondent  = respondent
    end

    def respondent_is_a_user?
      !@dispute.respondent.nil?
    end

    def logged_in?
      !current_user.nil?
    end

    def dispute_belongs_to_current_user?
      session[:user_id] == @dispute.user.id
    end

    def settled?
      @dispute.votes_for.size >= @dispute.crowd_size
    end

    def winner
      @dispute.get_upvotes.size > @dispute.get_downvotes.size ? "YEA!" : "NAY!"
    end

end
