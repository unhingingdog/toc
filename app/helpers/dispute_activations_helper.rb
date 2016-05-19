module DisputeActivationsHelper

  def log_in(respondent_id)
    session[:user_id] = respondent_id
  end

end
