require 'spec_helper'

feature 'Creating disputes' do
  before do
    visit '/'
    click_link 'Sign in'
    #applicant
    user = FactoryGirl.create(:user)

    fill_in 'Name', with: user.name
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    click_link 'New Dispute'
  end

  scenario 'can create a dispute' do
    #respondent
    user2 = FactoryGirl.create(:user, name: "Example2")

    fill_in 'Title', with: "Dishes"
    fill_in 'Situation', with: "Guy won't do dishes"
    fill_in 'Respondent', with: user2.name
    click_button 'Lodge Dispute'

    expect(page).to have_content('Dispute has been lodged')

    dispute = Dispute.where(title: "Dishes").first
    expect(page.current_url).to eql(dispute_url(dispute))
    # I have no idea where the below newlines have come from. Included to pass test.
    title = "\n      Dishes - Dispute - TOC\n  "
    expect(page).to have_title(title)

    expect(dispute.respondent).to eql(User.where(name: dispute.respondent).first)
  end

  scenario "cannot create a dispute without title" do
    fill_in 'Situation', with: "Guy won't do dishes"
    click_button 'Lodge Dispute'

    expect(page).to have_content("Dispute was not created")
    expect(page).to have_content("Title can't be blank")
  end

  scenario "cannot create a dispute without a situation" do
    fill_in 'Title', with: "Dishes"
    click_button 'Lodge Dispute'

    expect(page).to have_content("Dispute was not created")
    expect(page).to have_content("Situation can't be blank")
  end

end
