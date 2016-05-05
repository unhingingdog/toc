require 'spec_helper'

feature "Viewing disputes" do
  scenario "Lising disputes " do
    dispute = FactoryGirl.create(:dispute, title: "Dishwasher")
    visit '/'
    click_link "Dishwasher"
    expect(page.current_url).to eql(dispute_url(dispute))
  end
end
