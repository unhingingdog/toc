class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.where(:name => params[:signin][:name]).first

    if user && user.authenticate(params[:signin][:password])
      session[:user_id] = user.id
      flash[:notice] = "Signed in sucessfully."

      redirect_to "/"
    else
      flash[:error] = "User does not exist"
      render 'new'
    end
  end
end
