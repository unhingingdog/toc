class DisputesController < ApplicationController
  include DisputesHelper
  include ApplicationHelper
  before_action :set_dispute, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :require_signin, except: [:show, :index, :landing, :carousel]

  def landing
  end

  def carousel
    @dispute = Dispute.where(activated: true).order("RANDOM()").first
     if current_user && current_user.voted_for?(@dispute) || settled?
       redirect_to carousel_path
     end
  end

  def index
    @disputes = Dispute.all
  end

  def show
  end

  def new
    @dispute = Dispute.new
  end

  def create
    @dispute = Dispute.new(dispute_params)
    @dispute.user = current_user
    #helper method to set respondent with :respondent_username .
    set_dispute_respondent
    if respondent_is_a_user?
      if @dispute.save
        DisputeMailer.dispute_activation(@dispute).deliver_now
        flash[:notice] = "Dispute has been lodged. Awaiting
                                        #{@dispute.respondent.name}'s email  acceptance."
        redirect_to root_url
      else
        flash[:alert] = "Dispute was not created"
        render 'new'
      end
    else
      if @dispute.save
        @dispute.update_attribute(:activated, true)
        flash[:notice] = "Dispute has been lodged."
        redirect_to @dispute
      else
        flash[:alert] = "Dispute was not created"
        render 'new'
      end
    end
  end

  def edit
  end

  def update
    @dispute.update(dispute_params)
    if @dispute.save
      flash[:notice] = "Dispute has been amended."
      redirect_to @dispute
    else
      flash[:alert] = "Dispute has not been amended."
      render 'edit'
    end
  end

  def destroy
    @dispute.destroy
    flash[:notice] = "Dispute has been revoked."
    redirect_to root_path
  end

  def upvote
    @dispute.upvote_from current_user
    redirect_to @dispute
  end

  def downvote
    @dispute.downvote_from current_user
    redirect_to @dispute
  end

  private

  def dispute_params
    params.require(:dispute).permit(:title, :situation, :respondent_username)
  end

  def set_dispute
    @dispute = Dispute.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The dispute you were looking" +
                    " for could not be found."
    redirect_to disputes_path
  end

  def require_signin
    if current_user.nil?
      flash[:error] = "You need to sign up or sign in to continue."
      redirect_to signin_url
    end
  end

  def settled?
    @dispute.votes_for.size > 10
  end
end
