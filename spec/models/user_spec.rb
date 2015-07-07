require 'rails_helper'

describe User do
  it { should validate_presence_of :email }
  it { should validate_confirmation_of :password }
  it { should validate_presence_of :username }

  it "successfully creates a user" do
    user = FactoryGirl.create(:user)
    expect(User.exists?(user.id)).to eq(true)
  end

  it "authenticates the user's password" do
    user = FactoryGirl.create(:user)
    expect(User.authenticate(user.email, user.password)).to eq(user)
  end


  it "sends an email when the user is created" do
     user = FactoryGirl.create(:user)
     ActionMailer::Base.deliveries.last.to eq [user.email]
   end

end
