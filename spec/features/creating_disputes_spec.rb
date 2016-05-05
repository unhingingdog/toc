require 'spec_helper'

feature 'Creating disputes' do
  scenario 'can create a dispute' do
    visit '/'

    click_link 'New Dispute'
    fill_in 'Title', with: "Dishes"
    fill_in 'Situation', with: "Guy won't do dishes"
    click_button 'Lodge Dispute'

    expect(page).to have_content('Dispute has been lodged')
  end
end
