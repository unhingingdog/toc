require 'spec_helper'
describe DisputesController do
  it "displays an error for a missing dispute" do
    get :show, id: "not-here"
    expect(response).to redirect_to(disputes_path)
    message = "The dispute you were looking for could not be found."
    expect(flash[:alert]).to eql(message)
  end
end
