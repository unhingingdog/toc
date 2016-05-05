class DisputesController < ApplicationController
  before_action :set_dispute, only: [:show]

def index
end

def show
end

def new
  @dispute = Dispute.new
end

def create
  @dispute = Dispute.new(dispute_params)
  if @dispute.save
    flash[:notice] = 'Dispute has been lodged'
    redirect_to @dispute
  else
    flash[:alert] = "Dispute was not created"
    render 'new'
  end
end

private

def dispute_params
  params.require(:dispute).permit(:title, :situation)
end

def set_dispute
  @dispute = Dispute.find(params[:id])
end

end
