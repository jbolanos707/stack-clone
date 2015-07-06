require 'rails_helper'

describe "the log in process" do
  it "will log the user in" do
    visit new_sessions_path
    user = FactoryGirl.create(:user)
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_content "You've been logged in"
  end

  it "will flash an alert if the form is not filled out" do
    visit new_sessions_path
    click_button 'Log in'

    expect(page).to have_content "There was a problem logging you in."
  end

  it "will log out a user" do
    visit new_sessions_path
    user = FactoryGirl.create(:user)
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    click_on 'Log Out'

    expect(page).to have_content "You've been logged out successfully."
  end
end
