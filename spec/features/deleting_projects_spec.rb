require 'spec_helper'

feature "Deleting a dispute" do
  before do
    visit '/'
    user = FactoryGirl.create(:user)
    click_link 'Sign in'
    fill_in 'Name', with: user.name
    fill_in 'Password', with: user.password
    click_button 'Sign in'
  end

  scenario "Deleting a dispute" do
    FactoryGirl.create(:dispute, title: "The fridge is broken", user_id: 1)
    visit "/users/1"
    click_link "The fridge is broken"
    click_link "Revoke Dispute"
    expect(page).to have_content("Dispute has been revoked.")

    visit "/users/1"
    expect(page).to have_no_content("The fridge is broken")
  end
end
