FactoryGirl.define do
  factory :user do
    username "someusername"
    password "password"
    role 0
    full_name "First Last"
    email "example@example.com"
  end

end
