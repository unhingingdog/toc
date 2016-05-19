module ApplicationHelper
  def title(*parts)
    unless parts.empty?
      title_content = (parts << "TOC").join(" - ")
      content_for :title do
        title_content
      end
    end
  end

  def button_action
    @dispute.new_record? ? "Lodge" : "Amend"
  end

  #sets current user using session hash
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
