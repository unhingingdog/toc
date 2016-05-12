class DisputesController < ApplicationController
  include DisputesHelper
  before_action :set_dispute, only: [:show, :edit, :update, :destroy]
  before_action :require_signin, except: [:show, :index]

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
    @dispute.respondent  = set_dispute_respondent
    if @dispute.save
      flash[:notice] = 'Dispute has been lodged'
      redirect_to @dispute
    else
      flash[:alert] = "Dispute was not created"
      render 'new'
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
end
