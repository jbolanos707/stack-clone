require 'rails_helper'

describe "adding a question" do
  it "allow user to add a question" do

    question = FactoryGirl.create(:question)
    visit new_sessions_path
    fill_in 'Email', with: question.user.email
    fill_in 'Password', with: question.user.password
    click_button 'Log in'
    click_link question.user.username
    click_link 'New Question'
    fill_in 'Title', with: question.title
    fill_in 'Body', with: question.body
    click_button 'Create Question'

    expect(page).to have_content "Your question has been posted"
  end

  it "will flash an alert if the form is blank" do
    user = FactoryGirl.create(:user)
    visit new_sessions_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    click_link user.username
    click_link 'New Question'
    click_button 'Create Question'

    expect(page).to have_content "Something went wrong. You idiot."
  end
end
