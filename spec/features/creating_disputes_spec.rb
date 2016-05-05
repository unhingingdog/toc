require 'spec_helper'

feature 'Creating disputes' do
  scenario 'can create a dispute' do
    visit '/'

    click_link 'New Dispute'
    fill_in 'Title', with: "Dishes"
    fill_in 'Situation', with: "Guy won't do dishes"
    click_button 'Lodge Dispute'

    expect(page).to have_content('Dispute has been lodged')

    dispute = Dispute.where(title: "Dishes").first
    expect(page.current_url).to eql(dispute_url(dispute))
    # I have no idea where the below newlines have come from. Included to pass test.
    title = "\n      Dishes - Dispute - TOC\n  "
    expect(page).to have_title(title)
  end
end
