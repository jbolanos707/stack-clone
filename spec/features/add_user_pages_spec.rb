require 'rails_helper'

describe "sign up process" do
  it "signs a new user up" do
    visit root_path
    fill_in 'Email', :with => 'test@test.com'
    fill_in 'Password', :with => 'test123'
    fill_in 'Password confirmation', :with => 'test123'
    fill_in 'Username', :with => "johdoe"
    click_button 'Sign Up'
    expect(page).to have_content "Welcome to Stack Overflow. Please enter your email and password"
  end

  it "shows flashes and alert when the form is not filled out" do
    visit root_path
    click_button 'Sign Up'
    expect(page).to have_content "There was a problem creating your account. Please try again."
  end
end
