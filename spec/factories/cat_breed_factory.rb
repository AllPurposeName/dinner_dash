FactoryGirl.define do
  factory :cat_breed do
    association :cat, factory: :cat, id: 1
    association :breed, factory: :breed, id: 1
  end
end
