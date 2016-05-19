class DisputeActivationsController < ApplicationController
  include DisputeActivationsHelper
  def edit
    dispute = Dispute.find_by(title: params[:title])
      if dispute && !dispute.activated? && !!dispute.respondent && dispute.authenticated?(params[:id])
      dispute.update_attribute(:activated, true)
      log_in(dispute.respondent.id)
      flash[:success] = "Dispute accepted!"
      redirect_to dispute

    else
      flash[:danger] = "Invalid acceptance link"
      redirect_to root_url
    end
  end
end
