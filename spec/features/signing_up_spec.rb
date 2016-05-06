require 'spec_helper'

feature 'Signing up' do
  scenario 'Sucessful sign up' do
    visit root_path
    click_link 'Sign up'
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"

    expect(page).to have_content("You have signed up sucessfully.")
  end
end