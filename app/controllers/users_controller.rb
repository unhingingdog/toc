class UsersController < ApplicationController
  include UsersHelper
  before_action :set_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      flash[:notice] = "You have signed up sucessfully. Now logged in. Start voting!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @applicant_disputes = Dispute.where(user: @user)
    @respondent_disputes = Dispute.where(respondent: @user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
