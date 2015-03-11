FactoryGirl.define do
  factory :user do
    username "someusername"
    password "password"
    full_name "First Last"
    role 0
    email "example@example.com"
  end
end
