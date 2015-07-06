FactoryGirl.define do
  factory(:user) do
    email('john@doe.com')
    password('badpassword123')
    username('johndoe')
  end

  factory(:question) do
    title('What is coding?')
    body('I want to know what coding is and how to learn it.')
    user #association - ties question to user
  end

end
