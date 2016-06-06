require 'spec_helper'

feature 'Creating disputes' do
  before do
    visit '/'
    user = FactoryGirl.create(:user)
    click_link 'Sign in'
    fill_in 'Name', with: user.name
    fill_in 'Password', with: user.password
    click_button 'Sign in'
  end

  scenario 'can create a dispute' do
    click_link 'Lodge Dispute'
    fill_in 'dispute_title', with: "random dispute."
    fill_in 'dispute_situation', with: "the situation."
    fill_in 'dispute_issue', with: "This is the issue."
    select '5', from: 'dispute_crowd_size'
    click_button 'Lodge Dispute'
    expect(page).to have_content('Dispute has been lodged')
  end

  scenario "cannot create a dispute without situation" do
    click_link 'Lodge Dispute'
    fill_in 'dispute_title', with: "random dispute."
    fill_in 'dispute_situation', with: ""
    fill_in 'dispute_issue', with: "This is the issue."
    select '5', from: 'dispute_crowd_size'
    click_button 'Lodge Dispute'

    expect(page).to have_content("Dispute was not created")
    expect(page).to have_content("can't be blank")
  end

  scenario "cannot create a dispute without a title" do
    click_link 'Lodge Dispute'
    fill_in 'dispute_title', with: ""
    fill_in 'dispute_situation', with: "hello"
    fill_in 'dispute_issue', with: "This is the issue."
    select '5', from: 'dispute_crowd_size'
    click_button 'Lodge Dispute'

    expect(page).to have_content("Dispute was not created")
    expect(page).to have_content("can't be blank")
  end

  scenario "cannot create a dispute without an issue" do
    click_link 'Lodge Dispute'
    fill_in 'dispute_title', with: "hello"
    fill_in 'dispute_situation', with: "hello"
    fill_in 'dispute_issue', with: ""
    select '5', from: 'dispute_crowd_size'
    click_button 'Lodge Dispute'

    expect(page).to have_content("Dispute was not created")
    expect(page).to have_content("can't be blank")
  end

  scenario "cannot create a dispute without a crowd size" do
    click_link 'Lodge Dispute'
    fill_in 'dispute_title', with: "hello"
    fill_in 'dispute_situation', with: "hello"
    fill_in 'dispute_issue', with: ""
    click_button 'Lodge Dispute'

    expect(page).to have_content("Dispute was not created")
    expect(page).to have_content("can't be blank")
  end

end
