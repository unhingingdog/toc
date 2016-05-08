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

end
