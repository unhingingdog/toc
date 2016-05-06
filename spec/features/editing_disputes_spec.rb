require 'spec_helper'

feature "Editing disputes" do
  before do
    visit '/'
    click_link 'Sign in'
    user = FactoryGirl.create(:user)
    fill_in 'Name', with: user.name
    fill_in 'Password', with: user.password
    click_button 'Sign in'

    FactoryGirl.create(:dispute, title: "Broken dishwasher")
    visit root_path
    click_link "Broken dishwasher"
    click_link "Amend Dispute"
  end

  scenario "Updating a dispute" do
    fill_in "Title", with: "paying for broken dishwasher"
    click_button "Amend Dispute"

    expect(page).to have_content("Dispute has been amended.")
  end

  scenario "Amending a dispute with invalid attributes is bad" do
    fill_in "Title", with: ""
    click_button "Amend Dispute"

    expect(page).to have_content("Dispute has not been amended.")
  end
end
