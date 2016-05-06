require 'spec_helper'

feature "Deleting a dispute" do
  before do
    visit '/'
    click_link 'Sign in'
    user = FactoryGirl.create(:user)
    fill_in 'Name', with: user.name
    fill_in 'Password', with: user.password
    click_button 'Sign in'
  end
  scenario "Deleting a dispute" do
    FactoryGirl.create(:dispute, title: "The fridge is fucked")

    visit root_path

    click_link "The fridge is fucked"
    click_link "Revoke Dispute"

    expect(page).to have_content("Dispute has been revoked.")

    visit "/"

    expect(page).to have_no_content("The fridge is fucked")
  end
end
